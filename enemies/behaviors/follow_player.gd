extends Node


@export var speed: float = 1

var enemy: Enemy
var sprite: AnimatedSprite2D

func _ready():
	enemy = get_parent()
	sprite = enemy.get_node("AnimatedSprite2D")


func _physics_process(delta: float) -> void:
	# Ignorar GameOver
	if GameManager.is_game_over: return
	
	# Calcular direção
	var player_position = GameManager.player_position
	var difference = player_position - enemy.position
	var input_vector = difference.normalized()
	
	# Movimenta
	enemy.velocity = input_vector * speed * 100.0
	enemy.move_and_slide()
	
	
	# Virar sprite
	if input_vector.x > 0:
		# Flip H do Sprite2D desmarcado
		sprite.flip_h = false
	elif input_vector.x < 0:
		# Flip H do Sprite2D marcado
		sprite.flip_h = true
