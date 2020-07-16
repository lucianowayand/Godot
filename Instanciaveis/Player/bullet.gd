extends Node2D

onready var player = get_tree().get_root().get_node("Mapa").find_node("Player")
onready var position2d = player.get_node("Position2D")
onready var dir = Vector2.ZERO
onready var first_speed = 0
onready var stats
onready var _dir = false

func _ready():
	var direcao = global_res.get_directions()
	dir = direcao

func _physics_process(_delta):
	if dir == Vector2.ZERO and !_dir:
		if player.get("facing") == "right":
			dir.x = 1
		elif player.get("facing") == "left":
			dir.x = -1
		_dir = true
	
	position += dir
	
func _on_Area2D_area_entered(area):
	if area.name == "Enemy":
		var enemy = area.get_parent()
		stats = enemy.get_node("Stats")
		first_speed = stats.get("speed")
		stats.set("speed",0.05)
		queue_free()
		web(enemy)
		yield(get_tree().create_timer(2.5), "timeout")
		stats.set("speed",first_speed)
		
func web(enemy):
	var _load = load("res://Instanciaveis/Enemies/web_trap/web_trap.tscn")
	var _instancia = _load.instance()
	enemy.add_child(_instancia)
