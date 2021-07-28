extends ProximityGroup

onready var player = get_tree().root.get_node("Game/Player")
onready var menu = get_tree().root.get_node("Game/UI")
onready var game = get_tree().root.get_node("Game")

var emotion
var selection
var stages setget set_group1_stage_state

signal dialogue(emotion, selection, stages, name)


# Called when the node enters the scene tree for the first time.
func _ready():
    emotion = "happy"
    stages = 0
    connect("dialogue", game, "get_dialogue")
   
func interaction_dialogue(answer = ""):
    
    var group = get_tree().get_root().get_node("Game/NPCs/ProximityGroup1")
    var npc_dialogue = []
        
    if typeof(answer) == TYPE_STRING:
        self.selection = 0
        self.stages = 0
        self.emotion = "neutral"
    
    if typeof(answer) == TYPE_ARRAY:
        if answer[0] == "...":
            print("...")
            self.selection = 0
            self.stages = 0
            self.emotion = "neutral"
        else:
            self.emotion = answer[1]
            self.selection = answer[2]
            
        print("stage: ", stages)
        print("selection:", selection)
        print("emotion: ", emotion)
    match stages:
      
            0:
              match selection:
            
                0:
                  match emotion:
                
                    "happy":
                        npc_dialogue.append("How can we help you?")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('happy', 0, 0)
                        self.stages = 1
                    "neutral":
                        npc_dialogue.append("Can we help you?")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('neutral', 0, 0)
                        self.stages = 1
                    "angry":
                        npc_dialogue.append("Uh you want something?")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('angry', 0, 0)
                        self.stages = 1
                1:
                  match emotion:
                
                    "happy":
                        npc_dialogue.append("How can we help you?")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('happy', 1, 0)
                        self.stages = 1
                    "neutral":
                        npc_dialogue.append("Can we help you?")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('neutral', 1, 0)
                        self.stages = 1
                    "angry":
                        npc_dialogue.append("Uh you want something?")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('angry', 1, 0)
                        self.stages = 1
            1:
              match selection:
            
                0:
                  match emotion:
                
                    "angry":
                        npc_dialogue.append("Sure I guess")
                        npc_dialogue.append("We can talk")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('angry', 0, 1)
                        self.stages = 2
                    "happy":
                        npc_dialogue.append("Of course!")
                        npc_dialogue.append("How can we help?")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('happy', 0, 1)
                        self.stages = 2
                    "neutral":
                        npc_dialogue.append("Sure")
                        npc_dialogue.append("Yeah how can we help?")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('neutral', 0, 1)
                        self.stages = 2
                1:
                  match emotion:
                
                    "angry":
                        npc_dialogue.append("Jeez")
                        npc_dialogue.append("We can talk")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('angry', 1, 1)
                        self.stages = 2
                    "happy":
                        npc_dialogue.append("Of course!")
                        npc_dialogue.append("How can we help?")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('happy', 1, 1)
                        self.stages = 2
                    "neutral":
                        npc_dialogue.append("Sure")
                        npc_dialogue.append("Yeah how can we help?")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('neutral', 1, 1)
                        self.stages = 2
                3:
                  match emotion:
                
                    "angry":
                        npc_dialogue.append("Sure whatever")
                        npc_dialogue.append("I guess...")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('angry', 3, 1)
                        self.stages = 2
                    "happy":
                        npc_dialogue.append("Sure we can talk to you")
                        npc_dialogue.append("What do you need from us?")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('happy', 3, 1)
                        self.stages = 2
                    "neutral":
                        npc_dialogue.append("Sure we can talk I guess")
                        npc_dialogue.append("Yeah whats up?")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('neutral', 3, 1)
                        self.stages = 2
                4:
                  match emotion:
                
                    "angry":
                        npc_dialogue.append("Sure whatever")
                        npc_dialogue.append("I guess...")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('angry', 4, 1)
                        self.stages = 2
                    "happy":
                        npc_dialogue.append("Sure we can help out")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('happy', 4, 1)
                        self.stages = 2
                    "neutral":
                        npc_dialogue.append("Sure we can talk I guess")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('neutral', 4, 1)
                        self.stages = 2
            2:
              match selection:
            
                0:
                  match emotion:
                
                    "angry":
                        npc_dialogue.append("We don t have to talk to you")
                        npc_dialogue.append("Not with that attitude")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('angry', 0, 2)
                        self.stages = 3
                    "happy":
                        npc_dialogue.append("We just went for a walk")
                        npc_dialogue.append("We didnt see much")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('happy', 0, 2)
                        self.stages = 3
                    "neutral":
                        npc_dialogue.append("We weren t doing anything weird")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('neutral', 0, 2)
                        self.stages = 3
                1:
                  match emotion:
                
                    "angry":
                        npc_dialogue.append("We dont have to tell you")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('angry', 1, 2)
                        self.stages = 3
                    "happy":
                        npc_dialogue.append("We just went for a walk")
                        npc_dialogue.append("Sorry, we didnt see anything")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('happy', 1, 2)
                        self.stages = 3
                    "neutral":
                        npc_dialogue.append("We just went for a walk")
                        npc_dialogue.append("We didn t see anything")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('neutral', 1, 2)
                        self.stages = 3
                3:
                  match emotion:
                
                    "angry":
                        npc_dialogue.append("Not much")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('angry', 3, 2)
                        self.stages = 3
                    "happy":
                        npc_dialogue.append("Last night was pretty uneventful")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('happy', 3, 2)
                        self.stages = 3
                    "neutral":
                        npc_dialogue.append("We walked around for a bit")
                        npc_dialogue.append("Pretty uneventful")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('neutral', 3, 2)
                        self.stages = 3
                4:
                  match emotion:
                
                    "angry":
                        npc_dialogue.append("We weren t doing anything weird")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('angry', 4, 2)
                        self.stages = 3
                    "happy":
                        npc_dialogue.append("We went for a walk last night")
                        npc_dialogue.append("We didnt see much, sorry")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('happy', 4, 2)
                        self.stages = 3
                    "neutral":
                        npc_dialogue.append("Didnt see much")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('neutral', 4, 2)
                        self.stages = 3
            3:
              match selection:
            
                0:
                  match emotion:
                
                    "angry":
                        npc_dialogue.append("I think I saw him going to the graveyard?")
                        npc_dialogue.append("We saw him at the graveyard...")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('angry', 0, 3)
                        self.stages = 4
                    "happy":
                        npc_dialogue.append("I think I saw him going to the graveyard")
                        npc_dialogue.append("Around 10 last night")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('happy', 0, 3)
                        self.stages = 4
                    "neutral":
                        npc_dialogue.append("He was at the graveyard")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('neutral', 0, 3)
                        self.stages = 4
                1:
                  match emotion:
                
                    "angry":
                        npc_dialogue.append("We don t have to tell you")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('angry', 1, 3)
                        self.stages = 4
                    "happy":
                        npc_dialogue.append("We saw him at the graveyard")
                        npc_dialogue.append("Around 10 last night?")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('happy', 1, 3)
                        self.stages = 4
                    "neutral":
                        npc_dialogue.append("He was at the graveyard")
                        npc_dialogue.append("Around 10 last night")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('neutral', 1, 3)
                        self.stages = 4
                3:
                  match emotion:
                
                    "angry":
                        npc_dialogue.append("Maybe the graveyard? I don t know...")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('angry', 3, 3)
                        self.stages = 4
                    "happy":
                        npc_dialogue.append("I think I saw him going to the graveyard?")
                        npc_dialogue.append("Yeah  around 10?")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('happy', 3, 3)
                        self.stages = 4
                    "neutral":
                        npc_dialogue.append("He was at the graveyard")
                        npc_dialogue.append("Yeah  around 10?")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('neutral', 3, 3)
                        self.stages = 4
                4:
                  match emotion:
                
                    "angry":
                        npc_dialogue.append("I think I saw him going to the graveyard?")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('angry', 4, 3)
                        self.stages = 4
                    "happy":
                        npc_dialogue.append("He might have been at the graveyard?")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('happy', 4, 3)
                        self.stages = 4
                    "neutral":
                        npc_dialogue.append("We saw him go over to the graveyard")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('neutral', 4, 3)
                        self.stages = 4
            4:
              match selection:
            
                0:
                  match emotion:
                
                    "angry":
                        npc_dialogue.append("I don t think Sarah was too fond of him")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('angry', 0, 4)
                        self.stages = 5
                    "happy":
                        npc_dialogue.append("Perhaps Sarah wasnt his biggest fan...")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('happy', 0, 4)
                        self.stages = 5
                    "neutral":
                        npc_dialogue.append("I don t think Sarah was too fond of him...")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('neutral', 0, 4)
                        self.stages = 5
                1:
                  match emotion:
                
                    "angry":
                        npc_dialogue.append("Sarah wasn t his biggest fan")
                        npc_dialogue.append("Yeah they argued a lot")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('angry', 1, 4)
                        self.stages = 5
                    "happy":
                        npc_dialogue.append("Perhaps Sarah wasnt his biggest fan...")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('happy', 1, 4)
                        self.stages = 5
                    "neutral":
                        npc_dialogue.append("I don t think Sarah was too fond of him...")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('neutral', 1, 4)
                        self.stages = 5
                3:
                  match emotion:
                
                    "angry":
                        npc_dialogue.append("Sarah didn t like him all that much")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('angry', 3, 4)
                        self.stages = 5
                    "happy":
                        npc_dialogue.append("Perhaps Sarah wasnt his biggest fan...")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('happy', 3, 4)
                        self.stages = 5
                    "neutral":
                        npc_dialogue.append("I don t think Sarah was too fond of him...")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('neutral', 3, 4)
                        self.stages = 5
                4:
                  match emotion:
                
                    "angry":
                        npc_dialogue.append("Sarah wasn t his biggest fan")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('angry', 4, 4)
                        self.stages = 5
                    "happy":
                        npc_dialogue.append("Perhaps Sarah wasnt his biggest fan...")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('happy', 4, 4)
                        self.stages = 5
                    "neutral":
                        npc_dialogue.append("I don t think Sarah was too fond of him...")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('neutral', 4, 4)
                        self.stages = 5
            5:
              match selection:
            
                0:
                  match emotion:
                
                    "angry":
                        npc_dialogue.append("Alright seeya")
                        npc_dialogue.append("Bye")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('angry', 0, 5)
                        self.stages = 6
                    "happy":
                        npc_dialogue.append("Best of luck!")
                        npc_dialogue.append("Yeah good luck")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('happy', 0, 5)
                        self.stages = 6
                    "neutral":
                        npc_dialogue.append("Okay catch you later")
                        npc_dialogue.append("Yeah bye now")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('neutral', 0, 5)
                        self.stages = 6
                1:
                  match emotion:
                
                    "angry":
                        npc_dialogue.append("Good luck...")
                        npc_dialogue.append("...")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('angry', 1, 5)
                        self.stages = 6
                    "happy":
                        npc_dialogue.append("Best of luck!")
                        npc_dialogue.append("Yeah good luck")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('happy', 1, 5)
                        self.stages = 6
                    "neutral":
                        npc_dialogue.append("Okay catch you later")
                        npc_dialogue.append("Yeah bye now")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('neutral', 1, 5)
                        self.stages = 6
                3:
                  match emotion:
                
                    "angry":
                        npc_dialogue.append("Alright seeya")
                        npc_dialogue.append("Yeah bye")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('angry', 3, 5)
                        self.stages = 6
                    "happy":
                        npc_dialogue.append("Best of luck!")
                        npc_dialogue.append("Yeah good luck")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('happy', 3, 5)
                        self.stages = 6
                    "neutral":
                        npc_dialogue.append("Okay catch you later")
                        npc_dialogue.append("Yeah bye now")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('neutral', 3, 5)
                        self.stages = 6
                4:
                  match emotion:
                
                    "angry":
                        npc_dialogue.append("Okay bye...")
                        npc_dialogue.append("...")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('angry', 4, 5)
                        self.stages = 6
                    "happy":
                        npc_dialogue.append("Best of luck!")
                        npc_dialogue.append("Yeah good luck")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('happy', 4, 5)
                        self.stages = 6
                    "neutral":
                        npc_dialogue.append("Okay catch you later")
                        npc_dialogue.append("Yeah bye now")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('neutral', 4, 5)
                        self.stages = 6


    var player_answer = yield(player, "spoke")
    interaction_dialogue(player_answer)


func set_group1_stage_state(state):
    stages = state
    return stages
    
enum ButtonType {NONE, OK, NEXT}

#var timer = Timer.new()
func dialogue(group, npc_dialogue, player_emotion, player_selection, player_stages):
    var npc_group = []
    var npcs = []
    var count = 0
    npc_group.append(group.get_children())
    for i in npc_group:
        for npc in i:
            npc.set_expression(player_emotion)
            npcs.append(npc)
    if len(npcs) > 1:
        print("two people")
        while count < npc_dialogue.size():
            for npc in npcs:
                if count < npc_dialogue.size():
                    npc.say(npc_dialogue[count], 4)
                    count += 1
                    emit_signal("dialogue", player_emotion, player_selection, player_stages, group.name)
                    yield(get_tree().create_timer(1), "timeout")
                else:
                    continue
    else:
        print("one person")
        for npc in npcs:
            for i in npc_dialogue:
                print(i)
                npc.say(i, 1)
                
func playerInput(mood, selection, stage):
    menu.setupOptions(mood, selection, stage)
