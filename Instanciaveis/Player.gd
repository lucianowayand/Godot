extends KinematicBody2D

export var ACELERACAO = 10
export var VELOCIDADE_MAX = 30
export var FRICCAO = 4

var velocidade = Vector2.ZERO

onready var animacao = $AnimationPlayer
#onready var animacao = $AnimationTree.get("parameters/playback") #Pega o endereço das propriedades da AnimationTree (As caixinhas ligadas).

# warning-ignore:unused_argument
func _physics_process(delta): #A cada atualizacao
	if true: #movement
		var direcao = Vector2.ZERO #A direcao do "joystick" eh zerada.
		
		direcao.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left") #A variavel direcao recebe em x a posicao do "joystick"
		direcao.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up") #mesma coisa em y
		direcao = direcao.normalized() #Para evitar de andar mais rapido nas diagonais
		
		if (direcao != Vector2.ZERO) and global_res.is_movable:
			#A animacao muda para o estado walking.
			animacao.set_current_animation("andando")
			
			if direcao.x > 0:
				$Sprite.set_flip_h(false)
			elif direcao.x < 0:
				$Sprite.set_flip_h(true)
			
			#E a velocidade e alterada
			velocidade = velocidade.move_toward(direcao*VELOCIDADE_MAX, ACELERACAO)
		elif global_res.is_movable and not (direcao != Vector2.ZERO):
			#A animacao muda para o estado idle.
			animacao.set_current_animation("Idle")
			velocidade = velocidade.move_toward(Vector2.ZERO, FRICCAO)
				
			
		velocidade = move_and_slide(velocidade)

func grow():
	set_scale(Vector2(1.6,1.6))
	set_modulate(Color("b847dc"))
	#animacao = $AnimationPlayer2
