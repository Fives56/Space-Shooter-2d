extends CharacterBody2D
class_name Player

@export var shoot: PackedScene
@onready var scrensize = get_viewport_rect().size
const SPEED: int = 80

func _process(_delta):
	anim_ctrl()
	motion_ctrl()
	
func _input(event):
	if event.is_action_pressed("ui_accept"):
		shoot_ctrl()
		
func anim_ctrl() -> void:
	if GLOBAL.get_axis().y > 0:
		$Spaceship.animation = "up"
	elif GLOBAL.get_axis().y < 0:
		$Spaceship.animation = "down"
	else:
		$Spaceship.animation = "idle"
		
func motion_ctrl() -> void:
	velocity.x = GLOBAL.get_axis().x * SPEED
	velocity.y = GLOBAL.get_axis().y * -SPEED
	move_and_slide()
	
	position.x = clamp(position.x, 0, scrensize.x)
	position.y = clamp(position.y, 0, scrensize.y)
	

func shoot_ctrl() -> void:
	$Flash.play("flash")
	$Settings/AudioShoot.play()
	
	var shoot_instance = shoot.instantiate()
	shoot_instance.global_position = $Settings/ShootSpawn.global_position
	get_tree().call_group("Level", "add_child", shoot_instance)
