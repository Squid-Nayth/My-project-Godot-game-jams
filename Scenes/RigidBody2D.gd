extends RigidBody2D

const FALL_SPEED = 300
const BOUNCE = 0.5

func _ready():
	set_mode(RigidBody2D.MODE_RIGID)
	set_collision_mask(1)  # Activer la collision avec le joueur

func _physics_process(delta):
	move_and_collide(Vector2.DOWN * FALL_SPEED)

func _on_collision(body):
	if body.has_method("change_state"):
		body.change_state("red")
		queue_free()  # Supprime la potion après la collision
