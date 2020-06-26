extends KinematicBody2D

onready var player = get_parent().get_node("Player")

func _physics_process(delta):
	pass

func _on_Area2D_body_entered(body):
	if body.get_name() == "Player" and global_res.points < 4:
		print("Game over")

	elif body.get_name() == "Player" and global_res.points >= 4:
		queue_free()
