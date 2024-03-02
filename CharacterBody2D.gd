#extends CharacterBody2D
#
#
#@export var speed : float = 200.0
#@export var jumpVelocity : float = -350.0
#@export var doubleJumpVelocity : float = -250.0
#@onready var _animated_sprite = $AnimatedSprite2D
#
## Get the gravity from the project settings to be synced with RigidBody nodes.
#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
#var hasDoubleJumped : bool = false
#var animationLocked : bool = false
#var direction : Vector2 = Vector2.ZERO
#
#
#
#func _physics_process(delta):
	#direction = Input.get_vector("left", "right", "Jump", "getDown")
	#Horizontalmovement()
	#jumpPlayer(delta)
	#
	#move_and_slide()
	#updateAnimation()
#
##Handle the movement
#func Horizontalmovement():
	#
	#if direction:
		#velocity.x = direction.x * speed
		#_animated_sprite.flip_h = velocity.x < 0
		##velocity.y = move_toward(velocity.x, 0, SPEED) #Si se pone aquí sirve para levitar/planear
	#else:
		#velocity.x = move_toward(velocity.x, 0, speed)
#
##Handle JUMP
#func jumpPlayer(delta):
	#
	#if not is_on_floor():
		#velocity.y += gravity * delta
		##velocity.x = direction * speed
		##_animated_sprite.play("jump2")
	#else:
		#hasDoubleJumped = false
	#if Input.is_action_just_pressed("Jump"):
		#_animated_sprite.play("jump")
		#if is_on_floor():
			#velocity.y = jumpVelocity
			#velocity.x = move_toward(velocity.y, 0, speed)
		#elif not hasDoubleJumped:
			#velocity.y = doubleJumpVelocity
			#hasDoubleJumped = true
#
##Handle ATTACK
#func attackPlayer():
	#if Input.is_action_just_pressed("Attack") and is_on_floor():
		##_animated_sprite.play("attack")
		#print("ATAAACK")
#
#func updateAnimation():
	#if not animationLocked:
		#if direction.x != 0:
			#_animated_sprite.play("Run")
		#else:
			#_animated_sprite.play("Idle")
#
#
#func _on_animated_sprite_2d_animation_finished():
	#if _animated_sprite.animation == "jump_end":
		#animationLocked = false
