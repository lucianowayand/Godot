extends Node

func create_dialog(text):
	var dialog_box = preload("res://Dialog.tscn").instance()
	dialog_box._text = text
	get_parent().add_child(dialog_box)
