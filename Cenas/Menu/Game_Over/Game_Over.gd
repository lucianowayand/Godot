extends Node2D

func _on_Sair_pressed():
	global_res.is_paused = false
	get_tree().paused = false
	get_tree().call_group("Enemies","free")
	get_tree().change_scene("res://Cenas/Menu/Menu.tscn")

func _on_tentar_novamente_pressed():
	get_tree().reload_current_scene()
	get_tree().call_group("Enemies","free")
	get_tree().paused = false
