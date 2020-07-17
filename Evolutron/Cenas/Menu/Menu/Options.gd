extends CanvasLayer

func _ready():
	$ColorRect/HSlider.value = Song.volume_db

func _on_Voltar_pressed():
	get_tree().change_scene("res://Cenas/Menu/Menu/Menu.tscn")

func _on_CheckBox_toggled(button_pressed):
	OS.window_fullscreen = !OS.window_fullscreen

func _on_HSlider_value_changed(value):
	if value == -40:
		Song.volume_db = -500
		value = 0
	else:
		Song.volume_db = value

