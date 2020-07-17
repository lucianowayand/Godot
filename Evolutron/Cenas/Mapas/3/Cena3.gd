extends "res://Cenas/map_default.gd"

func _ready():
	end_level = 9
	next_scene = "res://Cenas/Mapas/4/Cena4.tscn"
	inicia_queijos()
	inicia_rato()

func _process(delta):
	check_end($Buraco/BL.position,$Buraco/TR.position)

func inicia_rato():
	global_res.instanciar_em_area($Enemies/Rat/BL.position,$Enemies/Rat/TR.position,1,"res://Instanciaveis/Enemies/Rato/Rato.tscn", "Rato")

func inicia_queijos(): #Ao inicio da fase se instanciam "num" queijos.
	global_res.instanciar_em_area($Enemies/Cheese/BL.position,$Enemies/Cheese/TR.position,3,"res://Instanciaveis/Enemies/Rato/Cheese/Queijo.tscn", "Queijo")
