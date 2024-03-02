extends CharacterBody2D


const SPEED = -50.


#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var facing_right = false
@onready var _animated_sprite = $AnimatedSprite2D

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += delta
	_animated_sprite.play("fly")
	velocity.x = SPEED
	

	move_and_slide()
