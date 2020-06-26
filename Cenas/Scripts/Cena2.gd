extends Node2D

export var bottom = 270

func _ready():
	$Intro.play("Intro")
	global_res.is_movable = false
	instanciar_ovos(4)
	

func _on_Intro_animation_finished(anim_name):
	global_res.is_movable = true
