extends PanelContainer

@onready var tab_container: TabContainer = %TabContainer
@onready var open_dev_console: Button = %"Open Dev Console"
@onready var dev_console: Label = %"Dev console"

@onready var color_picker_button: ColorPickerButton = %ColorPickerButton
var current_color: Color

signal color_changed(color: Color)

func _ready() -> void:
	current_color = color_picker_button.color
	
	
func _process(delta: float) -> void:
	tab_container.set_tab_hidden(4, Globals.dev_options_disabled)
	dev_console.visible = !Globals.dev_options_disabled
	open_dev_console.visible = !Globals.dev_options_disabled
	


func _on_color_picker_button_color_changed(color: Color) -> void:
	current_color = color
	color_changed.emit(current_color)
