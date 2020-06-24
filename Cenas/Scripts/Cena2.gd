extends Node2D

func _ready():
	$Intro.play("Intro")
	global_res.is_movable = false

func _on_Intro_animation_finished(anim_name):
	global_res.is_movable = true
