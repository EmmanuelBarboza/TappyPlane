extends Node2D

const PIPES : PackedScene = preload("res://scenes/Pipe/pipes_combined.tscn")

@onready var spawn_u: Marker2D = $SpawnU
@onready var spawn_l: Marker2D = $SpawnL
@onready var spawn_timer: Timer = $SpawnTimer
@onready var pipes_holder: Node2D = $PipesHolder
@onready var plane: Tappy = $Plane



func _ready() -> void:
	SignalManager.on_plane_die.connect(_on_plane_die)
	ScoreManager.set_score(0)
	spawn_pipes()

func _process(_delta: float) -> void:
	pass

func spawn_pipes() -> void:
	var new_pipes: Pipes_Combined = PIPES.instantiate()
	var y_pos: float = randf_range(spawn_u.position.y, spawn_l.position.y)
	new_pipes.global_position = Vector2(spawn_l.global_position.x, y_pos)
	pipes_holder.add_child(new_pipes)


func _on_spawn_timer_timeout() -> void:
	spawn_pipes()


func _on_plane_die() -> void:
	spawn_timer.stop()

#func stop_pipes() -> void:
	#spawn_timer.stop()
	#for pipe in pipes_holder.get_children():
		#pipe.set_process(false)
