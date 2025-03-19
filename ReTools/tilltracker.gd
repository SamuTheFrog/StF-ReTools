extends Control
class_name TillTracker

signal save_pressed

@onready var line_edit_penny_count: LineEdit = $VBoxContainer/VBoxContainer_Cents/HBox_Penny/LineEdit_PennyCount
@onready var label_penny_total: Label = $VBoxContainer/VBoxContainer_Cents/HBox_Penny/Label_PennyTotal
@onready var line_edit_nickel_count: LineEdit = $VBoxContainer/VBoxContainer_Cents/HBox_Nickel/LineEdit_NickelCount
@onready var label_nickel_total: Label = $VBoxContainer/VBoxContainer_Cents/HBox_Nickel/Label_NickelTotal
@onready var line_edit_dime_count: LineEdit = $VBoxContainer/VBoxContainer_Cents/HBox_Dime/LineEdit_DimeCount
@onready var label_dime_total: Label = $VBoxContainer/VBoxContainer_Cents/HBox_Dime/Label_DimeTotal
@onready var line_edit_quarter_count: LineEdit = $VBoxContainer/VBoxContainer_Cents/HBox_Quarter/LineEdit_QuarterCount
@onready var label_quarter_total: Label = $VBoxContainer/VBoxContainer_Cents/HBox_Quarter/Label_QuarterTotal
@onready var line_edit_half_count: LineEdit = $VBoxContainer/VBoxContainer_Cents/HBox_Half/LineEdit_HalfCount
@onready var label_half_total: Label = $VBoxContainer/VBoxContainer_Cents/HBox_Half/Label_HalfTotal
@onready var line_edit_whole_count: LineEdit = $VBoxContainer/VBoxContainer_Cents/HBox_Whole/LineEdit_WholeCount
@onready var label_whole_total: Label = $VBoxContainer/VBoxContainer_Cents/HBox_Whole/Label_WholeTotal
@onready var line_edit_one_count: LineEdit = $VBoxContainer/VBoxContainer_Dollars/HBox_One/LineEdit_OneCount
@onready var label_one_total: Label = $VBoxContainer/VBoxContainer_Dollars/HBox_One/Label_OneTotal
@onready var line_edit_two_count: LineEdit = $VBoxContainer/VBoxContainer_Dollars/HBox_Two/LineEdit_TwoCount
@onready var label_two_total: Label = $VBoxContainer/VBoxContainer_Dollars/HBox_Two/Label_TwoTotal
@onready var line_edit_five_count: LineEdit = $VBoxContainer/VBoxContainer_Dollars/HBox_Five/LineEdit_FiveCount
@onready var label_five_total: Label = $VBoxContainer/VBoxContainer_Dollars/HBox_Five/Label_FiveTotal
@onready var line_edit_ten_count: LineEdit = $VBoxContainer/VBoxContainer_Dollars/HBox_Ten/LineEdit_TenCount
@onready var label_ten_total: Label = $VBoxContainer/VBoxContainer_Dollars/HBox_Ten/Label_TenTotal
@onready var line_edit_twenty_count: LineEdit = $VBoxContainer/VBoxContainer_Dollars/HBox_Twenty/LineEdit_TwentyCount
@onready var label_twenty_total: Label = $VBoxContainer/VBoxContainer_Dollars/HBox_Twenty/Label_TwentyTotal
@onready var line_edit_fifty_count: LineEdit = $VBoxContainer/VBoxContainer_Dollars/HBox_Fifty/LineEdit_FiftyCount
@onready var label_fifty_total: Label = $VBoxContainer/VBoxContainer_Dollars/HBox_Fifty/Label_FiftyTotal
@onready var line_edit_hundred_count: LineEdit = $VBoxContainer/VBoxContainer_Dollars/HBox_Hundred/LineEdit_HundredCount
@onready var label_hundred_total: Label = $VBoxContainer/VBoxContainer_Dollars/HBox_Hundred/Label_HundredTotal
@onready var label_subtotal_cents: Label = $VBoxContainer/HBoxContainer_Subtotal_Cents/Label_Subtotal_Cents
@onready var label_subtotal_dollars: Label = $VBoxContainer/HBoxContainer_Subtotal_Dollars/Label_Subtotal_Dollars
@onready var label_total: Label = $VBoxContainer/HBoxContainer_Total/Label_Total

