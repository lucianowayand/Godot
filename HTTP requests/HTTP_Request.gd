extends Node2D


func _ready():
	$HTTPRequest.use_threads = true
	
func _on_Button_pressed():
	$HTTPRequest.request("https://pokeapi.co/api/v2/pokemon/"+$TextEdit.text.to_lower())
	
func _on_HTTPRequest_request_completed(result, response_code, headers, body : PoolByteArray):
	if response_code != 404:
		var data : String = body.get_string_from_utf8()
		var jason : Dictionary = parse_json(data)
		$Name.text = (jason.get("species").get("name")).capitalize()
		
		var image_request = $ImageRequest.request(jason.get("sprites").get("front_default"))
		if image_request != OK:
			print("Couldn't get the image on the requested url :(")
		
		
	else:
		$Name.text = "MissingNo."
		$TextureRect.texture = load("res://icon.png")
		print("Couldnt find "+$TextEdit.text+" in the Pokedex :(")


func _on_ImageRequest_request_completed(result, response_code, headers, body):
	var image = Image.new()
	var image_error = image.load_png_from_buffer(body)
	if image_error != OK:
		print("Couldn't load the requested image :(")
		
	var texture = ImageTexture.new()
	texture.create_from_image(image)
	
	$TextureRect.texture = texture
