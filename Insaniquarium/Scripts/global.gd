extends Node

var fishes = 0
var coins = 0
var trash_can = false

func instanciar_em_area(ponto_a : Vector2=Vector2.ZERO, ponto_b : Vector2=Vector2.ZERO, numero : int=1, cena : String="", nome : String="Node"):
	if cena != "":
		for i in range(numero):
			var _load = load(cena)
			var _instancia = _load.instance()
			_instancia.set_name(nome+String(i))
			randomize()
			_instancia.position = Vector2(rand_range(ponto_a.x,ponto_b.x),rand_range(ponto_a.y,ponto_b.y))
			add_child(_instancia)
	else:
		print("Cena deve ser determinada")

func instanciar_em(posicao : Vector2=Vector2.ZERO, cena : String="", nome : String="Node"):
	if cena != "":
		var _load = load(cena)
		var _instancia = _load.instance()
		_instancia.set_name(nome)
		_instancia.position = posicao
		add_child(_instancia)
	else:
		print("Cena deve ser determinada")
		
func random(a,b):
	randomize()
	return (randi() % b + a)
