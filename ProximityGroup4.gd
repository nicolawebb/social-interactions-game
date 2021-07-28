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
    emotion = "neutral"
    stages = 0
    connect("dialogue", game, "get_dialogue")
   
func interaction_dialogue(answer = ""):
        
    var group = get_tree().get_root().get_node("Game/NPCs/ProximityGroup4")
    var npc_dialogue = []
    
    if typeof(answer) == TYPE_STRING:
        self.selection = 0
        self.stages = 0
        self.emotion = "happy"
    
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
                
                    "angry":
                        npc_dialogue.append("Hello?")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('angry', 0, 0)
                        self.stages = 1
                    "happy":
                        npc_dialogue.append("Hi!")
                        npc_dialogue.append("Hello!")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('happy', 0, 0)
                        self.stages = 1
                    "neutral":
                        npc_dialogue.append("Hi")
                        npc_dialogue.append("Hello")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('neutral', 0, 0)
                        self.stages = 1
                1:
                  match emotion:
                
                    "angry":
                        npc_dialogue.append("Hello?")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('angry', 1, 0)
                        self.stages = 1
                    "happy":
                        npc_dialogue.append("Hi!")
                        npc_dialogue.append("Hello!")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('happy', 1, 0)
                        self.stages = 1
                    "neutral":
                        npc_dialogue.append("Hi")
                        npc_dialogue.append("Hello")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('neutral', 1, 0)
                        self.stages = 1
            1:
              match selection:
            
                0:
                  match emotion:
                
                    "angry":
                        npc_dialogue.append("Sure...")
                        npc_dialogue.append("What do you need to know?")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('angry', 0, 1)
                        self.stages = 2
                    "happy":
                        npc_dialogue.append("How can we help?")
                        npc_dialogue.append("Yeah what's up??")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('happy', 0, 1)
                        self.stages = 2
                    "neutral":
                        npc_dialogue.append("Whats up?")
                        npc_dialogue.append("How can we help?")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('neutral', 0, 1)
                        self.stages = 2
                1:
                  match emotion:
                
                    "angry":
                        npc_dialogue.append("Sure...")
                        npc_dialogue.append("What do you need to know?")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('angry', 1, 1)
                        self.stages = 2
                    "happy":
                        npc_dialogue.append("How can we help?")
                        npc_dialogue.append("Yeah what's up?")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('happy', 1, 1)
                        self.stages = 2
                    "neutral":
                        npc_dialogue.append("Whats up?")
                        npc_dialogue.append("Yeah what's up?")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('neutral', 1, 1)
                        self.stages = 2
                3:
                  match emotion:
                
                    "angry":
                        npc_dialogue.append("Sure...")
                        npc_dialogue.append("What do you need to know?")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('angry', 3, 1)
                        self.stages = 2
                    "happy":
                        npc_dialogue.append("How can we help?")
                        npc_dialogue.append("Yeah what's up?")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('happy', 3, 1)
                        self.stages = 2
                    "neutral":
                        npc_dialogue.append("Whats up?")
                        npc_dialogue.append("Yeah what's up?")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('neutral', 3, 1)
                        self.stages = 2
                4:
                  match emotion:
                
                    "angry":
                        npc_dialogue.append("Sure...")
                        npc_dialogue.append("What do you need to know?")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('angry', 4, 1)
                        self.stages = 2
                    "happy":
                        npc_dialogue.append("How can we help?")
                        npc_dialogue.append("Yeah what's up?")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('happy', 4, 1)
                        self.stages = 2
                    "neutral":
                        npc_dialogue.append("Can we help?")
                        npc_dialogue.append("Yeah what's up?")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('neutral', 4, 1)
                        self.stages = 2
            2:
              match selection:
            
                0:
                  match emotion:
                
                    "angry":
                        npc_dialogue.append("We were just at home")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('angry', 0, 2)
                        self.stages = 3
                    "happy":
                        npc_dialogue.append("We just stayed at home")
                        npc_dialogue.append("Yeah we went to bed early too")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('happy', 0, 2)
                        self.stages = 3
                    "neutral":
                        npc_dialogue.append("We were at home")
                        npc_dialogue.append("We didnt do much")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('neutral', 0, 2)
                        self.stages = 3
                1:
                  match emotion:
                
                    "angry":
                        npc_dialogue.append("We were just at home")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('angry', 1, 2)
                        self.stages = 3
                    "happy":
                        npc_dialogue.append("We were at home")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('happy', 1, 2)
                        self.stages = 3
                    "neutral":
                        npc_dialogue.append("We didnt see anything")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('neutral', 1, 2)
                        self.stages = 3
                3:
                  match emotion:
                
                    "angry":
                        npc_dialogue.append("We were just at home")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('angry', 3, 2)
                        self.stages = 3
                    "happy":
                        npc_dialogue.append("We were at home")
                        npc_dialogue.append("Yeah we went to bed early too")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('happy', 3, 2)
                        self.stages = 3
                    "neutral":
                        npc_dialogue.append("We didnt go out")
                        npc_dialogue.append("We just stayed at home")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('neutral', 3, 2)
                        self.stages = 3
                4:
                  match emotion:
                
                    "angry":
                        npc_dialogue.append("We were just at home")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('angry', 4, 2)
                        self.stages = 3
                    "happy":
                        npc_dialogue.append("We were at home")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('happy', 4, 2)
                        self.stages = 3
                    "neutral":
                        npc_dialogue.append("We stayed at home")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('neutral', 4, 2)
                        self.stages = 3
            3:
              match selection:
            
                0:
                  match emotion:
                
                    "angry":
                        npc_dialogue.append("I saw him a couple days ago?")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('angry', 0, 3)
                        self.stages = 4
                    "happy":
                        npc_dialogue.append("We saw him a couple days ago")
                        npc_dialogue.append("Yeah not too recently")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('happy', 0, 3)
                        self.stages = 4
                    "neutral":
                        npc_dialogue.append("Maybe saw him last a couple of days ago?")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('neutral', 0, 3)
                        self.stages = 4
                1:
                  match emotion:
                
                    "angry":
                        npc_dialogue.append("I saw him a couple days ago?")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('angry', 1, 3)
                        self.stages = 4
                    "happy":
                        npc_dialogue.append("We saw him a couple days ago")
                        npc_dialogue.append("Yeah not too recently")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('happy', 1, 3)
                        self.stages = 4
                    "neutral":
                        npc_dialogue.append("I didnt see him yesterday")
                        npc_dialogue.append("Maybe a couple days ago?")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('neutral', 1, 3)
                        self.stages = 4
                3:
                  match emotion:
                
                    "angry":
                        npc_dialogue.append("Saw him last a couple days ago?")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('angry', 3, 3)
                        self.stages = 4
                    "happy":
                        npc_dialogue.append("We saw him a couple days ago")
                        npc_dialogue.append("Yeah not too recently")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('happy', 3, 3)
                        self.stages = 4
                    "neutral":
                        npc_dialogue.append("A few days ago I think")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('neutral', 3, 3)
                        self.stages = 4
                4:
                  match emotion:
                
                    "angry":
                        npc_dialogue.append("Saw him a couple days ago?")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('angry', 4, 3)
                        self.stages = 4
                    "happy":
                        npc_dialogue.append("Yeah not too recently")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('happy', 4, 3)
                        self.stages = 4
                    "neutral":
                        npc_dialogue.append("Last saw him a few days ago I think?")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('neutral', 4, 3)
                        self.stages = 4
            4:
              match selection:
            
                0:
                  match emotion:
                
                    "angry":
                        npc_dialogue.append("I have no idea")
                        npc_dialogue.append("Sorry")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('angry', 0, 4)
                        self.stages = 5
                    "happy":
                        npc_dialogue.append("Not that we know of?")
                        npc_dialogue.append("Yeah sorry")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('happy', 0, 4)
                        self.stages = 5
                    "neutral":
                        npc_dialogue.append("I dont think he had any")
                        npc_dialogue.append("Yeah not that I know of")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('neutral', 0, 4)
                        self.stages = 5
                1:
                  match emotion:
                
                    "angry":
                        npc_dialogue.append("I have no idea")
                        npc_dialogue.append("Sorry")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('angry', 1, 4)
                        self.stages = 5
                    "happy":
                        npc_dialogue.append("Not that we know of?")
                        npc_dialogue.append("Yeah sorry")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('happy', 1, 4)
                        self.stages = 5
                    "neutral":
                        npc_dialogue.append("I have no yeah")
                        npc_dialogue.append("Yeah me neither")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('neutral', 1, 4)
                        self.stages = 5
                3:
                  match emotion:
                
                    "angry":
                        npc_dialogue.append("I have no idea")
                        npc_dialogue.append("Sorry")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('angry', 3, 4)
                        self.stages = 5
                    "happy":
                        npc_dialogue.append("Not that we know of?")
                        npc_dialogue.append("Yeah sorry")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('happy', 3, 4)
                        self.stages = 5
                    "neutral":
                        npc_dialogue.append("I have no idea")
                        npc_dialogue.append("Me neither, sorry")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('neutral', 3, 4)
                        self.stages = 5
                4:
                  match emotion:
                
                    "angry":
                        npc_dialogue.append("I have no idea")
                        npc_dialogue.append("Sorry")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('angry', 4, 4)
                        self.stages = 5
                    "happy":
                        npc_dialogue.append("Not that we know of?")
                        npc_dialogue.append("Yeah sorry")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('happy', 4, 4)
                        self.stages = 5
                    "neutral":
                        npc_dialogue.append("I have no idea")
                        npc_dialogue.append("Same here, sorry")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('neutral', 4, 4)
                        self.stages = 5
            5:
              match selection:
            
                0:
                  match emotion:
                
                    "angry":
                        npc_dialogue.append("Alright")
                        npc_dialogue.append("See you around")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('angry', 0, 5)
                        self.stages = 6
                    "happy":
                        npc_dialogue.append("Have a goodnight!")
                        npc_dialogue.append("Yeah goodnight!")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('happy', 0, 5)
                        self.stages = 6
                    "neutral":
                        npc_dialogue.append("Okay, goodnight")
                        npc_dialogue.append("See ya")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('neutral', 0, 5)
                        self.stages = 6
                1:
                  match emotion:
                
                    "angry":
                        npc_dialogue.append("Alright")
                        npc_dialogue.append("See you around")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('angry', 1, 5)
                        self.stages = 6
                    "happy":
                        npc_dialogue.append("Have a goodnight!")
                        npc_dialogue.append("Yeah goodnight!")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('happy', 1, 5)
                        self.stages = 6
                    "neutral":
                        npc_dialogue.append("Alright, goodnight")
                        npc_dialogue.append("Goodnight")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('neutral', 1, 5)
                        self.stages = 6
                3:
                  match emotion:
                
                    "angry":
                        npc_dialogue.append("Alright")
                        npc_dialogue.append("See you around")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('angry', 3, 5)
                        self.stages = 6
                    "happy":
                        npc_dialogue.append("Have a goodnight!")
                        npc_dialogue.append("Yeah goodnight!")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('happy', 3, 5)
                        self.stages = 6
                    "neutral":
                        npc_dialogue.append("Okay, goodnight")
                        npc_dialogue.append("See you around")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('neutral', 3, 5)
                        self.stages = 6
                4:
                  match emotion:
                
                    "angry":
                        npc_dialogue.append("Alright")
                        npc_dialogue.append("See you around")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('angry', 4, 5)
                        self.stages = 6
                    "happy":
                        npc_dialogue.append("Have a good night!")
                        npc_dialogue.append("Yeah goodnight!")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('happy', 4, 5)
                        self.stages = 6
                    "neutral":
                        npc_dialogue.append("Alright, goodnight")
                        npc_dialogue.append("See ya")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('neutral', 4, 5)
                        self.stages = 6


    var player_answer = yield(player, "spoke")
    interaction_dialogue(player_answer)

func set_group1_stage_state(state):
    stages = state
    return stages
    
func dialogue(group, npc_dialogue, player_emotion, player_selection, player_stages):
    var npc_group = []
    var npcs = []
    var count = 0
    npc_group.append(group.get_children())
    for i in npc_group:
        for npc in i:
            npc.set_expression(emotion)
            npcs.append(npc)
    if len(npcs) > 1:
        while count < npc_dialogue.size():
            for npc in npcs:
                if count < npc_dialogue.size():
                    npc.say(npc_dialogue[count], 4, true)
                    count += 1
                    emit_signal("dialogue", player_emotion, player_selection, player_stages, group.name)
                    yield(get_tree().create_timer(1), "timeout")
                else:
                    continue
    else:
        for npc in npcs:
            for i in npc_dialogue:
                npc.say(i, 1, true)
                
func playerInput(mood, convo, dialogue):
    menu.setupOptions(mood, convo, dialogue)
