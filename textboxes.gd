extends Node2D
signal KillPlayer
signal PlayerCorrect
const DISABLE = 1
const ENABLE = 2

var playerDead = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_deadly_button_pressed() -> void:
	if(playerDead == false):
		KillPlayer.emit()
	
func _on_correct_button_pressed() -> void:
	PlayerCorrect.emit()
	print("emitted!")

func _on_player_tell_dead(dead):
	if dead==true: 
		playerDead = true
	elif dead==false:
		playerDead=false
