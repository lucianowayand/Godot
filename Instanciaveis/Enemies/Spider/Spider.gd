extends KinematicBody2D

onready var game_over = get_parent().get_parent().get_child(1).get_node("Game")

func _physics_process(delta):
	pass

func _on_Area2D_body_entered(body):
	if body.get_name() == "Player" and global_res.points < 4:
		game_over.show()
		get_tree().paused = true
		global_res.is_paused = true


	elif body.get_name() == "Player" and global_res.points >= 4:
		queue_free()
