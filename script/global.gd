extends Node
#player score
var score: int = 0
var score_to_credit: int = 0
var credits: int = 1
var level: int = 1
var axis: Vector2

const enemy_spawn = {
	1: 20,
	2: 15,
	3: 10,
	4: 5,
	5: 1,
}

# return a vector whit the player direction
func get_axis() -> Vector2:
	axis.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	axis.y = int(Input.is_action_pressed("ui_up")) - int(Input.is_action_pressed("ui_down"))
	return axis.normalized()

func get_level() -> int:
	match score:
		1000: level = 2
		3000: level = 3
		6000: level = 4
		10000: level = 5
		15000: level = 6
		20000: level = 7
		25000: level = 8
		30000: level = 9
		35000: level = 10
		45000: level = 11
	return level

func get_credit(enemy_score: int) -> void:
	if score_to_credit == 5000:
		credits += 1
		score_to_credit = 0
	else:
		score_to_credit += enemy_score
		
func get_enemy_spawn() -> int:
	if level > 5:
		return 1
	return enemy_spawn[level]
