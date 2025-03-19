extends Node2D
var full_opacity_threshold = 120
var min_opacity_distance = 600
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float):
	#current issues: alpha does not reset upon returning to a node.
	for n in $textboxes.get_children():
		var nCenter = n.global_position +(get_viewport_rect().size /2)
		var distance = abs(nCenter.x-$Player.global_position.x)
		if distance>min_opacity_distance:
			n.modulate.a = 0.0
		elif(distance<full_opacity_threshold):
			n.modulate.a=1
		else:
			var alpha = 1.0-(distance/(min_opacity_distance))
			n.modulate.a=alpha
