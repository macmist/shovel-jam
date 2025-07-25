extends Button

@export var input_action: String
var update_input = false


func _input(event: InputEvent) -> void:
	if !update_input or event is InputEventMouseMotion or event is InputEventMouseButton or !InputMap.has_action(input_action):
		return
	
	InputMap.action_erase_events(input_action)
	InputMap.action_add_event(input_action, event)
	
	text = event.as_text()
	
	
	update_input = false
	
	
func _on_pressed() -> void:
	if Globals.keyboard_enabled and !update_input:
		update_input = true
