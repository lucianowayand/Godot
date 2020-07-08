extends Node2D

onready var player = get_tree().get_root().get_node("Mapa").find_node("Player")
onready var background = get_tree().get_root().get_node("Mapa").find_node("Background")
onready var screen_size = Vector2(background.get("offset").x, background.get("offset").y)


func _on_Sair_pressed():
	global_res.is_paused = false
	get_tree().paused = false
	get_tree().call_group("Enemies","free")
	get_tree().change_scene("res://Cenas/Menu/Menu.tscn")

func _on_tentar_novamente_pressed():
	get_tree().reload_current_scene()
	get_tree().call_group("Enemies","free")
	get_tree().paused = false

func _process(_delta):
	follow_player()

func follow_player():
	if screen_size.y > player.position.y-67.5 and screen_size.y > 67.5 or screen_size.y == 0:
		position.y = player.position.y-67.5
	if screen_size.x > player.position.y-120 and screen_size.x > 120 or screen_size.x == 0:
		position.x = player.position.x-120
