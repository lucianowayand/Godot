extends Node2D

export (String) var _text
var dialog_array = [""]
var index = 0

func _ready():
	$Fade.play("Fade")
	
	if len(_text) > 110:
		for i in range(int(len(_text)/110)+1):
			dialog_array.append("")
		
		var count = 0
		
		for i in _text:
			count += 1
			if count >= 100:
				if i == " " or i == ",":
					index += 1
					count = 0
			
			dialog_array[index] += i
	
	load_text(dialog_array)
	
func load_text(_text):
	for i in range(_text.size()+1):
		if i == _text.size():
			queue_free()
		else:
			$Label.text = _text[i]	
			$Label.visible_characters = 0
			$Tween.interpolate_property($Label,"visible_characters", 0, 110, 5, Tween.TRANS_LINEAR,Tween.EASE_IN_OUT)
			$Tween.start()
			yield(get_tree().create_timer(8),"timeout")
		
