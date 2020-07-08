extends Node

var player_level = 0
var is_movable = true
var screen = 0
var is_paused = false
var game_dir = (String(OS.get_executable_path().get_base_dir()))+"/"
var file_handler = File.new()
var is_on_editor = false

func _ready():
	is_on_editor = is_game_on_editor()
	
	if file_handler.file_exists(game_dir+"test.txt"):
		pass

func _physics_process(_delta):
	if Input.is_action_just_pressed("print"):#Printscreen
		if is_on_editor:
			printscreen("/home/luciano/Imagens/Screenshot/screenshot"+String(screen)+".png")
		else:
			printscreen(game_dir+"screenshot"+String(screen)+".png")
	
	if player_level == 4:
		get_tree().call_group("Player","grow")

func instanciar_em_area(ponto_a : Vector2=Vector2.ZERO, ponto_b : Vector2=Vector2.ZERO, numero : int=1, cena : String="", nome : String="Node"):
	if cena != "":
		for i in range(numero):
			var _load = load(cena)
			var _instancia = _load.instance()
			_instancia.set_name(nome+String(i))
			randomize()
			_instancia.position = Vector2(rand_range(ponto_a.x,ponto_a.y),rand_range(ponto_b.x,ponto_b.y))
			_instancia.set("z_index",3)
			add_child(_instancia)
	else:
		print("Cena deve ser determinada")

func abre_buraco(ponto_a : Vector2=Vector2.ZERO, ponto_b : Vector2=Vector2.ZERO, cena : String=""):
	if cena != "":
		var _load = load("res://Instanciaveis/Hole.tscn")
		var _instancia = _load.instance()
		_instancia.set_name("Buraco")
		randomize()
		_instancia.position = Vector2(rand_range(ponto_a.x,ponto_a.y),rand_range(ponto_b.x,ponto_b.y))
		_instancia.set("z_index",3)
		_instancia.set("scene",cena)
		add_child(_instancia)

func printscreen(local:String):
	var image = get_viewport().get_texture().get_data()
	image.flip_y()
	image.save_png(local)
	screen+=1
	print("A screenshot was taken and it is located on "+local)

func is_game_on_editor():
	if game_dir == "/home/luciano/.steam/debian-installation/steamapps/common/Godot Engine/":
		 return true
