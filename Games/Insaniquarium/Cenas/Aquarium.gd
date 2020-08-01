extends Node2D

func _ready():
	pass

func _process(_delta):
	$CanvasLayer/Label.set("text",String(global.coins))
	$CanvasLayer/Label3.set("text",String(global.fishes))
	
func _on_Coins_timeout():
	global.coins += 1

func _on_Trash_toggled(button_pressed):
	global.trash_can = button_pressed

func _on_Button_pressed():
	if global.fishes < 10:
		global.instanciar_em_area($Spawn_Area/BL.position,$Spawn_Area/TR.position,1,"res://Fish/Guppy/Guppy.tscn","Guppy")
		global.fishes+=1
		global.coins -=10
		
#	if global.coins < 10:
#		$CanvasLayer/Button.set("disabled", true)
#	else:
#		$CanvasLayer/Button.set("disabled", false)

func _on_Button2_pressed():
	if global.fishes < 10:
		global.instanciar_em_area($Spawn_Area/BL.position,$Spawn_Area/TR.position,1,"res://Fish/Reddy/Reddy.tscn","Reddy")
		global.fishes+=1
		global.coins -= 25
