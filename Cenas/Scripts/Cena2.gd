extends Node2D

export var bottom = 270

func _ready():
	$Intro.play("Intro")
	global_res.is_movable = false
	instanciar_ovos(4)
	

func _on_Intro_animation_finished(anim_name):
	global_res.is_movable = true

func instanciar_ovos(numero):
	var ovos_instanciados = []
	
	for _i in range(numero):
		var ovos = load("res://Instanciaveis/Enemies/Spider_sack/Spider_sack.tscn")
		var ovos_instancias = ovos.instance()
		ovos_instancias.set_name("SpiderSack"+String(numero))
		
		# evitar instanciar ovos proximos demais
		randomize()
		var vec = Vector2(rand_range(0,240),rand_range(190,270))
		for i in range(ovos_instanciados.size()):
			while vec.distance_squared_to(ovos_instanciados[i].global_position) <= 1024:
				# pegar outro Vector2 aleatorio
				randomize()
				vec = Vector2(rand_range(0,240),rand_range(190,270))
				ovos_instancias.position = vec
		add_child(ovos_instancias)
		ovos_instanciados.append(ovos_instancias)
