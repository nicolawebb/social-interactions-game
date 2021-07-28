extends Character

var lines = ["Hello detective", "I'm the main detective in this town", 
"I know you've been filled in on the case", 
"So what I need you to do is talk to the towns people",
"See what you can find out",
"A word of warning though",
"Some of these guys...are not the most friendly",
"But don't give up so easily.",
"Push for what you can",
"Good luck detective."]

var timer = Timer.new()

func enter_social_space(body):
    print("detective")
    is_looking_at_player = true
    if body.get_name() == "Player":
        print("Player enters " + username + " social space")
        for i in lines:
            if is_looking_at_player:
                add_child(timer)
                say(i, 5, false, "detective")
                timer.set_wait_time(3)
                timer.start()
                    
                yield(timer, "timeout") 
            

func _process(_delta):
    var anim_to_play = "Idle"
    
    var current_anim = anim_player.get_current_animation()
    
    if current_anim != anim_to_play:
        anim_player.play(anim_to_play)

func _ready():
    pass # Replace with function body.


