extends StaticBody
class_name Character

onready var anim_player = $AnimationPlayer
onready var player = get_tree().root.get_node("Game/Player")
onready var menu = get_tree().root.get_node("Game/UI")

onready var speech_bubble = $SpeechBubbleHandle/SpeechBubble
onready var speech_bubble_handle = $SpeechBubbleHandle

export(String) var username = "Character"
export(float) var max_earshot_distance = 2
export(float) var max_background_distance = 1
export(Texture) var neutral_skin

enum Expressions {NEUTRAL, ANGRY, HAPPY, SAD}
export(Expressions) var expression setget set_expression

var player_in_social_space:bool = false
var is_speaking
var is_looking_at_player
var dialogue_is_finished
var response
enum state {WAITING_FOR_ANSWER, ANSWER_RECIEVED}

var quaternion_slerp_progress = 0
var original_orientation
var target_quaternion

var returned
var visited = []

onready var convo_character = anim_player.get_parent()
onready var group_name = convo_character.get_parent().name

#var npcs = get_tree().get_root().get_node("Game/NPCs")
var enable
signal ready_to_speak(enable)

signal spoke
signal done

# Called when the node enters the scene tree for the first time.
func _ready():
#    set_fixed_process(true)
#    player.connect("spoke", player, "say()")

    
    # This vvv is incorrect, but the 'correct' version (below) causes bug #59...
    original_orientation = Quat(transform.basis)
    #original_orientation = transform.basis.get_rotation_quat()
    
#    set_expression(Expressions.NEUTRAL)
    
    # flip the tip of the speech bubble to place the speech bubble on the left of NPCs
    speech_bubble.flip_left()
    #say("My name is " + username, 5)
    
    self.connect("spoke", menu, "npc_speaking")
    self.connect("done", menu, "npc_done_speaking")

    self.connect("ready_to_speak", player, "disable_mouselook")
    
    $SocialSpace.connect("body_entered", self, "enter_social_space")
    $SocialSpace.connect("body_exited", self, "exit_social_space")
    $PersonalSpace.connect("body_entered", self, "enter_personal_space")
    $PersonalSpace.connect("body_exited", self, "exit_personal_space")
    
    #$SocialSpace.connect("input_event", self, "in_social_space")
    #$PersonalSpace.connect("ready", self, "in_social_space")
    
    $InteractionZone.connect("mouse_entered", self, "on_enter_character")
    $InteractionZone.connect("mouse_exited", self, "on_exit_character")
    $InteractionZone.connect("input_event", self, "clicked_character")
    
    $Root/Skeleton/Character.get_surface_material(0).set_shader_param("skin", neutral_skin)


func on_enter_character():
    if player_in_social_space:
        Input.set_default_cursor_shape(Input.CURSOR_HELP)

func on_exit_character():
    Input.set_default_cursor_shape(Input.CURSOR_ARROW)
    
func clicked_character(_camera, event, _click_position, _click_normal, _shape_idx):
    if player_in_social_space:
        if (event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT):
            print("clicked NPC")
            menu.makeVisible(true)
    

func check_group_speaking(npc):
    var speak = true
    var group = npc.get_parent()
    var group_members = group.get_children()
    if group_members.size() > 1:
        for i in group_members:
            if i != npc and player_in_social_space:
                speak = false
            else:
                speak = true
    else:
        speak = true
    return speak
        
func in_conversation(npc):
    var revisit = false
    if npc.get_parent() in visited:
        revisit = true
    return revisit
          
        
# Override these methods for each characters to create different behaviours
func enter_social_space(body):
    if body.get_name() == "Player" \
        and body.is_facing(get_global_transform().origin):
        
        player_in_social_space = true
        var convo_character = anim_player.get_parent()
        print("Player enters " + username + " social space")
        is_looking_at_player = true
        
        returned = in_conversation(convo_character)
        
        if returned:
            pass
        else:
            if check_group_speaking(convo_character):
                emit_signal("ready_to_speak", true)
                dialogue_setup()
            else:
                emit_signal("ready_to_speak", true)
                
        visited.append(convo_character.get_parent())


func exit_social_space(body):
    if body.get_name() == "Player":
        
        player_in_social_space = false
        print("Player exits " + username + " social space")
        is_looking_at_player = false
        target_quaternion = original_orientation
        menu.makeVisible(false)
        emit_signal("ready_to_speak", false)
    
func enter_personal_space(body):
    if body.get_name() == "Player":
        print("Player enters " + username + " personal space")
        is_looking_at_player = true
        if not player.has_met(self):
            player.meet(self)
            

func exit_personal_space(body):
    if body.get_name() == "Player":
        is_looking_at_player = false
        print("Player exits " + username + " personal space")



    
#######################################################

func is_speaking():
    return speech_bubble.is_speaking

func get_look_at_transform_basis(target,
                                 eye = self.transform.origin,
                                 up = Vector3(0,1,0)):
    # reimplemented from Godot's source at core/math/transform.cpp
    # to enable Tweening + +Z forward
    
    var v_z = -(eye - target.get_global_transform().origin)
    v_z = v_z.normalized()
    var v_y = up
    var v_x = v_y.cross(v_z)
    
    v_y = v_z.cross(v_x)
    
    v_x = v_x.normalized()
    v_y = v_y.normalized()
    
    return Transform(v_x, v_y, v_z, eye).basis

