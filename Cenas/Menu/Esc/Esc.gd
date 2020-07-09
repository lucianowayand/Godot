extends Node2D

func _process(_delta):
	if Input.is_action_just_pressed("menu") and !global_res.is_paused and (get_tree().get_current_scene().get_name() != "Menu"):
		show()
		get_tree().paused = true
		global_res.is_paused = true

func _on_Sair_pressed():
	global_res.is_paused = false
	get_tree().paused = false
	get_tree().call_group("Enemies","free")
	get_tree().change_scene("res://Cenas/Menu/Menu.tscn")
	global_res.player_level = 0

func _on_Voltar_pressed():
	global_res.is_paused = false
	get_tree().paused = false
	hide()
