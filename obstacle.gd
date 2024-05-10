extends Area2D

var speed := 400

func _physics_process(delta):
	if !Globals.end:
		global_position.x = move_toward(global_position.x, -1000, speed * delta)
		
func _on_body_entered(body):
	Globals.end = true
	body.anime.play("dying")
	speed = 0
	get_tree().current_scene.timer.stop()
	Globals.end_game.emit()

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
