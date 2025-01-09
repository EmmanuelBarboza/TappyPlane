extends Control

@onready var space_label: Label = $SpaceLabel
@onready var continue_timer: Timer = $ContinueTimer
@onready var game_over_label: Label = $GameOverLabel
@onready var game_over_sound: AudioStreamPlayer = $GameOverSound


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()
	SignalManager.on_plane_die.connect(on_plane_died)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if(space_label.visible and Input.is_action_just_pressed("jump")):
		GameManager.load_main_scene()


func _on_continue_timer_timeout() -> void:
	game_over_label.hide()
	space_label.show()

func on_plane_died() -> void:
	show()
	continue_timer.start()
	game_over_sound.play()
	ScoreManager.save_high_score()
