class_name tilltracker extends Control

@onready var line_edit_hundred: LineEdit = $VBoxContainer/VBoxContainer_Dollars/HBox_Hundred/LineEdit_HundredCount
@onready var line_edit_fifty: LineEdit = $VBoxContainer/VBoxContainer_Dollars/HBox_Fifty/LineEdit_FiftyCount
@onready var line_edit_twenty: LineEdit = $VBoxContainer/VBoxContainer_Dollars/HBox_Twenty/LineEdit_TwentyCount
@onready var line_edit_ten: LineEdit = $VBoxContainer/VBoxContainer_Dollars/HBox_Ten/LineEdit_TenCount
@onready var line_edit_five: LineEdit = $VBoxContainer/VBoxContainer_Dollars/HBox_Five/LineEdit_FiveCount
@onready var line_edit_two: LineEdit = $VBoxContainer/VBoxContainer_Dollars/HBox_Two/LineEdit_TwoCount
@onready var line_edit_one: LineEdit = $VBoxContainer/VBoxContainer_Dollars/HBox_One/LineEdit_OneCount
@onready var line_edit_whole: LineEdit = $VBoxContainer/VBoxContainer_Cents/HBox_Whole/LineEdit_WholeCount
@onready var line_edit_half: LineEdit = $VBoxContainer/VBoxContainer_Cents/HBox_Half/LineEdit_HalfCount
@onready var line_edit_quarter: LineEdit = $VBoxContainer/VBoxContainer_Cents/HBox_Quarter/LineEdit_QuarterCount
@onready var line_edit_dime: LineEdit = $VBoxContainer/VBoxContainer_Cents/HBox_Dime/LineEdit_DimeCount
@onready var line_edit_nickel: LineEdit = $VBoxContainer/VBoxContainer_Cents/HBox_Nickel/LineEdit_NickelCount
@onready var line_edit_penny: LineEdit = $VBoxContainer/VBoxContainer_Cents/HBox_Penny/LineEdit_PennyCount
@onready var label_penny: Label = $VBoxContainer/VBoxContainer_Cents/HBox_Penny/Label_PennyTotal
@onready var label_nickel: Label = $VBoxContainer/VBoxContainer_Cents/HBox_Nickel/Label_NickelTotal
@onready var label_dime: Label = $VBoxContainer/VBoxContainer_Cents/HBox_Dime/Label_DimeTotal
@onready var label_quarter: Label = $VBoxContainer/VBoxContainer_Cents/HBox_Quarter/Label_QuarterTotal
@onready var label_half: Label = $VBoxContainer/VBoxContainer_Cents/HBox_Half/Label_HalfTotal
@onready var label_whole: Label = $VBoxContainer/VBoxContainer_Cents/HBox_Whole/Label_WholeTotal
@onready var label_one: Label = $VBoxContainer/VBoxContainer_Dollars/HBox_One/Label_OneTotal
@onready var label_two: Label = $VBoxContainer/VBoxContainer_Dollars/HBox_Two/Label_TwoTotal
@onready var label_five: Label = $VBoxContainer/VBoxContainer_Dollars/HBox_Five/Label_FiveTotal
@onready var label_ten: Label = $VBoxContainer/VBoxContainer_Dollars/HBox_Ten/Label_TenTotal
@onready var label_twenty: Label = $VBoxContainer/VBoxContainer_Dollars/HBox_Twenty/Label_TwentyTotal
@onready var label_fifty: Label = $VBoxContainer/VBoxContainer_Dollars/HBox_Fifty/Label_FiftyTotal
@onready var label_hundred: Label = $VBoxContainer/VBoxContainer_Dollars/HBox_Hundred/Label_HundredTotal
@onready var label_subtotal_cents: Label = $VBoxContainer/HBoxContainer_Subtotal_Cents/Label_Subtotal_Cents
@onready var label_subtotal_dollars: Label = $VBoxContainer/HBoxContainer_Subtotal_Dollars/Label_Subtotal_Dollars
@onready var label_total: Label = $VBoxContainer/HBoxContainer_Total/Label_Total
const PENNY:int 	= 1
const NICKEL:int 	= 5
const DIME:int 		= 10
const QUARTER:int 	= 25
const HALF:int 		= 50
const WHOLE:int		= 100
const ONE:int		= 100
const TWO:int		= 200
const FIVE:int		= 500
const TEN:int		= 1000
const TWENTY:int	= 2000
const FIFTY:int		= 5000
const HUNDRED:int	= 10000
var count_penny:int
var count_nickel:int
var count_dime:int
var count_quarter:int
var count_half:int
var count_whole:int
var count_one:int
var count_two:int
var count_five:int
var count_ten:int
var count_twenty:int
var count_fifty:int
var count_hundred:int

