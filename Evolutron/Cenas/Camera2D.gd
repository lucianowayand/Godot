extends Camera2D

onready var background = get_tree().get_root().get_node("Mapa").find_node("Background")
onready var screen_size = Vector2(background.get("offset").x, background.get("offset").y)

func _ready():
	set("limit_right",2*screen_size.x)
	set("limit_bottom",2*screen_size.y)

