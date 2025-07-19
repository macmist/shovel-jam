extends LineEdit

@onready var console_history: RichTextLabel = %ConsoleHistory
var expression = Expression.new()

func _on_text_submitted(new_text: String) -> void:
	text = ''
	console_history.text += '> ' + new_text + '\n'
	run_command(new_text)
	
func run_command(command: String) -> void:
	var parsed = expression.parse(command)
	if parsed != OK:
		console_history.text += expression.get_error_text()
		return
	var result = expression.execute([], self)
	if not expression.has_execute_failed():
		console_history.text += str(result) + '\n'
	else:
		console_history.text += "Unrecognized command: " + command + '\n'
		console_history.text += help()
	
func help() -> String:
	var help_text = '''Available commands:
	display_config(): displays available configuration
	edit_config("variable", "new_value"): sets variable to new_value in the configuration
	'''
	return help_text
	


func display_config() -> String:
	var return_text = '''Current config:
	background_buttons_disabled = %s
	keyboard_enabled = %s
	dev_options_disabled = %s,
	get_started_actually_starts = %s'''
		
	return return_text % [Globals.background_buttons_disabled, Globals.keyboard_enabled, Globals.dev_options_disabled, Globals.get_started_actually_starts]


func edit_config(variable: String, new_value: String):
	var available_vars = ["background_buttons_disabled", "keyboard_enabled", "dev_options_disabled", "get_started_actually_starts"]
	var lower_var = variable.to_lower()
	var lower_value = new_value.to_lower()
	if not available_vars.has(lower_var):
		return "Invalid variable name: %s\n" % variable

	if not ["true", "false"].has(lower_value):
		return "Invalid value: %s\n" % lower_value
	var new_bool = lower_value == "true"
	if lower_var == "background_buttons_disabled":
		Globals.background_buttons_disabled = new_bool
	if lower_var == "keyboard_enabled":
		Globals.keyboard_enabled = new_bool
	if lower_var == "dev_options_disabled":
		Globals.dev_options_disabled = new_bool
	if lower_var == "get_started_actually_starts":
		Globals.get_started_actually_starts = new_bool
	return '''%s set to %s
	''' % [lower_var, lower_value]
