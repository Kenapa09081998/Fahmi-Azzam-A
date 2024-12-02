extends Node2D

const PLAYER = preload("res://src/scene/player.tscn")
const ENEMY = preload("res://src/scene/enemy.tscn")

func _ready() -> void:
	spawnEnemy()

func spawnEnemy():
	var enemy = ENEMY.instantiate()
	enemy.position = Vector2(get_viewport_rect().size.x + 150, randi_range(0,get_viewport_rect().size.y))
	add_child(enemy)

func _on_area_2d_area_exited(area: Area2D) -> void:
	if area.is_in_group('bullet'):
		print('destroyed')
		area.queue_free()
