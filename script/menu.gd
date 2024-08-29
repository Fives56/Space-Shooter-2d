extends Control

func _process(delta):
	$Back.scroll_offset -= Vector2(1, 0) * 8 * delta
	$Stars.scroll_offset -= Vector2(1, 0) * 16 * delta

func _on_start_pressed():
	get_tree().change_scene_to_file("res://scene/level.tscn")


func _on_exit_pressed():
	get_tree().quit()
