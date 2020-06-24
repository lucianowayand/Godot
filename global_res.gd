extends Node

var points = 0
var is_movable = true
var screen = 0
var is_paused = false
var camera_pos = Vector2.ZERO

func _physics_process(_delta):
	if Input.is_action_just_pressed("print"):
		var image = get_viewport().get_texture().get_data()
		image.flip_y()
		image.save_png("res://Screenshots/screenshot"+String(screen)+".png")
		screen+=1
		print("A screenshot was taken and it is located on "+"res://Screenshots/screenshot"+String(screen)+".png")
