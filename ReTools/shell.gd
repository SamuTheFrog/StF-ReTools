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


func _on_till_tracker_save_pressed() -> void:
	save_data()


func save_data() -> void:
	
#	var till_count = {
#	"100s x ":till_tracker.count_hundred,
#	"100s = ":till_tracker.hundreds,
#	"50s x ":till_tracker.count_fifty, 
#	"50s = ":till_tracker.fifties,
#	"20s x ":till_tracker.count_twenty,
#	"20s = ":till_tracker.twenties,
#	"10s x ":till_tracker.count_ten,
#	"10s = ":till_tracker.tens,
#	"5s x ":till_tracker.count_five,
#	"5s = ":till_tracker.fives,
#	"2s x ":till_tracker.count_two,
#	"2s = ":till_tracker.twos,
#	"1s x ":till_tracker.count_one,
#	"1s = ":till_tracker.ones,
#	"	Dollar Subtotal = ":till_tracker.formatted_dollars,
#	"1.00s x ":till_tracker.count_whole,
#	"1.00s = ":till_tracker.wholedollars,
#	".50s x ":till_tracker.count_half,
#	".50s = ":till_tracker.fifties,
#	".25s x ":till_tracker.count_quarter,
#	".25s = ":till_tracker.quarters,
#	".10s x ":till_tracker.count_dime,
#	".10s = ":till_tracker.dimes,
#	".05s x ":till_tracker.count_nickel,
#	".5s = ":till_tracker.nickels,
#	".01s x ":till_tracker.count_penny,
#	".1s = ":till_tracker.pennies,
#	"	Cent Subtotal = ":till_tracker.formatted_cents,
#	"	Total = ":till_tracker.formatted_total
#}
	var save_path = "user://tillcount.txt"

	var save = FileAccess.open(save_path,FileAccess.WRITE)
	
#	save.store_var(till_count)
	
	print("100s x (", till_tracker.count_hundred, ") = ", till_tracker.hundreds)
	print("50s x (", till_tracker.count_fifty, ") = ", till_tracker.fifties)
	print("20s x (", till_tracker.count_twenty, ") = ", till_tracker.twenties)
	print("10s x (", till_tracker.count_ten, ") = ", till_tracker.tens)
	print("5s x (", till_tracker.count_five, ") = ", till_tracker.fives)
	print("2s x (", till_tracker.count_two, ") = ", till_tracker.twos)
	print("1s x (", till_tracker.count_one, ") = ", till_tracker.ones)
	print("1.00s x (", till_tracker.count_whole, ") = ", till_tracker.wholedollars)
	print("0.50s x (", till_tracker.count_half, ") = ", till_tracker.halfdollars)
	print("0.25s x (", till_tracker.count_quarter, ") = ", till_tracker.quarters)
	print("0.10s x (", till_tracker.count_dime, ") = ", till_tracker.dimes)
	print("0.05s x (", till_tracker.count_nickel, ") = ", till_tracker.nickels)
	print("0.01s x (", till_tracker.count_penny, ") = ", till_tracker.pennies)

	var arr_till_count = []
	
	
