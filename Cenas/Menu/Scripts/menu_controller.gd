extends Control

func _on_NewGame_pressed():
	get_tree().change_scene("res://Cenas/Menu/Tutorial.tscn")

func _on_Continue_pressed():
	get_tree().change_scene("res://Cenas/Cena2.tscn")

func _on_Options_pressed():
	get_tree().change_scene("res://Cenas/Menu/Options.tscn")

func _on_Sair_pressed():
	get_tree().quit()
