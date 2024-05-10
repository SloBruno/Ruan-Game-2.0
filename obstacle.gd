extends Area2D

var speed := 100

func _ready():
	position.x = 720


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x = move_toward(position.x, -1000, speed * delta)
	if position.x < -100:
		position.x = 720
