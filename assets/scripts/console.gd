extends CanvasLayer

func _input(event: InputEvent) -> void:
	if Input.is_action_pressed("Open Console"):
		visible = !visible
