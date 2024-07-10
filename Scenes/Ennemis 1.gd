extends CharacterBody2D


const SPEED = 2000
var direction = Vector2.LEFT  
func _ready():
	set_process(true)  
	$AnimatedSprite2D.play("walk")

func _process(delta):
	velocity = direction * SPEED * delta
	move_and_slide()

	
	if position.x < 0 : 
		direction = Vector2.RIGHT  
		$AnimatedSprite2D.flip_h = false   
	elif position.x > get_viewport_rect().size.x:
		direction = Vector2.LEFT   
		$AnimatedSprite2D.flip_h = true    
