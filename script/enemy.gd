extends Node2D

const SPEED = 60
@onready var explosion: bool = false
@onready var enemy_credits: int = GLOBAL.get_level()
@export var enemy_score: int = 100

func _process(delta):
	match explosion:
		false: global_position.x -= SPEED * delta

func explosion_ctrl() -> void:
	explosion = true
	$Area2D.queue_free()
	$Explosion.play("explosion")
	$Explosion/AudioExplosion.play()

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

func _on_area_2d_body_entered(body):
	if body is Player:
		explosion_ctrl()
		GLOBAL.credits -= 1
		if GLOBAL.credits <= 0:
			body.queue_free()

func _on_area_2d_area_entered(area):
	if area.is_in_group("Shoot"):
		enemy_credits -= 1
		if enemy_credits <= 0:
			explosion_ctrl()
			GLOBAL.score += enemy_score 
			GLOBAL.get_credit(enemy_score)
		else:
			$Hit.play("hit")
			$Hit/AudioHit.play()

func _on_audio_finished():
	queue_free()
	
	if GLOBAL.credits <= 0:
		get_tree().change_scene_to_file("res://scene/game_over.tscn")
