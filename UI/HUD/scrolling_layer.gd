extends ParallaxLayer
@onready var sprite_2d: Sprite2D = $Sprite2D

@export var texture: Texture2D 
@export var scroll_scale: float

const img_w: float = 1920.0
const img_h: float = 1080.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	motion_scale.x = scroll_scale
	var scale_f = get_viewport_rect().size.y / img_h
	sprite_2d.texture = texture
	sprite_2d.scale = Vector2(scale_f, scale_f)
	motion_mirroring.x = img_w * scale_f


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
