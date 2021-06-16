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
	if event.is_action_pressed("debug"):
		$Sprite.animation = ("punch")

func _on_Sprite_animation_finished():
	if $Sprite.animation == "punch":
		$Sprite.animation = ("idle")

func _physics_process(_delta):
	direction.x = (Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")) * speed
	if $Sprite.animation != "punch":
		if (Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")) < 0:
			$Sprite.animation = ("running")
			$Sprite.flip_h = true
		elif (Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")) > 0:
			$Sprite.animation = ("running")
			$Sprite.flip_h = false
		else:
			$Sprite.animation = ("idle")
	
	if is_touching_ground:
		if Input.is_action_pressed("ui_up"):
			direction.y =  -1 * jump_speed
	else:
		direction.y +=  1 * GRAVITY

	move_and_slide(direction)

