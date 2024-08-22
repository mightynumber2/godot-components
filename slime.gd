extends Sprite2D

func _physics_process(delta: float) -> void:
	global_position += Vector2(-200 * delta, 0)
