extends Node2D
var screen_size
var background_size
var last_size

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	last_size=screen_size
	background_size = Vector2($Player/Camera2D/ParallaxBackground/ParallaxLayer/Sprite2D.texture.get_width(),$Player/Camera2D/ParallaxBackground/ParallaxLayer/Sprite2D.texture.get_height())
	$Player/Camera2D/ParallaxBackground/ParallaxLayer.scale = screen_size / background_size
	$Player/Camera2D/ParallaxBackground/ParallaxLayer/Sprite2D.scale = screen_size/background_size
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float):
	screen_size = get_viewport_rect().size
	if(screen_size!=last_size): changeBackgroundScale()

func changeBackgroundScale():
	$Player/Camera2D/ParallaxBackground/ParallaxLayer.motion_mirroring *= ((screen_size / background_size)/$Player/Camera2D/ParallaxBackground/ParallaxLayer.scale)
	$Player/Camera2D/ParallaxBackground/ParallaxLayer.scale = screen_size / background_size
	$Player/Camera2D/ParallaxBackground/ParallaxLayer/Sprite2D.scale = screen_size/background_size
	
	last_size=screen_size
