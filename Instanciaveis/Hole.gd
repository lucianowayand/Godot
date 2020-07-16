extends Node2D

export var scene = "path"

# warning-ignore:unused_argument
func _on_Area2D_body_entered(body):
# warning-ignore:return_value_discarded
	get_tree().change_scene(scene)
	get_tree().call_group("Enemies","free")