const PENNY : int = 1
const NICKEL : int = 5
const DIME : int = 10
const QUARTER : int = 25
const HALF : int = 50
const WHOLE : int = 100
const ONE : int = 100
const TWO : int = 200
const FIVE : int = 500
const TEN : int = 1000
const TWENTY : int = 2000
const FIFTY : int = 5000
const HUNDRED : int = 10000

var total : int = 0
var subtotal_dollars : int = 0
var subtotal_cents : int = 0
var formatted_dollars : String
var formatted_cents : String
var formatted_total : String

var count_penny : int = 0
var count_nickel : int = 0
var count_dime : int = 0
var count_quarter : int = 0
var count_half : int = 0
var count_whole : int = 0
var count_one : int = 0
var count_two : int = 0
var count_five : int = 0
var count_ten : int = 0
var count_twenty : int = 0
var count_fifty : int = 0
var count_hundred : int = 0

var total_penny : int = 0
var total_nickel : int = 0
var total_dime : int = 0
var total_quarter : int = 0
var total_half : int = 0
var total_whole : int = 0
var total_one : int = 0
var total_two : int = 0
var total_five : int = 0
var total_ten : int = 0
var total_twenty : int = 0
var total_fifty : int = 0
var total_hundred : int = 0

var pennies : String
var nickels : String
var dimes : String
var quarters : String
var halfdollars : String
var wholedollars : String
var ones : String
var twos : String
var fives : String
var tens : String
var twenties : String
var fifties : String
var hundreds : String


func _ready() -> void:
	refresh_totals()



func activate_tilltracaker() -> void:
	show()

func deactivate_tilltracker() -> void:
	hide()



func refresh_lines(line_count, count):
	
	line_count.text = str(count)
	
	return line_count.text



func refresh_totals(label, currency):
	label.text = currency
	
	return label

func calculate_currency(count, TYPE):
	
	var calculated_total : int = count * TYPE
	
	return calculated_total



func calculate_subtotal_cents() -> void:
	subtotal_cents = total_penny + total_nickel + total_dime + total_quarter + total_half + total_whole
	formatted_cents = format_currency(subtotal_cents)
	calculate_total()



func calculate_subtotal_dollars() -> void:
	subtotal_cents = total_penny + total_nickel + total_dime + total_quarter + total_half + total_whole
	formatted_cents = format_currency(subtotal_cents)
	calculate_total()



func calculate_total() -> void:
	total = subtotal_cents + subtotal_dollars
	formatted_total = format_currency(total)
	refresh_totals(label_total, total)

func format_currency(amount: int) -> String:
	var dollars = amount / 100
	var cents = amount % 100

	return "$%d.%02d" % [dollars, cents]

