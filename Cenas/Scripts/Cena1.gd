extends Node2D

onready var player = $Player

func _ready():	
	pass

func _on_Area2D_body_entered(body):
	remove_child(player)
	get_tree().change_scene("res://Cenas/Cena2.tscn")
