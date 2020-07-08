extends Control

func _on_Voltar_pressed():
	get_tree().change_scene("res://Cenas/Menu/Menu.tscn")

func _on_CheckBox_toggled(button_pressed):
	OS.window_fullscreen = !OS.window_fullscreen
