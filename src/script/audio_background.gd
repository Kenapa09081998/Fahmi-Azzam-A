extends Node

var audio_player: AudioStreamPlayer = null

func _ready():
	play_audio()

func play_audio():
	audio_player = AudioStreamPlayer.new()
	add_child(audio_player)

	audio_player.stream = load("res://src/Asset/Ludum Dare 38 09.ogg")
	audio_player.autoplay = true

	audio_player.play()
