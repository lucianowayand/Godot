extends Node2D

func _ready():
	global_res.enemies_on_scene += 1
	var rand = RandomNumberGenerator.new()
	rand.randomize()
	var r = rand.randi_range(1,4)
	if  r == 1: 
		$Body/Rato.show()
	elif r == 2:
		$Body/Aranha.show()
	elif r == 3:	
		$Body/Queijo.show()
	elif r == 4:	
		$Body/Ovo.show()
		

func _physics_process(delta):
	$Body.move_and_slide(Vector2(0,75))

func _on_Area2D_area_entered(area):
	if area.name == "Blade":
		global_res.enemies_on_scene -= 1
		queue_free()
		
