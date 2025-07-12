extends Button

var is_focused = false
var click: int = 0
var tooltip_shown: int = 0

signal show_exit

var template = "Clieck %d times"

func _make_custom_tooltip(for_text: String) -> Object:
	var label = Label.new()
	label.text = for_text
	print("making tooltip")
	tooltip_shown += 1
	if for_text == "Here":
		show_exit.emit()
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

func _on_pressed() -> void:
	click += 1
	update_tooltip_text()
	

func _on_focus_entered() -> void:
	is_focused = true


func _on_focus_exited() -> void:
	is_focused = false
