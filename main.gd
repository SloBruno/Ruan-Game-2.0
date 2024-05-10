extends Node2D


const obstacle_scene = preload("res://obstacle.tscn")
@onready var obstacle_container = $ObstacleContainer
@onready var timer = $Timer

func _ready():
	Globals.end_game.connect(_on_end_game)
	if Globals.start:
		$Timer.start()
		$CanvasLayer/Menu.visible = false
	$CanvasLayer/HUD/Score.text = str(Globals.score)

func _on_timer_timeout():
	Globals.score += 1
	$CanvasLayer/HUD/Score.text = str(Globals.score)
	
	var newObstacle = obstacle_scene.instantiate()
	
	newObstacle.global_position = Vector2(720, 188)
	obstacle_container.add_child(newObstacle)

func _on_start_pressed():
	if !Globals.start:
		Globals.start = true
		$Timer.start()
		$CanvasLayer/Menu.visible = false
	else:
		Globals.end = false
		Globals.score = 0
		get_tree().reload_current_scene()

func _on_end_game():
	$CanvasLayer/Menu.visible = true
