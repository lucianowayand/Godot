extends Node2D

func _ready():
	pass

func _process(_delta):
	$CanvasLayer/Label.set("text",String(global.coins))
	$CanvasLayer/Label3.set("text",String(global.fishes))
	
#	if global.coins < 10:
#		$CanvasLayer/Button.set("disabled", true)
#	else:
#		$CanvasLayer/Button.set("disabled", false)

func _on_Button_pressed():
	if global.fishes < 10:
		global.instanciar_em_area($Spawn_Area/BL.position,$Spawn_Area/TR.position,1,"res://Fish/Fish.tscn","Guppy")
		global.fishes+=1
		global.coins -=10

func _on_Coins_timeout():
	global.coins += 1
