extends Area2D

@onready var game_manager: Node = %GameManager
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer


func _on_body_entered(body: Node2D) -> void:
	queue_free()
	game_manager.add_point()
