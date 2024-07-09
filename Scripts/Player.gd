extends CharacterBody2D

var speed : int = 200 
var jump_force : int = -400
var is_on_ground : bool = false 
var curren_state : String = "blue" # initial state is blue 
var Velocity : Vector2 = Vector2.ZERO 
var gravity : int = 2000
@onready var animated_sprite : AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape : CollisionShape2D = $CollisionShape2D

func _process(delta):
	pass
	
func _handle_input(delta): 
	
	if Input.is_action_pressed("ui_left"):
		Velocity.x -= speed
		$AnimatedSprite2D.play("run")
	if Input.is_action_pressed("ui_right"):
		Velocity.x += speed
		$AnimatedSprite2D.play("run")
	if Input.is_action_pressed("ui_up"):
		Velocity.y -= speed
	elif not is_on_floor():
		velocity.y += gravity
		$AnimatedSprite2D.play("jump")
	else:
		$AnimatedSprite2D.play("idle")
		
		move_and_slide()
		Velocity.x = lerp(velocity.x,0,0.1)

		
	
	
	
	
	
	
