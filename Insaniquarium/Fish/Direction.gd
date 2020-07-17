extends "res://Fish/Timer.gd"

func _ready():
	var dir = Vector2(rand_range(-1,1)*get_parent().speed,rand_range(-1,1)*get_parent().speed)
	get_parent().translate(dir)
