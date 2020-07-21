extends Node2D

export (int) var fish_cost
var moving = false
var speed = 5
var value = 10
onready var dir = "null"
onready var sides = get_parent().get_parent().get_child(1).get_node("Moving")
onready var direcao
var mouse_hover = false

func _ready():
	if global.random(0,12) < 6:
		dir = "Left"
	else:
		dir = "Right"
		$Sprite.flip_h = true
	
	direcao = sides.get_node(dir)

func _process(_delta):
	if position.x == direcao.position.x:
		if dir == "Left":
			dir = "Right"
			direcao = sides.get_node(dir)
			$Sprite.flip_h = true	
		else:
			dir = "Left"
			direcao = sides.get_node(dir)
			$Sprite.flip_h = false
	position.x = move_toward(position.x,direcao.position.x, 1)

	if Input.is_mouse_button_pressed(1) and mouse_hover and global.trash_can:
		queue_free()
		global.fishes -= 1
		global.coins += 0.5 * value

func _on_Area2D_mouse_entered():
	mouse_hover = true

func _on_Area2D_mouse_exited():
	mouse_hover = false
