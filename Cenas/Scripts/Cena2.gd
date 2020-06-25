extends Node2D

func _ready(): #inicia o cinematic da queda, o player obviamente nao pode se mexer pra nao dar xibiu e os ovos sao gerados
	$Intro.play("Intro")
	global_res.is_movable = false
	global_res.instanciar_em_area(Vector2(20,200),Vector2(200,250),4,"res://Instanciaveis/Enemies/Spider_sack/Spider_sack.tscn", "SpiderSack")
	
func _on_Intro_animation_finished(_anim_name): #quando acaba o jogo se resume
	global_res.is_movable = true
