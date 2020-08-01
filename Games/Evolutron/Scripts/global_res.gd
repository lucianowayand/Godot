extends Node

var player_level = 0
var aux = 0
var is_movable = true
var screen = 0
var is_paused = false
var game_dir = (String(OS.get_executable_path().get_base_dir()))+"/"
var file_handler = File.new()
var is_on_editor = false
var enemies_on_scene = 0

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
	
	if aux != player_level:
		aux = player_level
		get_tree().call_group("Player","update_size")

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

func printscreen(local:String):
	var image = get_viewport().get_texture().get_data()
	image.flip_y()
	image.save_png(local)
	screen+=1
	print("A screenshot was taken and it is located on "+local)

func is_game_on_editor():
	if game_dir == "/home/luciano/.local/share/Steam/steamapps/common/Godot Engine/":
		 return true
	else:
		print(game_dir)

func get_directions():
	var direcao = Vector2.ZERO
	direcao.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left") #A variavel direcao recebe em x a posicao do "joystick"
	direcao.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up") #mesma coisa em y
	direcao = direcao.normalized() #Para evitar de andar mais rapido nas diagonais
	return direcao