func set_expression(emotion):
    var texture_basename = neutral_skin.resource_path.split("neutral")[0]
    
    var skin
    
    match emotion:
        "neutral":
            skin = load(texture_basename + "neutral.png")
        "angry":
            skin = load(texture_basename + "angry.png")
        "happy":
            skin = load(texture_basename + "happy.png")
        "sad":
            skin = load(texture_basename + "sad.png")
            
    $Root/Skeleton/Character.get_surface_material(0).set_shader_param("skin", skin)
    
func face(object):
    target_quaternion = Quat(get_look_at_transform_basis(object))
                                                         #$Root/Skeleton.get_bone_pose(17).origin))
    


func on_rotation_finished():
    target_quaternion = null
    quaternion_slerp_progress = 0
    
func say(text, wait_time=2, force=false, speaker="npc"):
    $SpeechBubbleHandle/SpeechBubble/speech_bubble/Name.text = username
    
    if speaker == "detective":
        speech_bubble.say(text, speech_bubble.ButtonType.NONE, wait_time)
    else:
        emit_signal("spoke")
    
    if is_speaking() and not force:
        return
        
    if !player_in_social_space:
        yield(speech_bubble,"done")
        return
        
    var dist = distance_to(player)
    
    #For background dialogue
    if force:
        speech_bubble.say(text, wait_time, "npc")
    
    # NPC too far from Player? we don't hear it!
    if dist > max_earshot_distance:
        return
    
    speech_bubble.say(text, speech_bubble.ButtonType.NONE, wait_time, "npc")
    
    yield(speech_bubble,"done")
    emit_signal("done")

func distance_to(object):
    return get_global_transform().origin.distance_to(object.get_global_transform().origin)

func quaternions_distance(q1, q2):
    # -> 0 if same orientation, -> 1 if 180deg apart
    # based on https://math.stackexchange.com/a/90098
    var dist = 1 - pow(q1.dot(q2), 2)
    #print(dist)
    
    return dist

    
func _physics_process(_delta):
    
    if target_quaternion:
        
        var current_quaternion = Quat(transform.basis)
        
        if quaternions_distance(current_quaternion, target_quaternion) > 0.1 or $RotationTween.is_active():
            # large rotation? interpolate!
            
            if not $RotationTween.is_active():
                $RotationTween.interpolate_property(self, "quaternion_slerp_progress", 0, 1, 2, Tween.TRANS_LINEAR, Tween.EASE_IN)
                $RotationTween.connect("tween_all_completed", self, "on_rotation_finished")
                $RotationTween.start()
            
            set_transform(Transform(current_quaternion.slerp(target_quaternion, quaternion_slerp_progress), transform.origin))
        
        else:
            # small rotation? set it directly
            set_transform(Transform(target_quaternion, transform.origin))
            target_quaternion = null
            
            ## FOR HEAD-ONLY ROTATION
            #var tr = $Root/Skeleton.get_bone_pose(17)
            #$Root/Skeleton.set_bone_pose(17, 
            #                        Transform(Quat(tr.basis).slerp(target_quaternion, quaternion_slerp_progress),
            #                                  tr.origin))
            
            
    
    if speech_bubble.is_speaking:
        
        var dist = distance_to(player)

                
        var screenPos = player.camera.unproject_position($SpeechBubbleAnchorAxis/SpeechBubbleAnchor.get_global_transform().origin)
        speech_bubble_handle.position = screenPos

        # Scale the speech bubble based on distance to player
        var bubble_scale = max(0.5, min(1, 1 / dist))
        speech_bubble_handle.scale = Vector2(bubble_scale, bubble_scale)

        var _s= speech_bubble_handle.scale

    if is_looking_at_player:
        face(player)
        
    $SpeechBubbleAnchorAxis.rotation.y = -rotation.y + player.camera.get_global_transform().basis.get_euler().y


##############################################################
###########################DIALOGUE###########################
onready var pg1 = get_tree().root.get_node("Game/NPCs/ProximityGroup1")
onready var pg2 = get_tree().root.get_node("Game/NPCs/ProximityGroup2")
onready var pg3 = get_tree().root.get_node("Game/NPCs/ProximityGroup3")
onready var pg4 = get_tree().root.get_node("Game/NPCs/ProximityGroup4")
onready var pg5 = get_tree().root.get_node("Game/NPCs/ProximityGroup5")


func dialogue_setup():
    if group_name == "ProximityGroup1":
        pg1.interaction_dialogue()
    elif group_name == "ProximityGroup2":
        pg2.interaction_dialogue()
    elif group_name == "ProximityGroup3":
        pg3.interaction_dialogue()
    elif group_name == "ProximityGroup4":
        pg4.interaction_dialogue()
    elif group_name == "ProximityGroup5":
        pg5.interaction_dialogue()














