extends Node2D

func _ready():
	$Scroll/VScrollBar2.value = Global.anexo
	$VScrollBar.value = Global.altura_next
	
	var base = ($Paredes/B.position.x - $Paredes/A.position.x)/100
	var altura = ($Paredes/C.position.y - $Paredes/A.position.y)/100
	var area_total = base*altura
	#print("A largura eh ",base_entrada,"\nA altura eh ", altura_entrada,"\nA area eh ", area_entrada,"\n")
	#Area total = 54.675
		
	var altura_entrada = 675 - Global.anexo
	$Entrada/B.position.y = altura_entrada
	$Entrada/C.position.y = altura_entrada
	var base_entrada = (145.0)/100
	altura_entrada = altura_entrada/100
	var area_entrada = base_entrada * altura_entrada
	print("A largura eh ",base_entrada,"\nA altura eh ", altura_entrada,"\nA area eh ", area_entrada,"\n")
	
	$Next/A.position.y = Global.altura_next
	$Next/B.position.y = Global.altura_next
	var base_next = ($Next/B.position.x - $Next/A.position.x)/100
	Global.altura_next = Global.altura_next/100
	var area_next = base_next * Global.altura_next
	
	print("A largura eh ",base_next,"\nA altura eh", Global.altura_next,"\n\nA area do next eh ", area_next,"")
	
	var area_colmeia = area_total-(area_next+area_entrada)
		
	print("A area do colmeia eh ",area_colmeia)

	$Text/A1.position = ($Next/B.position + $Paredes/A.position)/2
	$Text/A1/Text.set("text",("A1\n"+String(area_next)))
	
	$Text/A3.position = ($Entrada/A.position + $Entrada/C.position)/2
	$Text/A3/Text.set("text",("A3\n"+String(area_entrada)))
	
	$Text/L1.position = ($Paredes/A.position + $Next/A.position)/2
	$Text/L1/Text.set("text",(String(Global.altura_next)+"m"))
	
	$Text/L2.position = ($Paredes/C.position + $Next/A.position)/2
	$Text/L2/Text.set("text",(String(6.75-Global.altura_next)+"m"))
	
	$Text/L3.position = ($Paredes/D.position + $Paredes/C.position)/2
	$Text/L3/Text.set("text",(String(base)+"m"))
	
	$Text/L4.position = ($Next/B.position + $Next/A.position)/2
	$Text/L4/Text.set("text",(String(base_next)+"m"))
	
	$Text/L5.position = ($Entrada/C.position + $Entrada/B.position)/2
	$Text/L5/Text.set("text",(String(base-base_next)+"m"))
	
	if Global.anexo != 0:
		$Text/L6.position = ($Entrada/C.position + $Paredes/D.position)/2
		$Text/L6/Text.set("text",(String((Global.anexo)/100)+"m"))
		$Porta_colmeia.position = ($Entrada/C.position + $Entrada/B.position)/2
		$Text/A2.position = ($Paredes/D.position + $Next/A.position)/2
		$Text/A2/Text.set("text",("A2\n"+String(area_colmeia)))
	else:
		$Text/L6.position = Vector2(9999,9999)
		$Porta_colmeia.position = ($Paredes/C.position + $Next/A.position)/2
		$Porta_colmeia.position.x = $Next/B.position.x
		$Porta_colmeia.set("rotation_degrees",0)
		$Porta_colmeia.set("scale",Vector2(1,1))
		$Text/A2.position = ($Next/B.position + $Next/A.position)/2
		$Text/A2.position.y = ($Paredes/C.position.y + $Next/A.position.y)/2
		$Text/A2/Text.set("text",("A2\n"+String(area_colmeia)))
	
	$Text/L7.position = ($Entrada/C.position + $Paredes/B.position)/2
	$Text/L7/Text.set("text",(String(altura_entrada)+"m"))
	
func _draw():
	draw_line($Paredes/A.position,$Paredes/B.position,Color(),1)
	draw_line($Paredes/B.position,$Paredes/D.position,Color(),1)
	draw_line($Paredes/D.position,$Paredes/C.position,Color(),1)
	draw_line($Paredes/C.position,$Paredes/A.position,Color(),1)
	
	draw_line($Entrada/A.position,$Entrada/B.position,Color(),1)
	draw_line($Entrada/B.position,$Entrada/C.position,Color(),1)
	
	draw_line($Next/A.position,$Next/B.position,Color(),1)
	draw_line($Next/B.position,$Entrada/A.position,Color(),1)

func _on_Button_pressed():
	Global.altura_next = $VScrollBar.value
	Global.anexo = $Scroll/VScrollBar2.value
	get_tree().reload_current_scene()

func _on_VScrollBar_value_changed(value):
	Global.altura_next = value

func _on_VScrollBar2_value_changed(value2):
	Global.anexo = value2
