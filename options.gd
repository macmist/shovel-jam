extends TextureButton

@onready var option_menu: PanelContainer = %OptionMenu
@onready var background: ColorRect = %Background


func _on_pressed() -> void:
	print("options")
	option_menu.visible = true


func _on_get_started_button_show_options() -> void:
	await get_tree().create_timer(1.0).timeout
	visible = true
	
	
func _on_option_menu_color_changed(color: Color) -> void:
	print("new color: ", color)
	background.color = color
