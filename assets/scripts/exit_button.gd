extends TextureButton




func _on_pressed() -> void:
	get_tree().quit()

	

func _on_get_started_button_show_exit() -> void:
	await get_tree().create_timer(1.0).timeout
	visible = true
