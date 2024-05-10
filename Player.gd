extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	$Area2D.connect("area_entered", self, "_on_obstacle_area_entered")

func _physics_process(delta):

	if not is_on_floor():
		velocity.y += gravity * delta
	
	if is_on_floor():
		$AnimatedSprite2D.animation = "walk"

	if Input.is_action_just_pressed("up") and is_on_floor():
		$AnimatedSprite2D.animation = "jump"
		velocity.y = JUMP_VELOCITY
	

	
	move_and_slide()
