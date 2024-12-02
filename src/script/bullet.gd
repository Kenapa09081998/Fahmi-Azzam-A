extends Area2D

const SPEED:int = 1000

var DIRECTION: Vector2
var TARGET: String

func _ready():
	add_to_group('bullet')

func _process(delta: float) -> void:
	position += DIRECTION * SPEED * delta

func _on_body_entered(body: Node2D) -> void:
	if TARGET != 'player':
		if body.is_in_group(TARGET):
			body.HEALTH -= 1
			
			body.queue_free()
			queue_free()
	else:
		if body.is_in_group(TARGET):
			body.get_hit()
			queue_free()
