extends Node

@onready var slime_through_label: Label = $CanvasLayer/SlimeThroughLabel
@export var maximum_units_through: int = 5

func _ready() -> void:
	slime_through_label.text = str(maximum_units_through)

func _on_slime_detector_body_entered(body: Node2D) -> void:
	maximum_units_through -= 1
	slime_through_label.text = str(maximum_units_through)
