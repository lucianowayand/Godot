extends Node2D

func _on_Area2D_body_entered(body): #Quando o player entra na toca ele cai para a fase da aranha.
	remove_child($Player)
	get_tree().change_scene("res://Cenas/Cena2.tscn")
