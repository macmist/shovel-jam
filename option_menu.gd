extends PanelContainer

@onready var color_picker_button: ColorPickerButton = %ColorPickerButton
var current_color: Color

signal color_changed(color: Color)

func _ready() -> void:
	current_color = color_picker_button.color


func _on_color_picker_button_color_changed(color: Color) -> void:
	current_color = color
	color_changed.emit(current_color)
