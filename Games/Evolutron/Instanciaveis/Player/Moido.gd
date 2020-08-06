extends "res://Instanciaveis/Player/Player.gd"

func _process(delta):
	position.y += 1

func _on_Player_area_entered(area):
	global_res.is_movable = false
