extends Marker2D

@export var spawn_interval_min: float = 2
@export var spawn_interval_max: float = 3
@export var items: Array[PackedScene] = []

signal fish_died()

func _ready() -> void:
	spawn_something()

func spawn_something():
	var slime_scene = items.pick_random()
	var new_slime = slime_scene.instantiate()
	
	new_slime.died.connect(on_fish_died)
	
	add_child(new_slime)

	get_tree().create_timer(randf_range(spawn_interval_min, spawn_interval_max)).timeout.connect(spawn_something)
	
func on_fish_died():
	fish_died.emit()
	
func on_game_over():
	queue_free()
