extends Node2D

func _ready(): #inicia o cinematic da queda, o player obviamente nao pode se mexer pra nao dar xibiu e os ovos sao gerados
	$Intro.play("Intro")
	global_res.is_movable = false
	global_res.instanciar_em_area(Vector2(20,200),Vector2(200,250),4,"res://Instanciaveis/Enemies/Spider_sack/Spider_sack.tscn", "SpiderSack")
	inicia_aranha_sem_tocar_player()
	
func _on_Intro_animation_finished(_anim_name): #quando acaba o jogo se resume
	global_res.is_movable = true

func inicia_aranha_sem_tocar_player():
	var rand = RandomNumberGenerator.new()
	rand.randomize()
	var r = rand.randi_range(1,3)
	print(r)
	if  r == 1: #20,80 - Esquerda
		print(1)
		global_res.instanciar_em_area(Vector2(20,80),Vector2(200,250),1,"res://Instanciaveis/Enemies/Spider/Spider.tscn", "Spider")
	elif r == 2: #160,220 - Direita
		print(2)
		global_res.instanciar_em_area(Vector2(160,220),Vector2(200,250),1,"res://Instanciaveis/Enemies/Spider/Spider.tscn", "Spider")
	elif r == 3:
		print(3)
		global_res.instanciar_em_area(Vector2(80,140),Vector2(240,250),1,"res://Instanciaveis/Enemies/Spider/Spider.tscn", "Spider")
