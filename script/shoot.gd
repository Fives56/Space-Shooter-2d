extends Area2D

const SPEED = 290 

func _process(delta):
	global_position.x += SPEED * delta

func _on_area_entered(_area):
	queue_free()

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
