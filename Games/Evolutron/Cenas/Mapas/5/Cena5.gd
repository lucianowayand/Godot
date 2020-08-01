extends "res://Cenas/map_default.gd"

func _ready():
	Song.stop()
	global_res.player_level = 10
	$Intro.play("Intro")
	$Player.animacao.play("falling")

func _on_Intro_animation_finished(anim_name):
	global_res.is_movable = true


func _on_Area2D_body_entered(body):
	if body.name == "Player":
		$Tip/AnimationPlayer.play("Smooth")

func _on_AnimationPlayer_animation_finished(anim_name):
	get_tree().quit()
