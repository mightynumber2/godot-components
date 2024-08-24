extends CharacterBody2D

@export var speed: float = 200
@export var health: float = 100
@export var impact_damage: float = 50

@onready var health_bar: ProgressBar = $ProgressBar

signal died()

func _ready() -> void:
	health_bar.max_value = health
	health_bar.value = health

func _physics_process(delta: float) -> void:
	velocity = Vector2(-speed, 0)
	move_and_slide()

	var collision_count = get_slide_collision_count()
	for i in collision_count:
		var collision_info = get_slide_collision(i)
		var collider = collision_info.get_collider()
		
		if collider.has_method("take_damage"):
			collider.take_damage(impact_damage)
			died.emit()
			queue_free()

func take_damage(damage: float):
	health -= damage
	health_bar.value = health
	
	if health <= 0:
		died.emit()
		queue_free()
