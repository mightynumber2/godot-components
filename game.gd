extends Node

@onready var score_label: Label = $CanvasLayer/ScoreLabel
@onready var slime_through_label: Label = $CanvasLayer/SlimeThroughLabel
@onready var game_over_label: Label = $CanvasLayer/GameOverLabel

@export var maximum_units_through: int = 2


var points: int = 0

func _ready() -> void:
	slime_through_label.text = str(maximum_units_through)

func _on_slime_detector_body_entered(body: Node2D) -> void:
	maximum_units_through -= 1
	slime_through_label.text = str(maximum_units_through)
	
	if maximum_units_through <= 0:
		game_over_label.visible = true
		var to_destroy = get_tree().get_nodes_in_group("destroyed_on_game_over")
		for item in to_destroy:
			item.queue_free()

func _on_slime_died():
	points += 1
	score_label.text = str(points)
