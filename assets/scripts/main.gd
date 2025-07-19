extends Node2D

const GAME_START = preload("res://assets/scenes/GameStart.tscn")


func _on_enable_keyboard_pressed() -> void:
	Globals.keyboard_enabled = !Globals.keyboard_enabled


func _on_dev_options_pressed() -> void:
	Globals.dev_options_disabled = !Globals.dev_options_disabled


func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion or !Globals.keyboard_enabled:
		return
	if Input.is_action_pressed("Open Console"):
		print('open console')
	


func _on_get_started_button_game_start() -> void:
	get_tree().change_scene_to_packed(GAME_START)
