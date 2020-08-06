extends "res://Cenas/map_default.gd"

func _ready():
	next_scene = "res://Cenas/Mapas/2/Cena2.tscn"
	$Buraco.set("scene",next_scene)
	global_res.is_movable = true
	

