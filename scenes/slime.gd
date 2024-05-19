extends CharacterBody2D

@onready var _animated_sprite = $AnimatedSprite2D

const SPEED = 40
var player = null
var chasing = false

func _physics_process(delta):
	if chasing:
		position += (player.position - position) / SPEED
		_animated_sprite.play("chase")
		
		if (player.position.x - position.x < 0):
			_animated_sprite.flip_h = true
		else:
			_animated_sprite.flip_h = false
	else:
		_animated_sprite.play("idle")

func _on_detection_area_body_entered(body):
	player = body
	chasing = true



func _on_detection_area_body_exited(body):
	player = null
	chasing = false
	#_animated_sprite.play("idle")
