extends Control

onready var player = get_tree().root.get_node("Game/Player")

onready var speechbubble = $TextureRect/SpeechBubble

signal spoke
var current_emotion

var currently_speaking

onready var playerButton = $TextureRect

func _ready():
    makeVisible(false)

var image = Image.new()

func makeVisible(boolVal):
    $ColorRect.visible = boolVal
    $TextureRect.visible = boolVal

func makePlayerButtonVisible(boolVal):
    $TextureRect.visible = boolVal


func setupOptions(mood, selected, stage):
    
    if stage == 0: 
        $ColorRect/Button1/Label.text = "I have a few questions to ask"
        $ColorRect/Button2/Label.text = "Do you have a moment to talk?"
        $ColorRect/Button3/Label.text = "Um, hello?"
        $ColorRect/Button4/Label.text = "Hi."
        $ColorRect/Button5/Label.text = "..."
        
    elif stage == 1:
        $ColorRect/Button1/Label.text = "Where were you last night?"
        $ColorRect/Button2/Label.text = "What were you up to yesterday?"
        $ColorRect/Button3/Label.text = "Did you do anything odd last night?"
        $ColorRect/Button4/Label.text = "Did you see anything?"
        $ColorRect/Button5/Label.text = "..."
        
    elif stage == 2:
        $ColorRect/Button1/Label.text = "When did you see the mayor last?"
        $ColorRect/Button2/Label.text = "Did see the mayor last night?"
        $ColorRect/Button3/Label.text = "When was the last time you saw the mayor?"
        $ColorRect/Button4/Label.text = "You see the mayor at all yesterday?"
        $ColorRect/Button5/Label.text = "..."
        
    elif stage == 3:
        $ColorRect/Button1/Label.text = "Did he have any enemies?"
        $ColorRect/Button2/Label.text = "So who did he piss off?"
        $ColorRect/Button3/Label.text = "Did he have any enemies?"
        $ColorRect/Button4/Label.text = "So who did he piss off?"
        $ColorRect/Button5/Label.text = "..."
        
    elif stage == 4:
        $ColorRect/Button1/Label.text = "You've been a big help."
        $ColorRect/Button2/Label.text = "Thank you"
        $ColorRect/Button3/Label.text = "Goodbye..."
        $ColorRect/Button4/Label.text = "Thanks for nothing..."
        $ColorRect/Button5/Label.text = "..."
    

    return mood
            

func _on_Button5_pressed():
    playerButton.texture = load("res://assets/Menu/happy.png")
    var text = $ColorRect/Button5/Label.text
    player.emit_signal("spoke", text, "happy")
    speechbubble.say(text)

func _on_TextureRect_mouse_entered():
    makeVisible(true)

func _on_Happy1_pressed():
    playerButton.texture = load("res://assets/Menu/happy.png")
    var text = $ColorRect/Button1/Label.text
    player.emit_signal("spoke", text, "happy", 0)
    speechbubble.say(text)


func _on_Neutral1_pressed():
    playerButton.texture = load("res://assets/Menu/neutral.png")
    var text = $ColorRect/Button1/Label.text
    player.emit_signal("spoke", text, "neutral", 0)
    speechbubble.say(text)

func _on_Angry1_pressed():
    playerButton.texture = load("res://assets/Menu/angry.png")
    var text = $ColorRect/Button1/Label.text
    player.emit_signal("spoke", text, "angry", 0)
    speechbubble.say(text)

func _on_Happy2_pressed():
    playerButton.texture = load("res://assets/Menu/happy.png")
    var text = $ColorRect/Button2/Label.text
    player.emit_signal("spoke", text, "happy", 1)
    speechbubble.say(text)

func _on_Neutral2_pressed():
    playerButton.texture = load("res://assets/Menu/neutral.png")
    var text = $ColorRect/Button2/Label.text
    player.emit_signal("spoke", text, "neutral", 1)
    speechbubble.say(text)

func _on_Angry2_pressed():
    playerButton.texture = load("res://assets/Menu/angry.png")
    var text = $ColorRect/Button2/Label.text
    player.emit_signal("spoke", text, "angry", 1)
    speechbubble.say(text)

func _on_Happy3_pressed():
    playerButton.texture = load("res://assets/Menu/happy.png")
    var text = $ColorRect/Button3/Label.text
    player.emit_signal("spoke", text, "happy", 3)
    speechbubble.say(text)

func _on_Neutral3_pressed():
    playerButton.texture = load("res://assets/Menu/neutral.png")
    var text = $ColorRect/Button3/Label.text
    player.emit_signal("spoke", text, "neutral", 3)
    speechbubble.say(text)

func _on_Angry3_pressed():
    playerButton.texture = load("res://assets/Menu/angry.png")
    var text = $ColorRect/Button3/Label.text
    player.emit_signal("spoke", text, "angry", 3)
    speechbubble.say(text)

func _on_Happy4_pressed():
    playerButton.texture = load("res://assets/Menu/happy.png")
    var text = $ColorRect/Button4/Label.text
    player.emit_signal("spoke", text, "happy", 4)
    speechbubble.say(text)

func _on_Neutral4_pressed():
    playerButton.texture = load("res://assets/Menu/neutral.png")
    var text = $ColorRect/Button4/Label.text
    player.emit_signal("spoke", text, "neutral", 4)
    speechbubble.say(text)

func _on_Angry4_pressed():
    playerButton.texture = load("res://assets/Menu/angry.png")
    var text = $ColorRect/Button4/Label.text
    player.emit_signal("spoke", text, "angry", 4)
    speechbubble.say(text)

func npc_speaking():
    print("SPEAKING")
    $ColorRect/Button1/Happy1.disabled = true
    $ColorRect/Button1/Angry1.disabled = true
    $ColorRect/Button1/Neutral1.disabled = true
    $ColorRect/Button2/Happy2.disabled = true
    $ColorRect/Button2/Angry2.disabled = true
    $ColorRect/Button2/Neutral2.disabled = true
    $ColorRect/Button3/Happy3.disabled = true
    $ColorRect/Button3/Angry3.disabled = true
    $ColorRect/Button3/Neutral3.disabled = true
    $ColorRect/Button4/Happy4.disabled = true
    $ColorRect/Button4/Angry4.disabled = true
    $ColorRect/Button4/Neutral4.disabled = true

func npc_done_speaking():
    print("DONE SPEAKING")
    $ColorRect/Button1/Happy1.disabled = false
    $ColorRect/Button1/Angry1.disabled = false
    $ColorRect/Button1/Neutral1.disabled = false
    $ColorRect/Button2/Happy2.disabled = false
    $ColorRect/Button2/Angry2.disabled = false
    $ColorRect/Button2/Neutral2.disabled = false
    $ColorRect/Button3/Happy3.disabled = false
    $ColorRect/Button3/Angry3.disabled = false
    $ColorRect/Button3/Neutral3.disabled = false
    $ColorRect/Button4/Happy4.disabled = false
    $ColorRect/Button4/Angry4.disabled = false
    $ColorRect/Button4/Neutral4.disabled = false