func increment(value):
	value = value + 1
	return value
func decrement(value):
	value = value - 1
	return value

func format_currency(amount: int) -> String:
	var dollars = amount / 100
	var cents = amount % 100
	return "$%d.%02d" % [dollars, cents]

func calculate(count:int, TYPE:int):
	var calculation = count * TYPE
	return calculation


func refresh_line(line_edit:LineEdit, count:int):
	line_edit.text = str(count)
	return line_edit.text
func refresh_totals(label:Label, total:String):
	label.text = total

func _on_button_decrement(count:int, VALUE:int, line_edit:LineEdit, label:Label):
	count = decrement(count)
	var calculation = calculate(count,VALUE)
	var formatted = format_currency(calculation)
	refresh_line(line_edit, count)
	refresh_totals(label, formatted)
	return count
func _on_line_edit_submit(count:int, new_text:String, VALUE:int, line_edit:LineEdit, label:Label):
	count = new_text.to_int()
	var calculation = calculate(count,VALUE)
	var formatted = format_currency(calculation)
	refresh_line(line_edit, count)
	refresh_totals(label, formatted)
	return count
func _on_button_increment(count:int, VALUE:int, line_edit:LineEdit, label:Label):
	count = increment(count)
	var calculation = calculate(count,VALUE)
	var formatted = format_currency(calculation)
	refresh_line(line_edit, count)
	refresh_totals(label, formatted)
	return count

func activate() -> void:
	show()
func deactivate() -> void:
	hide()

func _on_button_hundred_decrement_pressed() -> void:
	count_hundred = _on_button_decrement(count_hundred, HUNDRED, line_edit_hundred, label_hundred)
func _on_line_edit_hundred_count_text_submitted(new_text: String) -> void:
	count_hundred = _on_line_edit_submit(count_hundred, new_text, HUNDRED, line_edit_hundred, label_hundred)
func _on_button_hundred_increment_pressed() -> void:
	count_hundred = _on_button_increment(count_hundred, HUNDRED, line_edit_hundred, label_hundred)
func _on_button_fifty_decrement_pressed() -> void:
	count_fifty = _on_button_decrement(count_fifty, FIFTY, line_edit_fifty, label_fifty)
func _on_line_edit_fifty_count_text_submitted(new_text: String) -> void:
	count_fifty = _on_line_edit_submit(count_fifty, new_text, FIFTY, line_edit_fifty, label_fifty)
func _on_button_fifty_increment_pressed() -> void:
	count_fifty = _on_button_increment(count_fifty, FIFTY, line_edit_fifty, label_fifty)
func _on_button_twenty_decrement_pressed() -> void:
	count_twenty = _on_button_decrement(count_twenty, TWENTY, line_edit_twenty, label_twenty)
func _on_line_edit_twenty_count_text_submitted(new_text: String) -> void:
	count_twenty = _on_line_edit_submit(count_twenty, new_text, TWENTY, line_edit_twenty, label_twenty)
func _on_button_twenty_increment_pressed() -> void:
	count_twenty = _on_button_increment(count_twenty, TWENTY, line_edit_twenty, label_twenty)
func _on_button_ten_decrement_pressed() -> void:
	count_ten = _on_button_decrement(count_ten, TEN, line_edit_ten, label_ten)
func _on_line_edit_ten_count_text_submitted(new_text: String) -> void:
	count_ten = _on_line_edit_submit(count_ten, new_text, TEN, line_edit_ten, label_ten)
func _on_button_ten_increment_pressed() -> void:
	count_ten = _on_button_increment(count_ten, TEN, line_edit_ten, label_ten)
func _on_button_five_decrement_pressed() -> void:
	count_five = _on_button_decrement(count_five, FIVE, line_edit_five, label_five)
