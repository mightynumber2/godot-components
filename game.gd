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
		propagate_call("on_game_over")

func _on_slime_died():
	points += 1
	score_label.text = str(points)
