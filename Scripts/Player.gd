extends CharacterBody2D

const SPEED = 300
const JUMP_VELOCITY = -1200
var gravity = 2000
var current_state : String = "blue"
@onready var player_animation = $AnimatedSprite2D

func _physics_process(delta): 
	if Input.is_action_pressed("ui_left") :
		velocity.x = -SPEED
		player_animation.play("run_blue")
		player_animation.flip_h = true
	elif Input.is_action_pressed("ui_right"): 
		velocity.x = SPEED
		player_animation.play("run_blue")
		player_animation.flip_h = false
	else :
		player_animation.play("idle_blue")
	if not is_on_floor():
		player_animation.play("jump_blue")
		velocity.y = velocity.y + gravity * delta
	if Input.is_action_just_pressed("ui_up") and is_on_floor() : 
		velocity.y = JUMP_VELOCITY
		player_animation.play("jump_blue")  
	if not is_on_floor():
		player_animation.play("jump_blue")
		velocity.y = velocity.y + gravity * delta
		player_animation.play("idle_blue")    
		
		
	velocity.x = lerp(velocity.x,0.0,0.1)
	move_and_slide()  
		
	 
	
	
	
	
	
	