func _on_line_edit_five_count_text_submitted(new_text: String) -> void:
	count_five = _on_line_edit_submit(count_five, new_text, FIVE, line_edit_five, label_five)
func _on_button_five_increment_pressed() -> void:
	count_five = _on_button_increment(count_five, FIVE, line_edit_five, label_five)
func _on_button_two_decrement_pressed() -> void:
	count_two = _on_button_decrement(count_two, TWO, line_edit_two, label_two)
func _on_line_edit_two_count_text_submitted(new_text: String) -> void:
	count_two = _on_line_edit_submit(count_two, new_text, TWO, line_edit_two, label_two)
func _on_button_two_increment_pressed() -> void:
	count_two = _on_button_increment(count_two, TWO, line_edit_two, label_two)
func _on_button_one_decrement_pressed() -> void:
	count_one = _on_button_decrement(count_one, ONE, line_edit_one, label_one)
func _on_line_edit_one_count_text_submitted(new_text: String) -> void:
	count_one = _on_line_edit_submit(count_one, new_text, ONE, line_edit_one, label_one)
func _on_button_one_increment_pressed() -> void:
	count_one = _on_button_increment(count_one, ONE, line_edit_one, label_one)
func _on_button_whole_decrement_pressed() -> void:
	count_whole = _on_button_decrement(count_whole, WHOLE, line_edit_whole, label_whole)
func _on_line_edit_whole_count_text_submitted(new_text: String) -> void:
	count_whole = _on_line_edit_submit(count_whole, new_text, WHOLE, line_edit_whole, label_whole)
func _on_button_whole_increment_pressed() -> void:
	count_whole = _on_button_increment(count_whole, WHOLE, line_edit_whole, label_whole)
func _on_button_half_decrement_pressed() -> void:
	count_half = _on_button_decrement(count_half, HALF, line_edit_half, label_half)
func _on_line_edit_half_count_text_submitted(new_text: String) -> void:
	count_half = _on_line_edit_submit(count_half, new_text, HALF, line_edit_half, label_half)
func _on_button_half_increment_pressed() -> void:
	count_half = _on_button_increment(count_half, HALF, line_edit_half, label_half)
func _on_button_quarter_decrement_pressed() -> void:
	count_quarter = _on_button_decrement(count_quarter, QUARTER, line_edit_quarter, label_quarter)
func _on_line_edit_quarter_count_text_submitted(new_text: String) -> void:
	count_quarter = _on_line_edit_submit(count_quarter, new_text, QUARTER, line_edit_quarter, label_quarter)
func _on_button_quarter_increment_pressed() -> void:
	count_quarter = _on_button_increment(count_quarter, QUARTER, line_edit_quarter, label_quarter)
func _on_button_dime_decrement_pressed() -> void:
	count_dime = _on_button_decrement(count_dime, DIME, line_edit_dime, label_dime)
func _on_line_edit_dime_count_text_submitted(new_text: String) -> void:
	count_dime = _on_line_edit_submit(count_dime, new_text, DIME, line_edit_dime, label_dime)
func _on_button_dime_increment_pressed() -> void:
	count_dime = _on_button_increment(count_dime, DIME, line_edit_dime, label_dime)
func _on_button_nickel_decrement_pressed() -> void:
	count_nickel = _on_button_decrement(count_nickel, NICKEL, line_edit_nickel, label_nickel)
func _on_line_edit_nickel_count_text_submitted(new_text: String) -> void:
	count_nickel = _on_line_edit_submit(count_nickel, new_text, NICKEL, line_edit_nickel, label_nickel)
func _on_button_nickel_increment_pressed() -> void:
	count_nickel = _on_button_increment(count_nickel, NICKEL, line_edit_nickel, label_nickel)
func _on_button_penny_decrement_pressed() -> void:
	count_penny = _on_button_decrement(count_penny, PENNY, line_edit_penny, label_penny)
func _on_line_edit_penny_count_text_submitted(new_text: String) -> void:
	count_penny = _on_line_edit_submit(count_penny, new_text, PENNY, line_edit_penny, label_penny)
func _on_button_penny_increment_pressed() -> void:
	count_penny = _on_button_increment(count_penny, PENNY, line_edit_penny, label_penny)
