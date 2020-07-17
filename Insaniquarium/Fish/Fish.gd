extends Node2D

export (int) var fish_cost
var moving = false
var speed = 5

func _on_Direction_timeout():
	var dir = Vector2(rand_range(-1,1)*speed,rand_range(-1,1)*speed)
	translate(dir)
