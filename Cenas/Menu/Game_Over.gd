extends Node2D

onready var pos = 0

onready var player = get_parent().get_node("Player")
onready var screen_size = get_parent().get_node("Background").get("offset").y

func _on_Sair_pressed():
	global_res.is_paused = false
	get_tree().paused = false
	queue_free()
	get_tree().change_scene("res://Cenas/Menu/Menu.tscn")

func _on_tentar_novamente_pressed():
	get_tree().change_scene("res://Cenas/Cena2.tscn")
	global_res.points = 0

func _process(_delta):
	if  screen_size > player.position.y-67.5 and screen_size > 67.5:
		position.y = player.position.y-67.5

