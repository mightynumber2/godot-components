extends StaticBody2D

@onready var timer: Timer = %Timer
@onready var health_bar: ProgressBar = %HealthBar
@export var health = 500
@export var parent_of_projectiles: NodePath



func _ready() -> void:
	timer.timeout.connect(_on_timer_timeout)
	timer.start()
	
	health_bar.max_value = health
	health_bar.value = health
	
func _on_timer_timeout():
	var projectile_scene = preload("res://projectile.tscn")
	var new_projectile = projectile_scene.instantiate()
	
	new_projectile.global_position = global_position
	
	var parent = get_node(parent_of_projectiles)
	parent.add_child(new_projectile)
	
	
func on_game_over():
	queue_free()
	
func take_damage(damage: float):
	health -= damage
	health_bar.value = health
	
	if health <= 0:
		queue_free()
