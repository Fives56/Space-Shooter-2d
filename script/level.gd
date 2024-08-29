extends Node2D

@export var enemy: PackedScene
@onready var path_spawn: PathFollow2D = $PathSpawn/PathFollow
 
func _ready() -> void:
	GLOBAL.score = 0
	GLOBAL.credits = 1 

func _process(delta) -> void:
	parallax_bg(delta)
	path_spawn.progress_ratio = fmod(path_spawn.progress_ratio + GLOBAL.get_enemy_spawn()  * delta, 1.0)

 
func parallax_bg(delta_time) -> void:
	$Background/Back.scroll_offset -= Vector2(1, 0) * 8 * delta_time
	$Background/Stars.scroll_offset -= Vector2(1, 0) * 16 * delta_time
	$Background/Planet_1.scroll_offset -= Vector2(1, 0) * 24 * delta_time
	$Background/Planet_2.scroll_offset -= Vector2(1, 0) * 24 * delta_time


func _on_timer_timeout():
	var enemy_instance = enemy.instantiate()
	enemy_instance.global_position = path_spawn.global_position
	add_child(enemy_instance)
