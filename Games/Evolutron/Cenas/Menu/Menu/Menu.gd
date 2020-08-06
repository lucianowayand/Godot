extends Control

func _on_NewGame_pressed():
# warning-ignore:return_value_discarded
	global_res.player_level = 0
	get_tree().change_scene("res://Cenas/Menu/Tutorial.tscn")
	
func _on_Options_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Cenas/Menu/Menu/Options.tscn")

func _on_Sair_pressed():
	get_tree().quit()
