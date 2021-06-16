extends KinematicBody2D

const GRAVITY = 20

var is_touching_ground = false
export (int) var speed = 100
export (int) var jump_speed = 450

onready var left_right = Vector2.ZERO
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
	elif event.is_action_pressed("ui_right"):
		$attack/CollisionShape2D.position.x = 16
		$Sprite.flip_h = false
	elif event.is_action_pressed("ui_left"):
		$attack/CollisionShape2D.position.x = -16
		$Sprite.flip_h = true

func _on_Sprite_animation_finished():
	if $Sprite.animation == "punch":
		$Sprite.animation = ("idle")

func _physics_process(_delta):
	left_right = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	if $Sprite.animation != "punch":
		if left_right != 0:
			direction.x = left_right * speed
			$Sprite.animation = ("running")
		else:
			$Sprite.animation = ("idle")
			direction.x = 0
	else:
		direction.x = 0
		
	if is_touching_ground:
		if Input.is_action_pressed("ui_up"):
			direction.y =  -1 * jump_speed
	else:
		direction.y +=  1 * GRAVITY

	move_and_slide(direction)

func _on_attack_body_entered(body):
	if body == self:
		print("self")
	else:
		if body.get("tile_set") != null:
			print("Tile")
		else:
			print("not")
