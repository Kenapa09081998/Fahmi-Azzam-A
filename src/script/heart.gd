extends Node2D

var HEARTH
var LENGTH

signal PLAYER_DEATH

func _ready() -> void:
	get_health()

func hit():
	if LENGTH >= 0:
		HEARTH[LENGTH].queue_free()
		LENGTH -= 1
		
	if(LENGTH < 0):
		PLAYER_DEATH.emit()

func get_health():
	HEARTH = get_tree().get_nodes_in_group('heart')
	LENGTH = HEARTH.size() - 1
