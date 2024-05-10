extends CharacterBody2D

const JUMP_VELOCITY = -400.0

@onready var anime = $AnimatedSprite2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):

	if not is_on_floor():
		velocity.y += gravity * delta
	
	if is_on_floor() && !Globals.end:
		anime.animation = "walk"

	if Input.is_action_just_pressed("up") and is_on_floor() and !Globals.end:
		anime.animation = "jump"
		velocity.y = JUMP_VELOCITY
	
	if !Globals.start:
		anime.stop()
	else:
		anime.play()
		
	move_and_slide()
