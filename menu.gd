extends Control
class_name Menu

signal tilltracker_pressed
signal tapcounter_pressed

func activate_menu() -> void:
	show()

func deactivate_menu() -> void:
	hide()

func _on_button_quit_pressed() -> void:
	get_tree().quit()


func _on_button_till_tracker_pressed() -> void:
	tilltracker_pressed.emit()


func _on_button_tap_counter_pressed() -> void:
	tapcounter_pressed.emit()
