extends Node2D

func _on_StaticBody2D_body_entered(body):
	if body.get_name() == "Player":
		global_res.points += 1
		queue_free()
	if global_res.points == 4:
		get_tree().call_group("Player","grow")
