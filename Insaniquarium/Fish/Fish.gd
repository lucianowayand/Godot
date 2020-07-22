extends KinematicBody2D

export (int) var fish_cost
var moving = false
var speed = 5
var value = 10
onready var dir = "null"
onready var sides = get_parent().get_parent().get_child(1).get_node("Moving")
onready var direcao
var mouse_hover = false
onready var state = "idle"
onready var __name = "fish"

func _ready():
	if global.random(0,12) < 6:
		dir = "Left"
	else:
		dir = "Right"
		sprite_flip_h()
	
	direcao = sides.get_node(dir)
	$Animation.play("Nova Animação")

func _process(_delta):
	if state == "feeding":
		pass
	if state == "idle":
		if position.x == direcao.position.x:
			if dir == "Left":
				dir = "Right"
				direcao = sides.get_node(dir)
				sprite_flip_h()
			else:
				dir = "Left"
				direcao = sides.get_node(dir)
				sprite_flip_h()
		
		position.x = move_toward(position.x,direcao.position.x, 1)

	if Input.is_mouse_button_pressed(1) and mouse_hover and global.trash_can:
		queue_free()
		global.fishes -= 1
		global.coins += 0.5 * value
	
func sprite_flip_h():
	$Sprite.position.x = - $Sprite.position.x
	$Sprite.scale.x = - $Sprite.scale.x 

func _on_Food_area_entered(area):
	var fish = area.get_parent()
	print(fish.__name)
	if fish.__name == "Guppy":
		state == "feeding"
		var dir = (fish.global_position - global_position).normalized()
		move_and_collide(dir * 10)
