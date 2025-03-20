extends Control
class_name TapCounter

@onready var label_count: Label = $VBoxContainer2/VBoxContainer/Label
@onready var line_edit: LineEdit = $VBoxContainer2/VBoxContainer/HBoxContainer/LineEdit


var count : int = 0
var interval : int = 1


func _ready() -> void:
	label_count.text = str(count)
	line_edit.text = str(interval)


func activate_tapcounter() -> void:
	show()

func deactivate_tapcounter() -> void:
	hide()


func _on_button_pressed() -> void:
	count = count + interval
	label_count.text = str(count)


func _on_line_edit_text_submitted(new_text: String) -> void:
	interval = new_text.to_int()
	line_edit.text = str(interval)


func _on_button_decrement_pressed() -> void:
	interval = interval - 1
	line_edit.text = str(interval)


func _on_button_increment_pressed() -> void:
	interval = interval + 1
	line_edit.text = str(interval)
