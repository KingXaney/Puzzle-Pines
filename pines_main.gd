extends Node2D
var full_opacity_threshold = 30
var min_opacity_distance = 600
signal LockPlayer(lockBool: bool)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float):
	#cadjusts alpha value of labels and their child buttons depending on the distance between them. 
	for n in $textboxes.get_children():
		var nCenter = n.global_position +(get_viewport_rect().size /2)
		var distance = abs(nCenter.x-$Player.global_position.x)
		if distance>min_opacity_distance:
			n.modulate.a = 0.0
		elif(distance<full_opacity_threshold):
			n.modulate.a=1
			if $Player.playerLocked == false and n.visible == true and !n.is_in_group("lore"):
				LockPlayer.emit(true)
		else:
			var alpha = 1.0-(distance/(min_opacity_distance))
			n.modulate.a=alpha





func _on_player_correct():
	$Player/CorrectSound.play()
	LockPlayer.emit(false)
