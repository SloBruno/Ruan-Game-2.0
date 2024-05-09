extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if is_on_floor():
		$AnimatedSprite2D.animation = "walk"
		
	# Handle jump.
	if Input.is_action_just_pressed("up") and is_on_floor():
		$AnimatedSprite2D.animation = "jump"
		velocity.y = JUMP_VELOCITY

	
	move_and_slide()