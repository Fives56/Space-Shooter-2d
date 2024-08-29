extends Control

func _process(_delta):
	%Score.text = str(GLOBAL.score)

func _on_restart_pressed():
	get_tree().change_scene_to_file("res://scene/level.tscn")

func _on_exit_pressed():
	get_tree().quit()
