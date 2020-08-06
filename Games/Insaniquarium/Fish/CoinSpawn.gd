extends "res://Fish/Timer.gd"

func _on_Timer_timeout():
	global.coins += 1
	print("coins")
