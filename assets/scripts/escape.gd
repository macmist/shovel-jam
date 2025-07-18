extends Node2D
@export var speed = 500

func _process(delta: float) -> void:
	rotation += get_local_mouse_position().angle() 
	var distance =  position.distance_to(get_global_mouse_position())
	if distance < 300 and distance > 60:
		var direction  = (get_global_mouse_position() - position).normalized()
		position -= direction * speed * delta
