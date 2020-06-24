extends Node2D

func _ready():
	#transform = global_res.camera_pos
	get_tree().paused = true
	
		
func _on_Sair_pressed():
	global_res.is_paused = false
	get_tree().paused = false
	queue_free()
	get_tree().change_scene("res://Cenas/Menu/Menu.tscn")

func _on_Voltar_pressed():
	global_res.is_paused = false
	get_tree().paused = false
	queue_free()
