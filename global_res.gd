extends Node

var points = 0
var is_movable = true
var screen = 0
var is_paused = false

func _physics_process(_delta):
	if Input.is_action_just_pressed("print"):
		var image = get_viewport().get_texture().get_data()
		image.flip_y()
		image.save_png("res://Screenshots/screenshot"+String(screen)+".png")
		screen+=1
		print("A screenshot was taken and it is located on "+"res://Screenshots/screenshot"+String(screen)+".png")
	
	if Input.is_action_just_pressed("menu") and !is_paused and (get_tree().get_current_scene().get_name() != "Menu"):
		var scene = load("res://Cenas/Menu/Esc.tscn")
		var scene_instance = scene.instance()
		scene_instance.set_name("Esc")
		add_child(scene_instance)
		is_paused = true
