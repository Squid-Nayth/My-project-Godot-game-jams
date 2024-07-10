extends CharacterBody2D

const SPEED = 300
const JUMP_VELOCITY = -1200
var gravity = 2000
@onready var player_animation = $AnimatedSprite2D

func _physics_process(delta): 
	if Input.is_action_pressed("ui_left") :
		velocity.x = -SPEED
		player_animation.play("run")
		player_animation.flip_h = true
	elif Input.is_action_pressed("ui_right"): 
		velocity.x = SPEED
		player_animation.play("run")
		player_animation.flip_h = false
	else :
		player_animation.play("idle")
	if not is_on_floor():
		player_animation.play("jump")
		velocity.y = velocity.y + gravity * delta
	if Input.is_action_just_pressed("ui_up") and is_on_floor() : 
		velocity.y = JUMP_VELOCITY
		player_animation.play("jump")  
	if not is_on_floor():
		player_animation.play("jump")
		velocity.y = velocity.y + gravity * delta
		player_animation.play("idle")    
		
		
	velocity.x = lerp(velocity.x,0.0,0.1)
	move_and_slide()  
		
	 
	
	
	
	
	

	
	
	
	
	
	
