extends Node

var inv_on_screen = false
var pause_on_screen = false

var hp_max = float(12)
var hp = float(12)
onready var aux_hp = hp_max

var st_max = float(8)
var st = float(8)
onready var aux_st = st_max

func _ready():
	get_node("../Node2D/Player/CanvasLayer/HP/HP_number").text = String(hp)+"/"+String(hp_max)
	get_node("../Node2D/Player/CanvasLayer/ST/ST_number").text = String(st)+"/"+String(st_max)

# warning-ignore:unused_argument
func _process(delta):
	if true: #Update HP and ST values
		if hp != aux_hp:
			aux_hp = hp
			get_node("../Node2D/Player/CanvasLayer/HP/HP_animation").play("hp")
			get_node("../Node2D/Player/CanvasLayer/HP/HP_number").text = String(hp)+"/"+String(hp_max)
			get_node("../Node2D/Player/CanvasLayer/HP/HP").set("margin_right",54+(85*(hp/hp_max)))

		if st != aux_st:
			aux_st = st
			get_node("../Node2D/Player/CanvasLayer/ST/ST_animation").play("st")
			get_node("../Node2D/Player/CanvasLayer/ST/ST_number").text = String(st)+"/"+String(st_max)
			get_node("../Node2D/Player/CanvasLayer/ST/ST").set("margin_right",54+(85*(st/st_max)))

func _input(event):
	if true: #Pause menu
		if event.is_action_pressed("pause") and !pause_on_screen and !inv_on_screen:
			get_node("../Node2D/Player/CanvasLayer/Pause").show()
			get_node("../Node2D/Player/CanvasLayer/UI").hide()
			get_node("../Node2D/Player/CanvasLayer/HP").hide()
			get_node("../Node2D/Player/CanvasLayer/ST").hide()
			pause_on_screen = true
			
		elif event.is_action_pressed("pause") and pause_on_screen:
			resume()
	
	if true: #Inventory
		if event.is_action_pressed("inventory") and !inv_on_screen and !pause_on_screen:
			get_node("../Node2D/Player/CanvasLayer/Inventory").show()
			inv_on_screen = true
		elif (event.is_action_pressed("inventory") and inv_on_screen) or (event.is_action_pressed("pause") and inv_on_screen):
			get_node("../Node2D/Player/CanvasLayer/Inventory").hide()
			inv_on_screen = false
			
	if event.is_action_pressed("debug"):
		if hp > 0:
			hp -= 1

		if st > 0:
			st -= 1

func create_dialog(text):
	var dialog_box = preload("res://Prefabs/Dialog/Dialog.tscn").instance()
	dialog_box._text = text
	get_parent().add_child(dialog_box)

func resume():
	get_node("../Node2D/Player/CanvasLayer/Pause").hide()
	get_node("../Node2D/Player/CanvasLayer/UI").show()
	get_node("../Node2D/Player/CanvasLayer/HP").show()
	get_node("../Node2D/Player/CanvasLayer/ST").show()
	pause_on_screen = false
