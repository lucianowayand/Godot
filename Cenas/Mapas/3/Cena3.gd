extends Node2D

func _ready():
	inicia_rato()

func inicia_rato():
	global_res.instanciar_em_area($PontoA.position,$PontoB.position,1,"res://Instanciaveis/Enemies/Rato/Rato.tscn", "Rato")
