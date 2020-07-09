extends Node2D

onready var game_over = get_parent().get_parent().get_child(1).get_node("Game")
onready var player = get_parent().get_parent().get_child(1).get_node("Player")
onready var ultima_posicao = Vector2.ZERO

func _process(_delta):
	if true: #Follow player
		if global_res.is_movable == true: #Caso ache o jogador a posicao se aproxima da do jogador com a velocidade determinada.
			if player != null:
				position = position.move_toward(player.position,rand_range(0,$Stats.speed)) #Efeito de movimento aleatorio
		#Flipping Sprite
		if position.x < ultima_posicao.x:
			scale = (Vector2(-1,1))
			ultima_posicao = position
		else:
			scale = (Vector2(1,1))
			ultima_posicao = position

func _on_Enemy_area_entered(area):
	if area.name == "Player" and global_res.player_level < $Stats.difficulty:
		game_over.show()
		get_tree().paused = true
		global_res.is_paused = true

	elif area.name == "Player" and global_res.player_level >= $Stats.difficulty:
		global_res.player_level += $Stats.reward
		queue_free()
