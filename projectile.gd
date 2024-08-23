extends Sprite2D

@export var speed: float = 400

func _physics_process(delta: float) -> void:
	global_position += Vector2(speed * delta, 0)


func _on_area_2d_body_entered(body: Node2D) -> void:
	print("I hit something!")
