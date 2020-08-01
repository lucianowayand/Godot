extends Node2D

var end_level
var end = false #Variavel criada para executar somente uma vez a instanciaçao. 
var next_scene
onready var start_level = global_res.player_level

func ready():
	$AudioStreamPlayer2D.play()

func check_end(pontoa,pontob):
	if global_res.player_level == end_level and !end: #Ao consumir todos os inimigos se passa para a proxima fase.
		abre_buraco(pontoa,pontob,next_scene)
		end = true

func abre_buraco(ponto_a : Vector2=Vector2.ZERO, ponto_b : Vector2=Vector2.ZERO, cena : String=""):
	if cena != "":
		var _load = load("res://Instanciaveis/Hole.tscn")
		var _instancia = _load.instance()
		_instancia.set_name("Buraco")
		randomize()
		_instancia.position = Vector2(rand_range(ponto_a.x,ponto_b.x),rand_range(ponto_a.y,ponto_b.y))
		_instancia.set("scene",cena)
		add_child(_instancia)
