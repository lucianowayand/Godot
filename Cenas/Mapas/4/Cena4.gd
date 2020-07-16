extends "res://Cenas/map_default.gd"

func ready():
	global_res.is_movable = false

func _process(delta):
	if global_res.enemies_on_scene < 50:
		global_res.instanciar_em_area($Enemies/TL.position,$Enemies/BR.position,1,"res://Cenas/Mapas/4/Monster.tscn","Rato")


func _on_Blade_body_entered(body):
	if body.name == "Player":
		yield(get_tree().create_timer(2), "timeout")
		$Sprite.play()

func _on_Sprite_animation_finished():
	$FadeOut/Fade.play("Nova Animação")

func _on_Fade_animation_finished(anim_name):
	yield(get_tree().create_timer(2), "timeout")
	get_tree().change_scene("res://Cenas/Menu/Menu.tscn")
