extends Node2D


func _on_enable_keyboard_pressed() -> void:
	Globals.keyboard_enabled = !Globals.keyboard_enabled
