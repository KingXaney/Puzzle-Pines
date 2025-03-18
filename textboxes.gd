extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	get_tree().reload_current_scene()


func _on_button_3_pressed() -> void:
	get_tree().reload_current_scene()


func _on_button_4_pressed() -> void:
	get_tree().reload_current_scene()


func _on_confucious_pressed() -> void:
	get_tree().reload_current_scene()


func _on_socraties_pressed() -> void:
	get_tree().reload_current_scene()


func _on_anaximander_button_up() -> void:
	get_tree().reload_current_scene()


func _on_c_pressed() -> void:
	get_tree().reload_current_scene()


func _on_b_pressed() -> void:
	get_tree().reload_current_scene()


func _on_c1_pressed() -> void:
	get_tree().reload_current_scene()
