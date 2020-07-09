extends Control

func _on_NewGame_pressed():
	get_tree().change_scene("res://Cenas/Menu/Tutorial.tscn")

func _on_Continue_pressed():
	global_res.player_level = 5
	get_tree().change_scene("res://Cenas/Mapas/3/Cena3.tscn")
	
func _on_Options_pressed():
	get_tree().change_scene("res://Cenas/Menu/Menu/Options.tscn")

func _on_Sair_pressed():
	get_tree().quit()
