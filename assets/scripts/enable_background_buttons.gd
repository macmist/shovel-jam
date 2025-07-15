extends CheckBox


func _on_pressed() -> void:
	print("Disabled?: ", Globals.background_buttons_disabled)
	Globals.background_buttons_disabled = !button_pressed
	print("Disabled?: ", Globals.background_buttons_disabled)
