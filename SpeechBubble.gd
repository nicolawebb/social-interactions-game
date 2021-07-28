extends Control

onready var button = $speech_bubble/Label/Button

enum ButtonType {NONE, OK, NEXT}

var is_speaking = false

signal speaking
signal done

func _ready():
    
    # make the speech bubble initially transparent
    modulate.a = 0
    
    button.visible = false

func flip_left():
    $speech_bubble.flip_h = false

func flip_right():
    $speech_bubble.flip_h = true

    
func on_time_out():
    $Tween.interpolate_property(self, "modulate:a", 1.0, 0.0, 1)
    $Tween.start()

    
func say(text, button_type = ButtonType.NONE, wait_time = 2, speaker = "player"):
    
    match button_type:
        ButtonType.NONE:
            button.visible = false
        ButtonType.OK:
            button.visible = true
            button.text = "Ok"
        ButtonType.NEXT:
            button.visible = true
            button.text = "Next"

    if speaker == "npc":
        yield(get_tree().create_timer(1), "timeout")

    $speech_bubble/Label.text = text

    var text_length = text.length()
    wait_time = text_length/4
    
    is_speaking = true
    
    $Tween.remove_all()
    $Tween.interpolate_property(self, "modulate:a", null, 1.0, 0.5)
    $Tween.start()
        
    if button_type == ButtonType.NONE:
        # dismiss the bubble after set time
        yield(get_tree().create_timer(wait_time), "timeout")
    else:
        # wait for a click
        yield(button, "pressed")
    
    $Tween.remove_all()
    $Tween.interpolate_property(self, "modulate:a", null, 0.0, 0.5)
    $Tween.start()
    
    is_speaking = false
    
    if speaker == "npc":
        emit_signal("done")
        




