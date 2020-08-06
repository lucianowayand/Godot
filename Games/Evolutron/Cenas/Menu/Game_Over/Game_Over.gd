extends Node2D

func _on_Sair_pressed():
	global_res.is_paused = false
	global_res.player_level = 0
	get_tree().paused = false
	get_tree().call_group("Enemies","free")
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Cenas/Menu/Menu/Menu.tscn")

func _on_tentar_novamente_pressed():
# warning-ignore:return_value_discarded
	get_tree().reload_current_scene()
	get_tree().call_group("Enemies","free")
	global_res.player_level = get_parent().get_parent().get("start_level")
	get_tree().paused = false
