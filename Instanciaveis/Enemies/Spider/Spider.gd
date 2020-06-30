extends KinematicBody2D

onready var game_over = get_parent().get_parent().get_child(1).get_node("Game")
onready var player = get_parent().get_parent().get_child(1).get_node("Player")
onready var lastpos = Vector2.ZERO

func _physics_process(delta):
	if global_res.is_movable == true:
		position = position.move_toward(player.position,rand_range(0,0.6))

	if position.x < lastpos.x:
		scale = (Vector2(-1,1))
		lastpos = position
	else:
		scale = (Vector2(1,1))
		lastpos = position

func _on_Area2D_body_entered(body):
	if body.get_name() == "Player" and global_res.points < 4:
		game_over.show()
		get_tree().paused = true
		global_res.is_paused = true

	elif body.get_name() == "Player" and global_res.points >= 4:
		queue_free()
