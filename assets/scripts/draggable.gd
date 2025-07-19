extends Sprite2D


var is_dragging = false
var mouse_offset
@export var delay = 1


func _physics_process(delta: float) -> void:
	var global_pos = get_viewport().get_canvas_transform().affine_inverse() * get_global_mouse_position() 
		
	if is_dragging:
		var tween = get_tree().create_tween()
		tween.tween_property(self, "position", get_global_mouse_position() - mouse_offset, delta * delay)
	
	
	
func _input(event: InputEvent) -> void:
	
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		var global_pos = get_viewport().get_canvas_transform().affine_inverse() * event.position 
		
		if event.pressed:
			if get_rect().has_point(to_local(global_pos)):
				is_dragging = true
				mouse_offset = get_global_mouse_position() - global_position
			
		else:
			is_dragging = false
