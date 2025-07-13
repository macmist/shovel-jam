extends TextureButton


func _on_pressed() -> void:
	print("options")


func _on_get_started_button_show_options() -> void:
	await get_tree().create_timer(1.0).timeout
	visible = true
