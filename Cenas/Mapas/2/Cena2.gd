extends Node2D

var end = false

func _ready(): #inicia o cinematic da queda, o player obviamente nao pode se mexer pra nao dar xibiu e os ovos sao gerados
	$Intro.play("Intro")
	inicia_ovos()
	inicia_aranha_sem_tocar_player()

func _process(delta):
	if global_res.player_level == 5 and !end:
		global_res.abre_buraco(Vector2(20,200),Vector2(200,250),"res://Cenas/Mapas/3/Cena3.tscn")
		end = true
		
func inicia_aranha_sem_tocar_player(): #Funcao feita pra aranha nao nascer em contato com o jogador
	var rand = RandomNumberGenerator.new()
	rand.randomize()
	var r = rand.randi_range(1,3)#A funcao instanciar em area recebe 3 opcoes, esquerda, lateral e baixo.
	if  r == 1: 
		global_res.instanciar_em_area(Vector2(20,80),Vector2(200,250),1,"res://Instanciaveis/Enemies/Spider/Spider.tscn", "Spider")
	elif r == 2:
		global_res.instanciar_em_area(Vector2(160,220),Vector2(200,250),1,"res://Instanciaveis/Enemies/Spider/Spider.tscn", "Spider")
	elif r == 3:
		global_res.instanciar_em_area(Vector2(80,140),Vector2(240,250),1,"res://Instanciaveis/Enemies/Spider/Spider.tscn", "Spider")

func inicia_ovos():
	global_res.instanciar_em_area(Vector2(20,200),Vector2(200,250),4,"res://Instanciaveis/Enemies/Spider_sack/Spider_sack.tscn", "SpiderSack")

func _on_Intro_animation_finished(anim_name):#Ao terminar a animacao o jogador pode se movimentar
	global_res.is_movable = true