func _on_button_penny_decrement_pressed() -> void:
	count_penny = count_penny - 1
	refresh_lines(line_edit_penny_count, count_penny)
	calculate_currency(count_penny, PENNY)
	calculate_subtotal_cents()
	refresh_totals(label_penny_total, 

func _on_line_edit_penny_count_text_submitted(new_text: String) -> void:
	count_penny = new_text.to_int()
	var total_value = calculate_currency(count_penny, PENNY)
	refresh_lines(line_edit_penny_count, count_penny)
	calculate_subtotal_cents()
	refresh_totals(total_value)

func _on_button_penny_increment_pressed() -> void:
	count_penny = count_penny + 1
	refresh_lines(line_edit_penny_count, count_penny)
	calculate_currency(count_penny, PENNY)
	calculate_subtotal_cents()
	refresh_totals()

func _on_button_nickel_decrement_pressed() -> void:
	count_nickel = count_nickel - 1
	refresh_lines(line_edit_nickel_count, count_nickel)
	calculate_currency(count_nickel, NICKEL)
	calculate_subtotal_cents()
	refresh_totals()

func _on_line_edit_nickel_count_text_submitted(new_text: String) -> void:
	count_nickel = new_text.to_int()
	refresh_lines(line_edit_nickel_count, count_nickel)
	calculate_currency(count_nickel, NICKEL)
	calculate_subtotal_cents()
	refresh_totals()

func _on_button_nickel_increment_pressed() -> void:
	count_nickel = count_nickel + 1
	refresh_lines(line_edit_nickel_count, count_nickel)
	calculate_currency(count_nickel, NICKEL)
	calculate_subtotal_cents()
	refresh_totals()

func _on_button_dime_decrement_pressed() -> void:
	count_dime = count_dime - 1
	refresh_lines(line_edit_dime_count, count_dime)
	calculate_currency(count_dime, DIME)
	calculate_subtotal_cents()
	refresh_totals()

func _on_line_edit_dime_count_text_submitted(new_text: String) -> void:
	count_dime = new_text.to_int()
	refresh_lines(line_edit_dime_count, count_dime)
	calculate_currency(count_dime, DIME)
	calculate_subtotal_cents()
	refresh_totals()

func _on_button_dime_increment_pressed() -> void:
	count_dime = count_dime + 1
	refresh_lines(line_edit_dime_count, count_dime)
	calculate_currency(count_dime, DIME)
	calculate_subtotal_cents()
	refresh_totals()

func _on_button_quarter_decrement_pressed() -> void:
	count_quarter = count_quarter - 1
	refresh_lines(line_edit_quarter_count, count_quarter)
	calculate_currency(count_quarter, QUARTER)
	calculate_subtotal_cents()
	refresh_totals()

func _on_line_edit_quarter_count_text_submitted(new_text: String) -> void:
	count_quarter = new_text.to_int()
	refresh_lines(line_edit_quarter_count, count_quarter)
	calculate_currency(count_quarter, QUARTER)
	calculate_subtotal_cents()
	refresh_totals()

func _on_button_quarter_increment_pressed() -> void:
	count_quarter = count_quarter + 1
	refresh_lines(line_edit_quarter_count, count_quarter)
	calculate_currency(count_quarter, QUARTER)
	calculate_subtotal_cents()
	refresh_totals()

func _on_button_half_decrement_pressed() -> void:
	count_half = count_half - 1
	refresh_lines(line_edit_half_count, count_half)
	calculate_currency(count_half, HALF)
	calculate_subtotal_cents()
	refresh_totals()

func _on_line_edit_half_count_text_submitted(new_text: String) -> void:
	count_half = new_text.to_int()
	refresh_lines(line_edit_half_count, count_half)
	calculate_currency(count_half, HALF)
	calculate_subtotal_cents()
	refresh_totals()

func _on_button_half_increment_pressed() -> void:
	count_half = count_half + 1
	refresh_lines(line_edit_half_count, count_half)
	calculate_currency(count_half, HALF)
	calculate_subtotal_cents()
	refresh_totals()

func _on_button_whole_decrement_pressed() -> void:
	count_whole = count_whole - 1
	refresh_lines(line_edit_whole_count, count_whole)
	calculate_currency(count_whole, WHOLE)
	calculate_subtotal_dollars()
	refresh_totals()

func _on_line_edit_whole_count_text_submitted(new_text: String) -> void:
	count_whole = new_text.to_int()
	refresh_lines(line_edit_whole_count, count_whole)
	calculate_currency(count_whole, WHOLE)
	calculate_subtotal_dollars()
	refresh_totals()

func _on_button_whole_increment_pressed() -> void:
	count_whole = count_whole + 1
	refresh_lines(line_edit_whole_count, count_whole)
	calculate_currency(count_whole, WHOLE)
	calculate_subtotal_dollars()
	refresh_totals()

func _on_button_one_decrement_pressed() -> void:
	count_one = count_one - 1
	refresh_lines(line_edit_one_count, count_one)
	calculate_currency(count_one, ONE)
	calculate_subtotal_dollars()
	refresh_totals()

func _on_line_edit_one_count_text_submitted(new_text: String) -> void:
	count_one = new_text.to_int()
	refresh_lines(line_edit_one_count, count_one)
	calculate_currency(count_one, ONE)
	calculate_subtotal_dollars()
	refresh_totals()

func _on_button_one_increment_pressed() -> void:
	count_one = count_one + 1
	refresh_lines(line_edit_one_count, count_one)
	calculate_currency(count_one, ONE)
	calculate_subtotal_dollars()
	refresh_totals()

func _on_button_two_decrement_pressed() -> void:
	count_two = count_two - 1
	refresh_lines(line_edit_two_count, count_two)
	calculate_currency(count_two, TWO)
	calculate_subtotal_dollars()
	refresh_totals()

func _on_line_edit_two_count_text_submitted(new_text: String) -> void:
	count_two = new_text.to_int()
	refresh_lines(line_edit_two_count, count_two)
	calculate_currency(count_two, TWO)
	calculate_subtotal_dollars()
	refresh_totals()

func _on_button_two_increment_pressed() -> void:
	count_two = count_two + 1
	refresh_lines(line_edit_two_count, count_two)
	calculate_currency(count_two, TWO)
	calculate_subtotal_dollars()
	refresh_totals()

func _on_button_five_decrement_pressed() -> void:
	count_five = count_five - 1
	refresh_lines(line_edit_five_count, count_five)
	calculate_currency(count_five, FIVE)
	calculate_subtotal_dollars()
	refresh_totals()

func _on_line_edit_five_count_text_submitted(new_text: String) -> void:
	count_five = new_text.to_int()
	refresh_lines(line_edit_five_count, count_five)
	calculate_currency(count_five, FIVE)
	calculate_subtotal_dollars()
	refresh_totals()

func _on_button_five_increment_pressed() -> void:
	count_five = count_five + 1
	refresh_lines(line_edit_five_count, count_five)
	calculate_currency(count_five, FIVE)
	calculate_subtotal_dollars()
	refresh_totals()

func _on_button_ten_decrement_pressed() -> void:
	count_ten = count_ten - 1
	refresh_lines(line_edit_ten_count, count_ten)
	calculate_currency(count_ten, TEN)
	calculate_subtotal_dollars()
	refresh_totals()

func _on_line_edit_ten_count_text_submitted(new_text: String) -> void:
	count_ten = new_text.to_int()
	refresh_lines(line_edit_ten_count, count_ten)
	calculate_currency(count_ten, TEN)
	calculate_subtotal_dollars()
	refresh_totals()

func _on_button_ten_increment_pressed() -> void:
	count_ten = count_ten + 1
	refresh_lines(line_edit_ten_count, count_ten)
	calculate_currency(count_ten, TEN)
	calculate_subtotal_dollars()
	refresh_totals()

func _on_button_twenty_decrement_pressed() -> void:
	count_twenty = count_twenty - 1
	refresh_lines(line_edit_twenty_count, count_twenty)
	calculate_currency(count_twenty, TWENTY)
	calculate_subtotal_dollars()
	refresh_totals()

func _on_line_edit_twenty_count_text_submitted(new_text: String) -> void:
	count_twenty = new_text.to_int()
	refresh_lines(line_edit_twenty_count, count_twenty)
	calculate_currency(count_twenty, TWENTY)
	calculate_subtotal_dollars()
	refresh_totals()

func _on_button_twenty_increment_pressed() -> void:
	count_twenty = count_twenty + 1
	refresh_lines(line_edit_twenty_count, count_twenty)
	calculate_currency(count_twenty, TWENTY)
	calculate_subtotal_dollars()
	refresh_totals()

func _on_button_fifty_decrement_pressed() -> void:
	count_fifty = count_fifty - 1
	refresh_lines(line_edit_fifty_count, count_fifty)
	calculate_currency(count_fifty, FIFTY)
	calculate_subtotal_dollars()
	refresh_totals()

func _on_line_edit_fifty_count_text_submitted(new_text: String) -> void:
	count_fifty = new_text.to_int()
	refresh_lines(line_edit_fifty_count, count_fifty)
	calculate_currency(count_fifty, FIFTY)
	calculate_subtotal_dollars()
	refresh_totals()

func _on_button_fifty_increment_pressed() -> void:
	count_fifty = count_fifty + 1
	refresh_lines(line_edit_fifty_count, count_fifty)
	calculate_currency(count_fifty, FIFTY)
	calculate_subtotal_dollars()
	refresh_totals()

func _on_button_hundred_decrement_pressed() -> void:
	count_hundred = count_hundred - 1
	refresh_lines(line_edit_hundred_count, count_hundred)
	calculate_currency(count_hundred, HUNDRED)
	calculate_subtotal_dollars()
	refresh_totals()

func _on_line_edit_hundred_count_text_submitted(new_text: String) -> void:
	count_hundred = new_text.to_int()
	refresh_lines(line_edit_hundred_count, count_hundred)
	calculate_currency(count_hundred, HUNDRED)
	calculate_subtotal_dollars()
	refresh_totals()

func _on_button_hundred_increment_pressed() -> void:
	count_hundred = count_hundred + 1
	refresh_lines(line_edit_hundred_count, count_hundred)
	calculate_currency(count_hundred, HUNDRED)
	calculate_subtotal_dollars()
	refresh_totals()


func _on_button_save_pressed() -> void:

	save_pressed.emit()
