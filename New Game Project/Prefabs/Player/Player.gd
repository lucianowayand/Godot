extends KinematicBody2D

const GRAVITY = 20

var is_touching_ground = false
export (int) var speed = 100
export (int) var jump_speed = 450
var flip = false

onready var direction = Vector2.ZERO

func _on_feet_body_entered(body):
	if body.name == "Layer2":
		is_touching_ground = true

func _on_feet_body_exited(body):
	if body.name == "Layer2":
		is_touching_ground = false

func _input(event):
	if event.is_action_pressed("ui_right"):
		flip = true
	elif event.is_action_pressed("ui_left"):
		flip = false

func _physics_process(_delta):
	direction.x = (Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")) * speed
	$Sprite.flip_h = flip
	
	if Input.is_action_pressed("ui_up") and is_touching_ground:
		direction.y =  -1 * jump_speed
		
	direction.y +=  1 * GRAVITY
		
# warning-ignore:return_value_discarded
	move_and_slide(direction)
