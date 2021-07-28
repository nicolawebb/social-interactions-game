extends KinematicBody

# mouselook + motion based on godot FPS tutorial:
# https://docs.godotengine.org/en/stable/tutorials/3d/fps_tutorial/part_one.html

const GRAVITY = -24.8
var vel = Vector3()
const MAX_SPEED = 1
const JUMP_SPEED = 1
const ACCEL = 2.5

var dir = Vector3()

const DEACCEL= 16
const MAX_SLOPE_ANGLE = 40

onready var camera = $Rotation_helper/Camera
onready var rotation_helper = $Rotation_helper

onready var anim_player = $AnimationPlayer

signal spoke
#signal done_speaking

# each time I meet a new NPC, I add it to this list
var known_npc = []

var MOUSE_SENSITIVITY = 0.05

var in_dialogue

# if active is false, no mouse interaction is possible
var active:bool = false


func _ready():

    #Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
    Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
   
func disable_mouselook(in_convo):
    in_dialogue = in_convo
    print(in_convo)
    
 
# returns true if the player is facing 'point' (in global coordinates)
func is_facing(point):
    var local_point = point - global_transform.origin
    var gaze = Vector3(0,0,1).rotated(Vector3(0,1,0), rotation.y)
    return local_point.dot(gaze) > 0
    
func _physics_process(delta):
    
    if not active:
        return
        
    process_input(delta)
    process_movement(delta)

func process_input(delta):

    # ----------------------------------
    # Walking
    dir = Vector3()
    var cam_xform = camera.get_global_transform()

    var input_movement_vector = Vector2()

    if Input.is_action_pressed("ui_up"):
        input_movement_vector.y += 1
    if Input.is_action_pressed("ui_down"):
        input_movement_vector.y -= 1
    if Input.is_action_pressed("ui_left"):
        input_movement_vector.x -= 1
    if Input.is_action_pressed("ui_right"):
        input_movement_vector.x += 1

    input_movement_vector = input_movement_vector.normalized()

    # Basis vectors are already normalized.
    dir += -cam_xform.basis.z * input_movement_vector.y
    dir += cam_xform.basis.x * input_movement_vector.x
    # ----------------------------------

    # ----------------------------------
    # Jumping
    if is_on_floor():
        if Input.is_action_just_pressed("ui_jump"):
            vel.y = JUMP_SPEED
    # ----------------------------------

func process_movement(delta):
    dir.y = 0
    dir = dir.normalized()

    vel.y += delta * GRAVITY

    var hvel = vel
    hvel.y = 0

    var target = dir
    target *= MAX_SPEED

    var accel
    if dir.dot(hvel) > 0:
        accel = ACCEL
    else:
        accel = DEACCEL

    hvel = hvel.linear_interpolate(target, accel * delta)
    vel.x = hvel.x
    vel.z = hvel.z
    vel = move_and_slide(vel, Vector3(0, 1, 0), 0.05, 4, deg2rad(MAX_SLOPE_ANGLE))

func _input(event):
    if not active:
        return
        
    if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
        rotation_helper.rotate_x(deg2rad(event.relative.y * MOUSE_SENSITIVITY))
        self.rotate_y(deg2rad(event.relative.x * MOUSE_SENSITIVITY * -1))

        var camera_rot = rotation_helper.rotation_degrees
        camera_rot.x = clamp(camera_rot.x, -20, 30)
        rotation_helper.rotation_degrees = camera_rot
        

    # trying to workaround HTML5 security:
    # MOUSE_MODE_CAPTURED can *only* take place during an 'actual' event (eg
    # a click, but not a motion)
    # Therefore, if waiting *one frame* to change to mouselook (as done for non-HTML5
    # platform), the mouselook won't trigger as it will take place during a 'mouse motion'
    # event.
    #
    # The original reason for waiting one frame is to ensure the click events are
    # properly register, eg to pickup objects. However, it seems to work in HTML5
    # without waiting...
    if OS.get_name() == "HTML5":
        if Input.get_mouse_mode() != Input.MOUSE_MODE_CAPTURED and \
        Input.is_action_just_pressed("mouselook"):
                #print("Capturing mouse (html5)")
                Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
    else:
        if Input.get_mouse_mode() != Input.MOUSE_MODE_CAPTURED and \
        not Input.is_action_just_pressed("mouselook") and \
        Input.is_action_pressed("mouselook"):
                #print("Capturing mouse (non-html)")
                Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

    if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED and \
       event.is_action_released("mouselook"):
            #print("Releasing mouse")
            Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


func has_met(character):
    return (character in known_npc)

func meet(character):
    known_npc.append(character)
    anim_player.play("Greet")

