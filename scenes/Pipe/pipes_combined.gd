class_name Pipes_Combined
extends Node2D

const OFF_SCREEN : float = -500.0
@onready var score_sound: AudioStreamPlayer2D = $ScoreSound
@onready var visible_on_screen: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D


func  _ready() -> void:
	SignalManager.on_plane_die.connect(on_plane_died)
	


func _process(delta: float) -> void:
	position.x -= GameManager.SCROLL_SPEED * delta
	check_off_screen()

func check_off_screen() -> void:
	
	if visible_on_screen.global_position.x < get_viewport_rect().position.x:
		print("Despawn")
		queue_free()

func on_plane_died() -> void:
	set_process(false)

func _on_screen_exited() -> void:
	set_process(false)
	queue_free()


func _on_pipe_body_entered(body: Node2D) -> void:
	print(body)
	if body is Tappy:
		body.die()
	
	#if body.is_in_group(GameManager.GROUP_PLANE) == true:
		#if body.has_method("die"):
			#body.die()


func _on_laser_body_entered(body: Node2D) -> void:
	if body is Tappy:
		increment_score()

func increment_score() -> void:
	score_sound.play()
	ScoreManager.increment_score()
