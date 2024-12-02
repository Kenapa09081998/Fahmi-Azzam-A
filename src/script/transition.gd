extends CanvasLayer

func change_scene(target) -> void:
	$AnimationPlayer.play("MOVECENTER")
	await $AnimationPlayer.animation_finished
	
	get_tree().change_scene_to_file(target)
	$AnimationPlayer.play("MOVEUP")
