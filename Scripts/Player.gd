extends CharacterBody2D

var speed : int = 200 
@onready var animated_sprite = $AnimatedSprite2D
var Velocity = Vector2(0,0)

func _player_movement(delta): 
	
	if Input.is_action_pressed("ui_left"):
		Velocity.x -= speed
		animated_sprite.play("run")
		animated_sprite.flip_h = true
	if Input.is_action_pressed("ui_right"):
		Velocity.x += speed
		animated_sprite.flip_h = false
	if Input.is_action_pressed("ui_up"):
		Velocity.y -= speed
		animated_sprite.play("jump")
	elif not is_on_floor():
		animated_sprite.play("jump")
	else:
		Velocity.x = 0 
		Velocity.y = 0
		animated_sprite.play("idle")
		
		move_and_slide()
		velocity.x = lerp(velocity.x,0,0.1)

	
	
	
	
	
	
