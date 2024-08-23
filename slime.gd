extends CharacterBody2D

@export var speed: float = 200
@export var health: float = 100

@onready var progress_bar: ProgressBar = $ProgressBar

func _ready() -> void:
	progress_bar.max_value = health
	progress_bar.value = health

func _physics_process(delta: float) -> void:
	velocity = Vector2(-speed, 0)
	move_and_slide()

func take_damage(damage: float):
	health -= damage
	progress_bar.value = health
	print(damage)
	
	if health <= 0:
		queue_free()
