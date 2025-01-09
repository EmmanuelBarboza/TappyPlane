extends Control

@onready var score_label: Label = $MarginContainer/ScoreLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalManager.on_score_updated.connect(on_score_updated)

func on_score_updated() -> void:
	score_label.text = str(ScoreManager.get_score())


func _on_touch_screen_button_pressed() -> void:
	print("Touched")
