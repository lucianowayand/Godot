extends Control

func _ready():
	pass # Replace with function body.

func _on_NewGame_pressed():
	get_tree().change_scene("res://Cenas/Cena1.tscn")

func _on_Continue_pressed():
	get_tree().change_scene("res://Cenas/Cena2.tscn")

func _on_Options_pressed():
	get_tree().change_scene("res://Cenas/Menu/Options.tscn")
