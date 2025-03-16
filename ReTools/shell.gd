extends Control
class_name Shell

@onready var menu: Menu = $CanvasLayer/VBoxContainer/ShellContainer/Menu
@onready var till_tracker: TillTracker = $CanvasLayer/VBoxContainer/ShellContainer/TillTracker
@onready var tap_counter: TapCounter = $CanvasLayer/VBoxContainer/ShellContainer/TapCounter


var menu_active : bool = true
var tt_active : bool
var tc_active : bool

func _ready() -> void:
	tap_counter.deactivate_tapcounter()
	tc_active = false
	till_tracker.deactivate_tilltracker()
	tt_active = false

func _on_button_menu_pressed() -> void:
	if not menu_active:
		menu.activate_menu()
		menu_active = true
	else:
		menu.deactivate_menu()
		menu_active = false


func _on_menu_tilltracker_pressed() -> void:
	menu.deactivate_menu()
	menu_active = false
	if not tt_active:
		till_tracker.activate_tilltracaker()
		tt_active = true
		tap_counter.deactivate_tapcounter()
		tc_active = false


func _on_menu_tapcounter_pressed() -> void:
	menu.deactivate_menu()
	menu_active = false
	if not tc_active:
		tap_counter.activate_tapcounter()
		tc_active = true
		till_tracker.deactivate_tilltracker()
		tt_active = false
		menu.deactivate_menu()
		menu_active = false
