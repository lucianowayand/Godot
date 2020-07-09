extends Node2D

onready var player = get_tree().get_root().get_node("Mapa").find_node("Player")
onready var position2d = player.get_node("Position2D")
onready var dir = 0
onready var slower = get_parent()
onready var first_speed = 0

func _ready():
	if position2d.position.x < 0:
		dir = 1
	else:
		dir = -1
		
func _physics_process(delta):
	if dir == 1:
		position.x -= 1.5
	else:
		position.x += 1.5
		
func _on_Area2D_area_entered(area):
	if area.name == "Enemy":
		slower = area.get_parent().get_node("Stats")
		first_speed = slower.get("speed")
		slower.set("speed",0.05)
		$Sprite.hide()

func _on_Timer_timeout():
	slower.set("speed",first_speed)
	queue_free()
