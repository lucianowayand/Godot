extends Node2D

export var scene = "path"

func _on_Area2D_body_entered(body):
	get_tree().change_scene(scene)
	get_tree().call_group("Enemies","free")
