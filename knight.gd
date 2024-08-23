extends StaticBody2D

@onready var timer: Timer = %Timer
@export var health = 500
@onready var health_bar: ProgressBar = %HealthBar


func _ready() -> void:
	timer.timeout.connect(_on_timer_timeout)
	timer.start()
	
	health_bar.max_value = health
	health_bar.value = health
	
func _on_timer_timeout():
	var projectile_scene = preload("res://projectile.tscn")
	var new_projectile = projectile_scene.instantiate()
	add_child(new_projectile)
