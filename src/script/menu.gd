extends Control

const ARENA = "res://src/scene/arena.tscn"

func _on_start_button_down() -> void:
	SceneTransition.change_scene(ARENA)

func _on_exit_button_down() -> void:
	get_tree().quit()
