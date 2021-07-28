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
        
    var group = get_tree().get_root().get_node("Game/NPCs/ProximityGroup3")
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
                        npc_dialogue.append("What?")
                        npc_dialogue.append("What do you want?")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('angry', 0, 0)
                        self.stages = 1
                    "happy":
                        npc_dialogue.append("Can we help you?")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('happy', 0, 0)
                        self.stages = 1
                    "neutral":
                        npc_dialogue.append("You want something?")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('neutral', 0, 0)
                        self.stages = 1
                1:
                  match emotion:
                
                    "angry":
                        npc_dialogue.append("What do you want?")
                        npc_dialogue.append("Yeah spit it out")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('angry', 1, 0)
                        self.stages = 1
                    "happy":
                        npc_dialogue.append("Can we help you?")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('happy', 1, 0)
                        self.stages = 1
                    "neutral":
                        npc_dialogue.append("Huh?")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('neutral', 1, 0)
                        self.stages = 1
            1:
              match selection:
            
                0:
                  match emotion:
                
                    "angry":
                        npc_dialogue.append("Whatever")
                        npc_dialogue.append("We ll talk to you I guess")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('angry', 0, 1)
                        self.stages = 2
                    "happy":
                        npc_dialogue.append("Sure")
                        npc_dialogue.append("What do you wanna know?")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('happy', 0, 1)
                        self.stages = 2
                    "neutral":
                        npc_dialogue.append("I guess")
                        npc_dialogue.append("What do you wanna know?")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('neutral', 0, 1)
                        self.stages = 2
                1:
                  match emotion:
                
                    "angry":
                        npc_dialogue.append("Jeez, pushy")
                        npc_dialogue.append("What do you wanna know?")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('angry', 1, 1)
                        self.stages = 2
                    "happy":
                        npc_dialogue.append("Sure, what do you want?")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('happy', 1, 1)
                        self.stages = 2
                    "neutral":
                        npc_dialogue.append("I guess...")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('neutral', 1, 1)
                        self.stages = 2
                3:
                  match emotion:
                
                    "angry":
                        npc_dialogue.append("Maybe")
                        npc_dialogue.append("I guess we do")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('angry', 3, 1)
                        self.stages = 2
                    "happy":
                        npc_dialogue.append("We have a bit of time")
                        npc_dialogue.append("Yeah, go on...")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('happy', 3, 1)
                        self.stages = 2
                    "neutral":
                        npc_dialogue.append("Sure")
                        npc_dialogue.append("What do you wanna know?")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('neutral', 3, 1)
                        self.stages = 2
                4:
                  match emotion:
                
                    "angry":
                        npc_dialogue.append("I suppose so")
                        npc_dialogue.append("Whats up?")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('angry', 4, 1)
                        self.stages = 2
                    "happy":
                        npc_dialogue.append("Sure, I guess")
                        npc_dialogue.append("What do you want from us?")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('happy', 4, 1)
                        self.stages = 2
                    "neutral":
                        npc_dialogue.append("I guess...")
                        npc_dialogue.append("What do you want from us?")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('neutral', 4, 1)
                        self.stages = 2
            2:
              match selection:
            
                0:
                  match emotion:
                
                    "angry":
                        npc_dialogue.append("We hung out")
                        npc_dialogue.append("Yeah, Sarah was there too")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('angry', 0, 2)
                        self.stages = 3
                    "happy":
                        npc_dialogue.append("We met up with Sarah")
                        npc_dialogue.append("At the campfire")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('happy', 0, 2)
                        self.stages = 3
                    "neutral":
                        npc_dialogue.append("We went to the campfire")
                        npc_dialogue.append("With Sarah")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('neutral', 0, 2)
                        self.stages = 3
                1:
                  match emotion:
                
                    "angry":
                        npc_dialogue.append("Nothing sus.")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('angry', 1, 2)
                        self.stages = 3
                    "happy":
                        npc_dialogue.append("No, we didnt see anything strange")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('happy', 1, 2)
                        self.stages = 3
                    "neutral":
                        npc_dialogue.append("No, we didn t see anything")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('neutral', 1, 2)
                        self.stages = 3
                3:
                  match emotion:
                
                    "angry":
                        npc_dialogue.append("We were at the campfire")
                        npc_dialogue.append("Sarah was there too")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('angry', 3, 2)
                        self.stages = 3
                    "happy":
                        npc_dialogue.append("We hung out at the campfire")
                        npc_dialogue.append("Sarah was with us too")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('happy', 3, 2)
                        self.stages = 3
                    "neutral":
                        npc_dialogue.append("We went to the campfire")
                        npc_dialogue.append("With Sarah")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('neutral', 3, 2)
                        self.stages = 3
                4:
                  match emotion:
                
                    "angry":
                        npc_dialogue.append("Nothing sus.")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('angry', 4, 2)
                        self.stages = 3
                    "happy":
                        npc_dialogue.append("We hung out at the campfire with Sarah")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('happy', 4, 2)
                        self.stages = 3
                    "neutral":
                        npc_dialogue.append("We hung out at the campfire")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('neutral', 4, 2)
                        self.stages = 3
            3:
              match selection:
            
                0:
                  match emotion:
                
                    "angry":
                        npc_dialogue.append("We saw him about a week ago?")
                        npc_dialogue.append("Same here")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('angry', 0, 3)
                        self.stages = 4
                    "happy":
                        npc_dialogue.append("We last saw him last week I think")
                        npc_dialogue.append("Yeah that sounds right")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('happy', 0, 3)
                        self.stages = 4
                    "neutral":
                        npc_dialogue.append("Nah, havent seen him in a while")
                        npc_dialogue.append("Maybe a week ago?")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('neutral', 0, 3)
                        self.stages = 4
                1:
                  match emotion:
                
                    "angry":
                        npc_dialogue.append("I havent seen him")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('angry', 1, 3)
                        self.stages = 4
                    "happy":
                        npc_dialogue.append("No I havent seen him")
                        npc_dialogue.append("Yeah I havent see him")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('happy', 1, 3)
                        self.stages = 4
                    "neutral":
                        npc_dialogue.append("No I havent see him")
                        npc_dialogue.append("Same")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('neutral', 1, 3)
                        self.stages = 4
                3:
                  match emotion:
                
                    "angry":
                        npc_dialogue.append("Saw him about a week ago maybe?")
                        npc_dialogue.append("Yeah, it s been a while")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('angry', 3, 3)
                        self.stages = 4
                    "happy":
                        npc_dialogue.append("Last I saw him was last week I think")
                        npc_dialogue.append("Yeah that sounds right")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('happy', 3, 3)
                        self.stages = 4
                    "neutral":
                        npc_dialogue.append("Maybe last week was the last time I saw him?")
                        npc_dialogue.append("Sounds about right")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('neutral', 3, 3)
                        self.stages = 4
                4:
                  match emotion:
                
                    "angry":
                        npc_dialogue.append("I havent seen him")
                        npc_dialogue.append("Same here")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('angry', 4, 3)
                        self.stages = 4
                    "happy":
                        npc_dialogue.append("No I havent think so")
                        npc_dialogue.append("Yeah I havent seen him")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('happy', 4, 3)
                        self.stages = 4
                    "neutral":
                        npc_dialogue.append("I havent seen him")
                        npc_dialogue.append("Neither have I")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('neutral', 4, 3)
                        self.stages = 4
            4:
              match selection:
            
                0:
                  match emotion:
                
                    "angry":
                        npc_dialogue.append("I don t know, Sarah I guess?")
                        npc_dialogue.append("They always talked bad of each other")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('angry', 0, 4)
                        self.stages = 5
                    "happy":
                        npc_dialogue.append("Not really?")
                        npc_dialogue.append("I guess Sarah or Chris...")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('happy', 0, 4)
                        self.stages = 5
                    "neutral":
                        npc_dialogue.append("People liked him")
                        npc_dialogue.append("Id say Sarah or Chris...")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('neutral', 0, 4)
                        self.stages = 5
                1:
                  match emotion:
                
                    "angry":
                        npc_dialogue.append("How am I supposed to know?")
                        npc_dialogue.append("I guess Sarah or Chris?")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('angry', 1, 4)
                        self.stages = 5
                    "happy":
                        npc_dialogue.append("He butted heads with Chris a lot")
                        npc_dialogue.append("Same with Sarah")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('happy', 1, 4)
                        self.stages = 5
                    "neutral":
                        npc_dialogue.append("He argued with Chris a lot")
                        npc_dialogue.append("And with Sarah")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('neutral', 1, 4)
                        self.stages = 5
                3:
                  match emotion:
                
                    "angry":
                        npc_dialogue.append("I know Chris didn t")
                        npc_dialogue.append("Sarah too")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('angry', 3, 4)
                        self.stages = 5
                    "happy":
                        npc_dialogue.append("Not really?")
                        npc_dialogue.append("I guess Sarah or Chris...")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('happy', 3, 4)
                        self.stages = 5
                    "neutral":
                        npc_dialogue.append("I dont think so?")
                        npc_dialogue.append("Actually, Sarah or Chris maybe...")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('neutral', 3, 4)
                        self.stages = 5
                4:
                  match emotion:
                
                    "angry":
                        npc_dialogue.append("How am I supposed to know?")
                        npc_dialogue.append("I guess Sarah or Chris?")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('angry', 4, 4)
                        self.stages = 5
                    "happy":
                        npc_dialogue.append("He butted heads with Chris a lot")
                        npc_dialogue.append("Same with Sarah")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('happy', 4, 4)
                        self.stages = 5
                    "neutral":
                        npc_dialogue.append("Chris didnt like him")
                        npc_dialogue.append("Same with Sarah")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('neutral', 4, 4)
                        self.stages = 5
            5:
              match selection:
            
                0:
                  match emotion:
                
                    "angry":
                        npc_dialogue.append("Bye")
                        npc_dialogue.append("...")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('angry', 0, 5)
                        self.stages = 6
                    "happy":
                        npc_dialogue.append("Good luck!")
                        npc_dialogue.append("Yeah, see you around")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('happy', 0, 5)
                        self.stages = 6
                    "neutral":
                        npc_dialogue.append("Good luck...")
                        npc_dialogue.append("Yeah, have fun")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('neutral', 0, 5)
                        self.stages = 6
                1:
                  match emotion:
                
                    "angry":
                        npc_dialogue.append("Alright, see ya")
                        npc_dialogue.append("Bye bye")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('angry', 1, 5)
                        self.stages = 6
                    "happy":
                        npc_dialogue.append("Let us know if you have anymore questions")
                        npc_dialogue.append("Yeah good luck")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('happy', 1, 5)
                        self.stages = 6
                    "neutral":
                        npc_dialogue.append("Good luck Detective")
                        npc_dialogue.append("Yeah good luck")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('neutral', 1, 5)
                        self.stages = 6
                3:
                  match emotion:
                
                    "angry":
                        npc_dialogue.append("Alright, goodnight")
                        npc_dialogue.append("...")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('angry', 3, 5)
                        self.stages = 6
                    "happy":
                        npc_dialogue.append("No worries")
                        npc_dialogue.append("Yeah, have a good night!")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('happy', 3, 5)
                        self.stages = 6
                    "neutral":
                        npc_dialogue.append("See you around")
                        npc_dialogue.append("Good night")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('neutral', 3, 5)
                        self.stages = 6
                4:
                  match emotion:
                
                    "angry":
                        npc_dialogue.append("See you around")
                        npc_dialogue.append("Goodnight Detective")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('angry', 4, 5)
                        self.stages = 6
                    "happy":
                        npc_dialogue.append("No worries")
                        npc_dialogue.append("Best of luck!")
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput('happy', 4, 5)
                        self.stages = 6
                    "neutral":
                        npc_dialogue.append("Alright, cya")
                        npc_dialogue.append("See you around")
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
