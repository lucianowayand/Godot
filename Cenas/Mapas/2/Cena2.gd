extends "res://Cenas/map_default.gd"

onready var tip = false

func _ready():
	end_level = 5
	next_scene = "res://Cenas/Mapas/3/Cena3.tscn"
	inicia_ovos(4)
	inicia_aranha_sem_tocar_player()
	global_res.is_movable = false
	$Cinematic.play("Intro")
	
func _process(_delta):
	check_end($Buraco/BL.position,$Buraco/TR.position)
	shoot_tip()

func inicia_ovos(ovos):
	global_res.instanciar_em_area($Enemies/Spider_Sack/BL.position,$Enemies/Spider_Sack/TR.position,ovos,"res://Instanciaveis/Enemies/Spider_sack/Spider_sack.tscn","Spider_sack")

func inicia_aranha_sem_tocar_player(): #Funcao feita pra aranha nao nascer em contato com o jogador.
	var rand = RandomNumberGenerator.new()
	rand.randomize()
	var r = rand.randi_range(1,2)#A funcao instanciar em area recebe 2 opcoes, esquerda ou direita.
	if  r == 1: 
		global_res.instanciar_em_area($Enemies/Spider/BL1.position,$Enemies/Spider/TR1.position,1,"res://Instanciaveis/Enemies/Spider/Spider.tscn", "Spider")
	elif r == 2:
		global_res.instanciar_em_area($Enemies/Spider/BL1.position,$Enemies/Spider/TR1.position,1,"res://Instanciaveis/Enemies/Spider/Spider.tscn", "Spider")

func _on_Cinematic_animation_finished(_anim_name):
	global_res.is_movable = true
	
func shoot_tip():
		if end and !tip:
			$Tip/AnimationPlayer.play("Smooth")
			yield(get_tree().create_timer(1), "timeout")
			$Tip/AnimationPlayer.stop()
			tip = true
