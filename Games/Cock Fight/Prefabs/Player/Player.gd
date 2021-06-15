extends KinematicBody2D

const GRAVITY = 20

var is_touching_ground = false
export (int) var speed = 100
export (int) var jump_speed = 450

onready var aux = Vector2.ZERO
onready var direction = Vector2.ZERO

func _on_feet_body_entered(body):
	if body.name == "Layer2":
		is_touching_ground = true

func _on_feet_body_exited(body):
	if body.name == "Layer2":
		is_touching_ground = false

func _input(event):
	if event.is_action_pressed("ui_right") or event.is_action_pressed("ui_left"):
		$Sprite.animation = ("running")
	else:
		$Sprite.animation = ("idle")
		
func _physics_process(_delta):
	direction.x = (Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")) * speed
	if (Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")) < 0:
		$Sprite.flip_h = true
	elif (Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")) > 0:
		$Sprite.flip_h = false
	
	if Input.is_action_pressed("ui_up") and is_touching_ground:
		direction.y =  -1 * jump_speed
	
	if !is_touching_ground:
		direction.y +=  1 * GRAVITY

	move_and_slide(direction)
