class_name Tappy
extends CharacterBody2D




const GRAVITY: float = 600.0
const POWER: float = -350.0

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sound: AudioStreamPlayer2D = $Sound


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animated_sprite.play("fly")
	scale.x = 1
	scale.y = 1
	
	velocity = Vector2(0,POWER)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	
	if Input.is_action_just_pressed("secret"):
		animated_sprite.play("fly_paula")
		scale.x = 0.09
		scale.y = 0.09
	
	velocity.y += GRAVITY * delta
	fly()
	
	move_and_slide()
	
	if is_on_floor() == true or is_on_ceiling() == true:
		die()
	

func die() -> void:
	set_physics_process(false)
	animated_sprite.stop()
	sound.stop()
	SignalManager.on_plane_die.emit()

func fly() -> void:
	if Input.is_action_just_pressed("jump") == true:
		velocity.y = POWER
		animation_player.play("power")
