extends Node2D

func _ready():
	global_res.is_movable = false
	$CanvasLayer/Node2D/Player/Anima.play("intro")
	$CanvasLayer/Wall/AnimationPlayer.play("Intro]")

func _on_AnimationPlayer2_animation_finished(_anim_name):
	global_res.is_movable = true
