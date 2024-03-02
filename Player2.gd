extends CharacterBody2D

class_name Player

const SPEED = 100.0
const JUMP_VELOCITY = -300.0

@onready var _animated_sprite = $AnimatedSprite2D
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var collected_coins = 0

func recollect_coins(value):
	collected_coins += value

func _ready():
	GlobalScript.player= self

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		if not is_on_floor() and Input.is_action_just_pressed("Jump"):
			_animated_sprite.play("jump")

	_horizontalMovement()
	move_and_slide()
	
func _horizontalMovement():
	var direction = Input.get_axis("left", "right")
	if direction:
		if is_on_floor():
			velocity.x = direction * SPEED
			_animated_sprite.play("Run")
		_animated_sprite.flip_h = velocity.x < 0
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if is_on_floor():
			_animated_sprite.play("Idle")

func die():
	GlobalScript.respawnPlayer()
