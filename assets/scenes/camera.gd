extends Camera2D


const MOVE_SPEED = 300
func _process(delta):
	if !Globals.keyboard_enabled:
		return
	if Input.is_action_pressed("Left"):
		global_position += Vector2.LEFT * delta * MOVE_SPEED
	elif Input.is_action_pressed("Right"):
		global_position += Vector2.RIGHT * delta * MOVE_SPEED
	elif Input.is_action_pressed("Up"):
		global_position += Vector2.UP * delta * MOVE_SPEED
	elif Input.is_action_pressed("Down"):
		global_position += Vector2.DOWN * delta * MOVE_SPEED
