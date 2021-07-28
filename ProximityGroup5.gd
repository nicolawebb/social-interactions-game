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
        
    var group = get_tree().get_root().get_node("Game/NPCs/ProximityGroup5")
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
                        npc_dialogue.append("Umm...")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('angry', 0, 0)
                        self.stages = 1
                    "happy":
                        npc_dialogue.append("Hey there")
                        npc_dialogue.append("Can we help you?")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('happy', 0, 0)
                        self.stages = 1
                    "neutral":
                        npc_dialogue.append("Hello?")
                        npc_dialogue.append("Can we help?")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('neutral', 0, 0)
                        self.stages = 1
                1:
                  match emotion:
                
                    "angry":
                        npc_dialogue.append("Um...")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('angry', 1, 0)
                        self.stages = 1
                    "happy":
                        npc_dialogue.append("Hey")
                        npc_dialogue.append("Whats up?")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('happy', 1, 0)
                        self.stages = 1
                    "neutral":
                        npc_dialogue.append("Hello?")
                        npc_dialogue.append("Can we help you?")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('neutral', 1, 0)
                        self.stages = 1
            1:
              match selection:
            
                0:
                  match emotion:
                
                    "angry":
                        npc_dialogue.append("Sure...")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('angry', 0, 1)
                        self.stages = 2
                    "happy":
                        npc_dialogue.append("Sure we have time")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('happy', 0, 1)
                        self.stages = 2
                    "neutral":
                        npc_dialogue.append("Okay we ll talk I guess")
                        npc_dialogue.append("Yeah whats up??")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('neutral', 0, 1)
                        self.stages = 2
                1:
                  match emotion:
                
                    "angry":
                        npc_dialogue.append("Sure...")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('angry', 1, 1)
                        self.stages = 2
                    "happy":
                        npc_dialogue.append("Sure we have time")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('happy', 1, 1)
                        self.stages = 2
                    "neutral":
                        npc_dialogue.append("Okay we ll talk I guess")
                        npc_dialogue.append("Yeah whats up?")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('neutral', 1, 1)
                        self.stages = 2
                3:
                  match emotion:
                
                    "angry":
                        npc_dialogue.append("Sure...")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('angry', 3, 1)
                        self.stages = 2
                    "happy":
                        npc_dialogue.append("Sure we can talk")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('happy', 3, 1)
                        self.stages = 2
                    "neutral":
                        npc_dialogue.append("Okay we ll talk I guess")
                        npc_dialogue.append("Yeah whats up?")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('neutral', 3, 1)
                        self.stages = 2
                4:
                  match emotion:
                
                    "angry":
                        npc_dialogue.append("Sure...")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('angry', 4, 1)
                        self.stages = 2
                    "happy":
                        npc_dialogue.append("Sure we can talk")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('happy', 4, 1)
                        self.stages = 2
                    "neutral":
                        npc_dialogue.append("Okay we ll talk I guess")
                        npc_dialogue.append("Yeah whats up?")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('neutral', 4, 1)
                        self.stages = 2
            2:
              match selection:
            
                0:
                  match emotion:
                
                    "angry":
                        npc_dialogue.append("We went to the graveyard")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('angry', 0, 2)
                        self.stages = 3
                    "happy":
                        npc_dialogue.append("We hung out at the graveyard")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('happy', 0, 2)
                        self.stages = 3
                    "neutral":
                        npc_dialogue.append("We were at the graveyard for a bit")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('neutral', 0, 2)
                        self.stages = 3
                1:
                  match emotion:
                
                    "angry":
                        npc_dialogue.append("At the graveyard? No.")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('angry', 1, 2)
                        self.stages = 3
                    "happy":
                        npc_dialogue.append("We were at the graveyard, we saw a few people there")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('happy', 1, 2)
                        self.stages = 3
                    "neutral":
                        npc_dialogue.append("At the graveyard? I didnt see anything")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('neutral', 1, 2)
                        self.stages = 3
                3:
                  match emotion:
                
                    "angry":
                        npc_dialogue.append("We went to the graveyard")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('angry', 3, 2)
                        self.stages = 3
                    "happy":
                        npc_dialogue.append("We hung out at the graveyard")
                        npc_dialogue.append("Saw a few people there")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('happy', 3, 2)
                        self.stages = 3
                    "neutral":
                        npc_dialogue.append("We were at the graveyard for a bit")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('neutral', 3, 2)
                        self.stages = 3
                4:
                  match emotion:
                
                    "angry":
                        npc_dialogue.append("We went to the graveyard")
                        npc_dialogue.append("Saw a few people there")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('angry', 4, 2)
                        self.stages = 3
                    "happy":
                        npc_dialogue.append("We were at the graveyard for a bit")
                        npc_dialogue.append("We saw Sarah there I think?")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('happy', 4, 2)
                        self.stages = 3
                    "neutral":
                        npc_dialogue.append("We were at the graveyard for a bit")
                        npc_dialogue.append("There were a few people there")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('neutral', 4, 2)
                        self.stages = 3
            3:
              match selection:
            
                0:
                  match emotion:
                
                    "angry":
                        npc_dialogue.append("SAw him yesterday, at the graveyard")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('angry', 0, 3)
                        self.stages = 4
                    "happy":
                        npc_dialogue.append("Saw him yesterday")
                        npc_dialogue.append("While we were at the graveyard")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('happy', 0, 3)
                        self.stages = 4
                    "neutral":
                        npc_dialogue.append("We saw him last night")
                        npc_dialogue.append("At the graveyard")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('neutral', 0, 3)
                        self.stages = 4
                1:
                  match emotion:
                
                    "angry":
                        npc_dialogue.append("We saw him last night, at the graveyard")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('angry', 1, 3)
                        self.stages = 4
                    "happy":
                        npc_dialogue.append("We saw him last night")
                        npc_dialogue.append("While we were at the graveyard")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('happy', 1, 3)
                        self.stages = 4
                    "neutral":
                        npc_dialogue.append("I saw him yesterday")
                        npc_dialogue.append("Yeah at the graveyard")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('neutral', 1, 3)
                        self.stages = 4
                3:
                  match emotion:
                
                    "angry":
                        npc_dialogue.append("Saw him yesterday, at the graveyard")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('angry', 3, 3)
                        self.stages = 4
                    "happy":
                        npc_dialogue.append("Saw him yesterday")
                        npc_dialogue.append("While we were at the graveyard")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('happy', 3, 3)
                        self.stages = 4
                    "neutral":
                        npc_dialogue.append("We saw him at the graveyard")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('neutral', 3, 3)
                        self.stages = 4
                4:
                  match emotion:
                
                    "angry":
                        npc_dialogue.append("Saw him at the graveyard last night")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('angry', 4, 3)
                        self.stages = 4
                    "happy":
                        npc_dialogue.append("Yeah we saw him last night")
                        npc_dialogue.append("While we were at the graveyard")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('happy', 4, 3)
                        self.stages = 4
                    "neutral":
                        npc_dialogue.append("We saw him last night")
                        npc_dialogue.append("At the graveyard")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('neutral', 4, 3)
                        self.stages = 4
            4:
              match selection:
            
                0:
                  match emotion:
                
                    "angry":
                        npc_dialogue.append("Sarah maybe?")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('angry', 0, 4)
                        self.stages = 5
                    "happy":
                        npc_dialogue.append("I heard Sarah? wasnt a big fan of his")
                        npc_dialogue.append("Yeah they argued a LOT")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('happy', 0, 4)
                        self.stages = 5
                    "neutral":
                        npc_dialogue.append("I would say Sarah?")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('neutral', 0, 4)
                        self.stages = 5
                1:
                  match emotion:
                
                    "angry":
                        npc_dialogue.append("Sarah maybe?")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('angry', 1, 4)
                        self.stages = 5
                    "happy":
                        npc_dialogue.append("I heard Sarah? wasnt a big fan of his")
                        npc_dialogue.append("Yeah they argued a LOT")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('happy', 1, 4)
                        self.stages = 5
                    "neutral":
                        npc_dialogue.append("I think Sarah maybe?")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('neutral', 1, 4)
                        self.stages = 5
                3:
                  match emotion:
                
                    "angry":
                        npc_dialogue.append("Sarah maybe?")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('angry', 3, 4)
                        self.stages = 5
                    "happy":
                        npc_dialogue.append("I heard Sarah? wasnt a big fan of his")
                        npc_dialogue.append("Yeah they argued a LOT")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('happy', 3, 4)
                        self.stages = 5
                    "neutral":
                        npc_dialogue.append("Honestly? Sarah.")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('neutral', 3, 4)
                        self.stages = 5
                4:
                  match emotion:
                
                    "angry":
                        npc_dialogue.append("Sarah maybe?")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('angry', 4, 4)
                        self.stages = 5
                    "happy":
                        npc_dialogue.append("I heard Sarah? wasnt a big fan of his")
                        npc_dialogue.append("Yeah they argued a LOT")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('happy', 4, 4)
                        self.stages = 5
                    "neutral":
                        npc_dialogue.append("I wanna say Sarah...")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('neutral', 4, 4)
                        self.stages = 5
            5:
              match selection:
            
                0:
                  match emotion:
                
                    "angry":
                        npc_dialogue.append("Alright, see you around")
                        npc_dialogue.append("Yeah, cya")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('angry', 0, 5)
                        self.stages = 6
                    "happy":
                        npc_dialogue.append("Best of luck")
                        npc_dialogue.append("Goodnight!")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('happy', 0, 5)
                        self.stages = 6
                    "neutral":
                        npc_dialogue.append("Alright cya")
                        npc_dialogue.append("Yeah good luck")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('neutral', 0, 5)
                        self.stages = 6
                1:
                  match emotion:
                
                    "angry":
                        npc_dialogue.append("Alright, see you around")
                        npc_dialogue.append("Yeah, cya")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('angry', 1, 5)
                        self.stages = 6
                    "happy":
                        npc_dialogue.append("Best of luck")
                        npc_dialogue.append("Goodnight!")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('happy', 1, 5)
                        self.stages = 6
                    "neutral":
                        npc_dialogue.append("Good luck")
                        npc_dialogue.append("See you around")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('neutral', 1, 5)
                        self.stages = 6
                3:
                  match emotion:
                
                    "angry":
                        npc_dialogue.append("Alright, see you around")
                        npc_dialogue.append("Yeah, cya")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('angry', 3, 5)
                        self.stages = 6
                    "happy":
                        npc_dialogue.append("Best of luck")
                        npc_dialogue.append("Goodnight!")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('happy', 3, 5)
                        self.stages = 6
                    "neutral":
                        npc_dialogue.append("No worries")
                        npc_dialogue.append("See you around")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('neutral', 3, 5)
                        self.stages = 6
                4:
                  match emotion:
                
                    "angry":
                        npc_dialogue.append("Alright, see you around")
                        npc_dialogue.append("Yeah, cya")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('angry', 4, 5)
                        self.stages = 6
                    "happy":
                        npc_dialogue.append("Best of luck")
                        npc_dialogue.append("Goodnight!")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('happy', 4, 5)
                        self.stages = 6
                    "neutral":
                        npc_dialogue.append("Good luck")
                        npc_dialogue.append("See you")
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
            npc.set_expression(player_emotion)
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
