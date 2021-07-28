extends Spatial

var wait_time = 600
var minutes = 0
var seconds = 0
var timer = Timer.new()
var gamedata_logging_timer = Timer.new()

# Interval between two call to log game data
var LOGGING_PERIOD=1.0 #s


var npc_emotion
var npc_selection = 00
var npc_stages = 00
var npc_group

var npc_emotion2
var npc_selection2
var npc_stages2

var prolific_id = "undefined"

var murderer

export(bool) var DEBUG = true
export(bool) var LOCAL_LOGGING = false

signal gamedata_saved()

var URL_LOGS = "https://research.skadge.org/logs/"

func _ready():
    
    if LOCAL_LOGGING:
        URL_LOGS = "http://localhost:8080/logs/"
        
    $Player.active = false
    
    $MenuRect.hide()
    
    if DEBUG:
        
        $QuestionsExplanations.hide()
        $AudioStreamPlayer.volume_db = -80
        
    else:
        $QuestionsExplanations.show()
        $QuestionsExplanations.preHocQuestionnaire()

        var questionaire = yield($QuestionsExplanations,"questionaire_complete")

        prolific_id = questionaire
        
        $QuestionsExplanations.consent()
        var consent = yield($QuestionsExplanations,"consent_given")

        $QuestionsExplanations.big5()
        var big5_results = yield($QuestionsExplanations,"big5_complete")
        save_big5(big5_results)
        
        yield(get_tree().create_timer(0.5), "timeout")
        $QuestionsExplanations.showIntro()

        yield($QuestionsExplanations,"intro_complete")
        
        
    $Player.active = true
    
    $AudioStreamPlayer.play()
    $Countdown.visible = true
    timer.connect("timeout",self,"_on_timer_timeout") 
    timer.set_wait_time(wait_time)
    timer.set_one_shot(false)
    add_child(timer) 
    timer.start() 
    
    start_recording_gamedata()
    
func _process(_delta):
    var time = timer.time_left
    minutes = int(time/60)
    seconds = int(time)%60
    
    if minutes == 05:
        $Countdown.add_color_override("font_color", "ff0202")
    
    $Countdown.set_text(str(minutes) + ":" + ("" if (seconds >= 10) else "0" ) + str(seconds))
 
func _on_timer_timeout():

    timer.stop()
    
    $Player.active = false
    Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
    
    $QuestionsExplanations.final()
    murderer = yield($QuestionsExplanations, "player_guess")
    print(murderer)
    log_positions(murderer)
    
    yield(self, "gamedata_saved")
    

    #TODO: redirect to Prolific
    
    yield($QuestionsExplanations, "final_complete")
#    gamedata_logging_timer.stop()
    $AudioStreamPlayer.stop()
    
    get_tree().paused = true



################ Menu ################
func _on_MenuButton_pressed():
    print("pressed")
    $MenuRect.visible = true

func _on_Close_pressed():
    $MenuRect.visible = false

func _on_Aim_pressed():
    $MenuRect/AimRect.visible = true

func _on_Instructions_pressed():
    $MenuRect/InstructionsRect.visible = true


func _on_CloseAim_pressed():
    $MenuRect.visible = false
    $MenuRect/AimRect.visible = false
    $MenuRect/InstructionsRect.visible = false

################################################


# to be checked!
func _fixed_process(_delta):
    # store game state for dataset?
    pass

func get_dialogue(emotion, selection, stages, group):
    npc_emotion = emotion
    npc_selection = selection
    npc_stages = stages
    npc_group = group
    return


func start_recording_gamedata():
    
    add_child(gamedata_logging_timer)
    
    gamedata_logging_timer.connect("timeout", self, "log_positions", [])
    gamedata_logging_timer.set_wait_time(LOGGING_PERIOD)
    gamedata_logging_timer.set_one_shot(false) # Make sure it loops
    gamedata_logging_timer.start()
    
    # first data logging
    log_positions()

    
func log_positions(murderer = ""):
    var player_guess
    var gamedata = {}

    if murderer:
        print(murderer)
        
    gamedata["player_guess"] = murderer
        
    
    gamedata["timestamp"] = OS.get_unix_time()
    gamedata["ticks_msec"] = OS.get_ticks_msec()
    
    gamedata["fps"] = Performance.get_monitor(Performance.TIME_FPS)
    
    gamedata["player_x"] = $Player.global_transform.origin.x
    gamedata["player_z"] = $Player.global_transform.origin.z
    gamedata["player_rx"] = $Player.rotation_degrees[0]
    gamedata["player_ry"] = $Player.rotation_degrees[2]
    gamedata["player_rz"] = $Player.rotation_degrees[1] # Godot: up vector is Y axis

    for group in $NPCs.get_children():
        for npc in group.get_children():

            gamedata["%s_%s_x" % [group.name, npc.name]] = npc.global_transform.origin.x
            gamedata["%s_%s_z" % [group.name, npc.name]] = npc.global_transform.origin.z
            gamedata["%s_%s_rx" % [group.name, npc.name]] = npc.rotation_degrees[0]
            gamedata["%s_%s_ry" % [group.name, npc.name]] = npc.rotation_degrees[2]
            gamedata["%s_%s_rz" % [group.name, npc.name]] = npc.rotation_degrees[1] # Godot: up vector is Y axis
            
            if group.name == npc_group:
                npc_emotion2 = npc_emotion
                npc_selection2 = npc_selection
                npc_stages2 = npc_stages
            else:
                npc_selection2 = ""
                npc_stages2 = ""
                npc_emotion2 = ""
            
            print(npc_emotion2)
            print(npc_selection2)
            print(npc_stages2)
            
            gamedata["%s_%s_emotion" % [group.name, npc.name]] = npc_emotion2
            gamedata["%s_%s_selection" % [group.name, npc.name]] = npc_selection2
            gamedata["%s_%s_stages" % [group.name, npc.name]] = npc_stages2
            
    
        
    save_gamedata(gamedata)
    

func save_gamedata(data_to_send, use_ssl=false):
    # Convert data to json string:
    var query = JSON.print({"gamedata": data_to_send})

    # Add 'Content-Type' header:
    var headers = ["Content-Type: application/json"]
    var time1 = OS.get_ticks_msec()
    $HTTPRequest.request(URL_LOGS + prolific_id + "/gamedata", headers, use_ssl, HTTPClient.METHOD_POST, query)
    yield($HTTPRequest,"request_completed")
    emit_signal("gamedata_saved")
    print("ELAPSED TIME FOR SAVING LOGS: %sms" % (OS.get_ticks_msec() - time1))
    
###############################################
#log big 5
func save_big5(data_to_send, use_ssl=false):
    
    var browser = "non-browser"
    if OS.has_feature('JavaScript'):
        browser = JavaScript.eval("""
            navigator.userAgent;
        """)
    else:
        # Not running in a browser!
        pass
        
        
    # Convert data to json string:
    var query = JSON.print({"big5": data_to_send, "browser": browser})
    
    print(query)
    # Add 'Content-Type' header:
    var headers = ["Content-Type: application/json"]
    $HTTPRequest.request(URL_LOGS + prolific_id + "/big5", headers, use_ssl, HTTPClient.METHOD_POST, query)
