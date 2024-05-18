extends CharacterBody2D

const SPEED = 100
var current_direction = "none"
@onready var _animated_sprite = $AnimatedSprite2D


func _ready():
	_animated_sprite.play("front_idle")

func _physics_process(delta):
	player_movement(delta)

func player_movement(delta):
	if Input.is_action_pressed("ui_right"):
		current_direction = "right"
		play_animation(1)
		velocity.x = SPEED
		velocity.y = 0
	elif Input.is_action_pressed("ui_left"):
		current_direction = "left"
		play_animation(1)
		velocity.x = -SPEED
		velocity.y = 0
	elif Input.is_action_pressed("ui_down"):
		current_direction = "down"
		play_animation(1)
		velocity.x = 0
		velocity.y = SPEED
	elif Input.is_action_pressed("ui_up"):
		current_direction = "up"
		play_animation(1)
		velocity.x = 0
		velocity.y = -SPEED
	else:
		play_animation(0)
		velocity.x = 0
		velocity.y = 0
	
	move_and_slide()

func play_animation(movement):
	var direction = current_direction
	var animation =  _animated_sprite
	
	if direction == "right":
		animation.flip_h = false
		if movement == 1:
			animation.play("side_walk")
		elif movement == 0:
			animation.play("side_idle")
	if direction == "left":
		animation.flip_h = true
		if movement == 1:
			animation.play("side_walk")
		elif movement == 0:
			animation.play("side_idle")
	if direction == "down":
		animation.flip_h = true
		if movement == 1:
			animation.play("front_walk")
		elif movement == 0:
			animation.play("front_idle")
	if direction == "up":
		animation.flip_h = true
		if movement == 1:
			animation.play("back_walk")
		elif movement == 0:
			animation.play("back_idle")
