extends Node2D

export var bottom = 270

func _ready():
	$Intro.play("Intro")
	global_res.is_movable = false
	instanciar_ovos(4)
	

func _on_Intro_animation_finished(anim_name):
	global_res.is_movable = true

func instanciar_ovos(numero):
	for _i in range(numero):
		var ovos = load("res://Instanciaveis/Enemies/Spider_sack/Spider_sack.tscn")
		var ovos_instancias = ovos.instance()
		ovos_instancias.set_name("SpiderSack"+String(numero))
		randomize()
		ovos_instancias.position = Vector2(rand_range(0,240),rand_range(190,270))
		add_child(ovos_instancias)
