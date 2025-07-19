extends Button

var is_focused = false
var click: int = 0
var tooltip_shown: int = 0

signal game_start

signal show_exit
signal show_options

var template = "Clieck %d times"

func _make_custom_tooltip(for_text: String) -> Object:
	var label = Label.new()
	label.text = for_text
	print("making tooltip")
	tooltip_shown += 1
	if for_text == "Here":
		show_exit.emit()
	if for_text == "Have a look in the options, then stop bothering me. I'm done here":
		show_options.emit()
	return label
	
func update_tooltip_text() -> void:
	if click == 1:
		tooltip_text = template % click
		return
	if tooltip_shown < 10:
		tooltip_text = (template % click) + ("!".repeat(tooltip_shown))
	if tooltip_shown == 10:
		tooltip_text = "Hmm..."
	if tooltip_shown == 11:
		tooltip_text = "It doesn't seem to work"
	if tooltip_shown == 12:
		tooltip_text = "You should give up"
	if tooltip_shown == 13:
		tooltip_text = "Here"

	if tooltip_shown == 14:
		tooltip_text = "Now you can exit"
	
	if tooltip_shown == 15:
		tooltip_text = "..."
	
	if tooltip_shown == 16:
		tooltip_text = "Still here?"
		
	if tooltip_shown == 17:
		tooltip_text = "You know it won't work right?"
		
	if tooltip_shown == 18:
		tooltip_text = "..."
		
	if tooltip_shown == 19:
		tooltip_text = "Right."
		
	if tooltip_shown == 20:
		tooltip_text = "I'll tell you what"
		
	if tooltip_shown == 21:
		tooltip_text = "Have a look in the options, then stop bothering me. I'm done here"
		
	if tooltip_shown > 21:
		tooltip_text = ''
		
		

func _on_pressed() -> void:
	if Globals.get_started_actually_starts:
		game_start.emit()
		return
	else:
		click += 1
		update_tooltip_text()
	

func _on_focus_entered() -> void:
	is_focused = true


func _on_focus_exited() -> void:
	is_focused = false
