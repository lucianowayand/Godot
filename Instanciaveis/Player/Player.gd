extends KinematicBody2D

export var ACELERACAO = 10
var VELOCIDADE_MAX = 30
export var FRICCAO = 4

var velocidade = Vector2.ZERO
onready var animacao = $base
onready var cooldown = false
onready var facing = "right"

func _ready():
	update_size()

# warning-ignore:unused_argument
func _physics_process(delta): #A cada atualizacao
	if true: #movement
		var direcao = global_res.get_directions()
		
		if (direcao != Vector2.ZERO) and global_res.is_movable:
			#A animacao muda para o estado moving.
			animacao.set_animation("moving")
			
			if direcao.x > 0:
				animacao.set_flip_h(false)
				$Position2D.position.x = 16
				facing = "right"
			elif direcao.x < 0:
				animacao.set_flip_h(true)
				$Position2D.position.x = -16
				facing = "left"
			
			#E a velocidade e alterada
			velocidade = velocidade.move_toward(direcao*VELOCIDADE_MAX, ACELERACAO)
		elif global_res.is_movable and not (direcao != Vector2.ZERO):
			#A animacao muda para o estado idle.
			animacao.set_animation("idle")
			velocidade = velocidade.move_toward(Vector2.ZERO, FRICCAO)
				
			
		velocidade = move_and_slide(velocidade)

	if true: #attack
		if Input.is_action_just_pressed("ui_attack") and !cooldown and global_res.player_level >= 5:
			var _load = load("res://Instanciaveis/Player/bullet.tscn")
			var _instancia = _load.instance()
			_instancia.global_position = $Position2D.global_position
			get_parent().add_child(_instancia)
			cooldown = true
			$Timer.start()

func update_size():
	if global_res.player_level < 4:
		pass
	elif global_res.player_level == 4:
		animacao.hide()
		animacao = $nv1
	elif global_res.player_level >= 5:
		animacao.hide()
		animacao = $nv2
	animacao.show()

func _on_Timer_timeout():
	cooldown = false
	
func _on_Player_area_entered(area):
	pass # Replace with function body.
