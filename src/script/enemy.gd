extends CharacterBody2D

const SPEED = 100
var HEALTH = 1
const BULLET = preload("res://src/scene/bullet.tscn")

func _process(delta: float) -> void:
	var player = get_node("/root/Arena/Player")
	var player_position = player.global_position

	var direction_to_player = (player_position - global_position).normalized()

	velocity = direction_to_player * SPEED
	
	move_and_slide()
	cekHealth()

func cekHealth():
	if HEALTH == 0:
		queue_free()

func _on_timer_timeout() -> void:
	shoot()

func shoot():
	var bullet = BULLET.instantiate()
	bullet.DIRECTION = Vector2.LEFT
	bullet.position = position
	bullet.TARGET = 'player'
	
	get_parent().add_child(bullet)
