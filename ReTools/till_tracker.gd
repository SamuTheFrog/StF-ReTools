class_name tilltracker extends Control

@onready var line_edit_hundred: LineEdit = $VBoxContainer/VBoxContainer_Dollars/HBox_Hundred/LineEdit_HundredCount
@onready var label_hundred: Label = $VBoxContainer/VBoxContainer_Dollars/HBox_Hundred/Label_HundredTotal
@onready var line_edit_fifty: LineEdit = $VBoxContainer/VBoxContainer_Dollars/HBox_Fifty/LineEdit_FiftyCount
@onready var label_fifty: Label = $VBoxContainer/VBoxContainer_Dollars/HBox_Fifty/Label_FiftyTotal
@onready var line_edit_twenty: LineEdit = $VBoxContainer/VBoxContainer_Dollars/HBox_Twenty/LineEdit_TwentyCount
@onready var label_twenty: Label = $VBoxContainer/VBoxContainer_Dollars/HBox_Twenty/Label_TwentyTotal
@onready var line_edit_ten: LineEdit = $VBoxContainer/VBoxContainer_Dollars/HBox_Ten/LineEdit_TenCount
@onready var label_ten: Label = $VBoxContainer/VBoxContainer_Dollars/HBox_Ten/Label_TenTotal
@onready var line_edit_five: LineEdit = $VBoxContainer/VBoxContainer_Dollars/HBox_Five/LineEdit_FiveCount
@onready var label_five: Label = $VBoxContainer/VBoxContainer_Dollars/HBox_Five/Label_FiveTotal
@onready var line_edit_two: LineEdit = $VBoxContainer/VBoxContainer_Dollars/HBox_Two/LineEdit_TwoCount
@onready var label_two: Label = $VBoxContainer/VBoxContainer_Dollars/HBox_Two/Label_TwoTotal
@onready var line_edit_one: LineEdit = $VBoxContainer/VBoxContainer_Dollars/HBox_One/LineEdit_OneCount
@onready var label_one: Label = $VBoxContainer/VBoxContainer_Dollars/HBox_One/Label_OneTotal
@onready var line_edit_whole: LineEdit = $VBoxContainer/VBoxContainer_Cents/HBox_Whole/LineEdit_WholeCount
@onready var label_whole: Label = $VBoxContainer/VBoxContainer_Cents/HBox_Whole/Label_WholeTotal
@onready var line_edit_half: LineEdit = $VBoxContainer/VBoxContainer_Cents/HBox_Half/LineEdit_HalfCount
@onready var label_half: Label = $VBoxContainer/VBoxContainer_Cents/HBox_Half/Label_HalfTotal
@onready var line_edit_quarter: LineEdit = $VBoxContainer/VBoxContainer_Cents/HBox_Quarter/LineEdit_QuarterCount
@onready var label_quarter: Label = $VBoxContainer/VBoxContainer_Cents/HBox_Quarter/Label_QuarterTotal
@onready var line_edit_dime: LineEdit = $VBoxContainer/VBoxContainer_Cents/HBox_Dime/LineEdit_DimeCount
@onready var label_dime: Label = $VBoxContainer/VBoxContainer_Cents/HBox_Dime/Label_DimeTotal
@onready var line_edit_nickel: LineEdit = $VBoxContainer/VBoxContainer_Cents/HBox_Nickel/LineEdit_NickelCount
@onready var label_nickel: Label = $VBoxContainer/VBoxContainer_Cents/HBox_Nickel/Label_NickelTotal
@onready var line_edit_penny: LineEdit = $VBoxContainer/VBoxContainer_Cents/HBox_Penny/LineEdit_PennyCount
@onready var label_penny: Label = $VBoxContainer/VBoxContainer_Cents/HBox_Penny/Label_PennyTotal
@onready var label_subtotal_cents: Label = $VBoxContainer/HBoxContainer_Subtotal_Cents/Label_Subtotal_Cents
@onready var label_total: Label = $VBoxContainer/HBoxContainer_Total/Label_Total
# Coin Values
const PENNY:int 	= 1
const NICKEL:int 	= 5
const DIME:int 		= 10
const QUARTER:int 	= 25
const HALF:int 		= 50
const WHOLE:int		= 100
# Dollar Values
const ONE:int		= 100
const TWO:int		= 200
const FIVE:int		= 500
const TEN:int		= 1000
const TWENTY:int	= 2000
const FIFTY:int		= 5000
const HUNDRED:int	= 10000
# Cent Counts
var count_penny:int
var count_nickel:int
var count_dime:int
var count_quarter:int
var count_half:int
var count_whole:int
# Dollar Counts
var count_one:int
var count_two:int
var count_five:int
var count_ten:int
var count_twenty:int
var count_fifty:int
var count_hundred:int
# Totals
var subtotal_cents:String
var subtotal_dollars:String
var grandtotal:String

func increment(value):
	value = value + 1
	return value

func decrement(value):
	value = value - 1
	return value

func calculate(count:int, TYPE:int):
	var calculation = count * TYPE
	return calculation

func refresh(line_edit:LineEdit, count:int):
	line_edit.text = str(count)
	return line_edit.text

func format_currency(amount: int) -> String:
	var dollars = amount / 100
	var cents = amount % 100
	return "$%d.%02d" % [dollars, cents]

func calculate_totals():
	#subtotal_dollars =
	pass

func update_totals(label:Label, total:String):
	label.text = total


func _on_button_decrement(count,VALUE,line_edit,label):
	count = decrement(count)
	var calculation = calculate(count,VALUE)
	var formatted = format_currency(calculation)
	refresh(line_edit, count)
	update_totals(label, formatted)
	return [count,VALUE,line_edit,label,formatted]

func _on_line_edit_submit(count,VALUE,new_text,line_edit,label):
	count = new_text.to_int()
	var calculation = calculate(count,VALUE)
	var formatted = format_currency(calculation)
	refresh(line_edit, count)
	update_totals(label, formatted)

func _on_button_increment(count,VALUE,line_edit,label):
	count = increment(count)
	var calculation = calculate(count,VALUE)
	var formatted = format_currency(calculation)
	refresh(line_edit, count)
	update_totals(label, formatted)
	return [count,VALUE,line_edit,label,formatted]


func activate() -> void:
	show()
	
func deactivate() -> void:
	hide()

# 100 - BUTTON EVENT
func _on_button_hundred_decrement_pressed() -> void:
	_on_button_decrement(count_hundred,HUNDRED,line_edit_hundred,label_hundred)
# 100 LINE SUBMIT EVENT
func _on_line_edit_hundred_count_text_submitted(new_text: String) -> void:
	_on_line_edit_submit(count_hundred,new_text,line_edit_hundred,HUNDRED,label_hundred)
# 100 + BUTTON EVENT
func _on_button_hundred_increment_pressed() -> void:
	_on_button_increment(count_hundred,HUNDRED,line_edit_hundred,label_hundred)

# 50 - BUTTON EVENT
func _on_button_fifty_decrement_pressed() -> void:
	count_fifty = decrement(count_fifty)
	var calculation = calculate(count_fifty,FIFTY)
	var formatted = format_currency(calculation)
	refresh(line_edit_fifty, count_fifty)
	update_totals(label_fifty, formatted)
# 50 LINE SUBMIT EVENT
func _on_line_edit_fifty_count_text_submitted(new_text: String) -> void:
	count_fifty = new_text.to_int()
	var calculation = calculate(count_fifty,FIFTY)
	var formatted = format_currency(calculation)
	refresh(line_edit_fifty, count_fifty)
	update_totals(label_fifty, formatted)
# 50 + BUTTON EVENT
func _on_button_fifty_increment_pressed() -> void:
	count_fifty = increment(count_fifty)
	var calculation = calculate(count_fifty,FIFTY)
	var formatted = format_currency(calculation)
	refresh(line_edit_fifty, count_fifty)
	update_totals(label_fifty, formatted)

# 20 - BUTTON EVENT
func _on_button_twenty_decrement_pressed() -> void:
	count_twenty = decrement(count_twenty)
	var calculation = calculate(count_twenty,TWENTY)
	var formatted = format_currency(calculation)
	refresh(line_edit_twenty, count_twenty)
	update_totals(label_twenty, formatted)
# 20 LINE SUBMIT EVENT
func _on_line_edit_twenty_count_text_submitted(new_text: String) -> void:
	count_twenty = new_text.to_int()
	var calculation = calculate(count_twenty,TWENTY)
	var formatted = format_currency(calculation)
	refresh(line_edit_twenty, count_twenty)
	update_totals(label_twenty, formatted)
# 20 + BUTTON EVENT
func _on_button_twenty_increment_pressed() -> void:
	count_twenty = increment(count_twenty)
	var calculation = calculate(count_twenty,TWENTY)
	var formatted = format_currency(calculation)
	refresh(line_edit_twenty, count_twenty)
	update_totals(label_twenty, formatted)

# 10 - BUTTON EVENT
func _on_button_ten_decrement_pressed() -> void:
	count_ten = decrement(count_ten)
	var calculation = calculate(count_ten,TEN)
	var formatted = format_currency(calculation)
	refresh(line_edit_ten, count_ten)
	update_totals(label_ten, formatted)
# 10 LINE SUBMIT EVENT
func _on_line_edit_ten_count_text_submitted(new_text: String) -> void:
	count_ten = new_text.to_int()
	var calculation = calculate(count_ten,TEN)
	var formatted = format_currency(calculation)
	refresh(line_edit_ten, count_ten)
	update_totals(label_ten, formatted)
# 10 + BUTTON EVENT
func _on_button_ten_increment_pressed() -> void:
	count_ten = increment(count_ten)
	var calculation = calculate(count_ten,TEN)
	var formatted = format_currency(calculation)
	refresh(line_edit_ten, count_ten)
	update_totals(label_ten, formatted)

# 5 - BUTTON EVENT
func _on_button_five_decrement_pressed() -> void:
	count_five = decrement(count_five)
	var calculation = calculate(count_five,FIVE)
	var formatted = format_currency(calculation)
	refresh(line_edit_five, count_five)
	update_totals(label_five, formatted)
# 5 LINE SUBMIT EVENT
func _on_line_edit_five_count_text_submitted(new_text: String) -> void:
	count_five = new_text.to_int()
	var calculation = calculate(count_five,FIVE)
	var formatted = format_currency(calculation)
	refresh(line_edit_five, count_five)
	update_totals(label_five, formatted)
# 5 + BUTTON EVENT
func _on_button_five_increment_pressed() -> void:
	count_five = increment(count_five)
	var calculation = calculate(count_five,FIVE)
	var formatted = format_currency(calculation)
	refresh(line_edit_five, count_five)
	update_totals(label_five, formatted)

# 2 - BUTTON EVENT
func _on_button_two_decrement_pressed() -> void:
	count_two = decrement(count_two)
	var calculation = calculate(count_two,TWO)
	var formatted = format_currency(calculation)
	refresh(line_edit_two, count_two)
	update_totals(label_two, formatted)
# 2 LINE SUBMIT EVENT
func _on_line_edit_two_count_text_submitted(new_text: String) -> void:
	count_two = new_text.to_int()
	var calculation = calculate(count_two,TWO)
	var formatted = format_currency(calculation)
	refresh(line_edit_two, count_two)
	update_totals(label_two, formatted)
# 2 + BUTTON EVENT
func _on_button_two_increment_pressed() -> void:
	count_two = increment(count_two)
	var calculation = calculate(count_two,TWO)
	var formatted = format_currency(calculation)
	refresh(line_edit_two, count_two)
	update_totals(label_two, formatted)

# 1 - BUTTON EVENT
func _on_button_one_decrement_pressed() -> void:
	count_one = decrement(count_one)
	var calculation = calculate(count_one,ONE)
	var formatted = format_currency(calculation)
	refresh(line_edit_one, count_one)
	update_totals(label_one, formatted)
# 1 LINE SUBMIT EVENT
func _on_line_edit_one_count_text_submitted(new_text: String) -> void:
	count_one = new_text.to_int()
	var calculation = calculate(count_one,ONE)
	var formatted = format_currency(calculation)
	refresh(line_edit_one, count_one)
	update_totals(label_one, formatted)
# 1 + BUTTON EVENT
func _on_button_one_increment_pressed() -> void:
	count_one = increment(count_one)
	var calculation = calculate(count_one,ONE)
	var formatted = format_currency(calculation)
	refresh(line_edit_one, count_one)
	update_totals(label_one, formatted)

# DOLLAR COIN - BUTTON EVENT
func _on_button_whole_decrement_pressed() -> void:
	count_whole = decrement(count_whole)
	var calculation = calculate(count_whole,WHOLE)
	var formatted = format_currency(calculation)
	refresh(line_edit_whole, count_whole)
	update_totals(label_whole, formatted)
# DOLLAR COIN LINE SUBMIT EVENT
func _on_line_edit_whole_count_text_submitted(new_text: String) -> void:
	count_whole = new_text.to_int()
	var calculation = calculate(count_whole,WHOLE)
	var formatted = format_currency(calculation)
	refresh(line_edit_whole, count_whole)
	update_totals(label_whole, formatted)
# DOLLAR COIN + BUTTON EVENT
func _on_button_whole_increment_pressed() -> void:
	count_whole = increment(count_whole)
	var calculation = calculate(count_whole,WHOLE)
	var formatted = format_currency(calculation)
	refresh(line_edit_whole, count_whole)
	update_totals(label_whole, formatted)

# HALF DOLLAR - BUTTON EVENT
func _on_button_half_decrement_pressed() -> void:
	count_half = decrement(count_half)
	var calculation = calculate(count_half,HALF)
	var formatted = format_currency(calculation)
	refresh(line_edit_half, count_half)
	update_totals(label_half, formatted)
# HALF DOLLAR LINE SUBMIT EVENT
func _on_line_edit_half_count_text_submitted(new_text: String) -> void:
	count_half = new_text.to_int()
	var calculation = calculate(count_half,HALF)
	var formatted = format_currency(calculation)
	refresh(line_edit_half, count_half)
	update_totals(label_half, formatted)
# HALF DOLLAR + BUTTON EVENT
func _on_button_half_increment_pressed() -> void:
	count_half = increment(count_half)
	var calculation = calculate(count_half,HALF)
	var formatted = format_currency(calculation)
	refresh(line_edit_half, count_half)
	update_totals(label_half, formatted)

# QUARTER - BUTTON EVENT
func _on_button_quarter_decrement_pressed() -> void:
	count_quarter = decrement(count_quarter)
	var calculation = calculate(count_quarter,QUARTER)
	var formatted = format_currency(calculation)
	refresh(line_edit_quarter, count_quarter)
	update_totals(label_quarter, formatted)
# QUARTER LINE EVENT SUBMIT 
func _on_line_edit_quarter_count_text_submitted(new_text: String) -> void:
	count_quarter = new_text.to_int()
	var calculation = calculate(count_quarter,QUARTER)
	var formatted = format_currency(calculation)
	refresh(line_edit_quarter, count_quarter)
	update_totals(label_quarter, formatted)
# QUARTER + BUTTON EVENT
func _on_button_quarter_increment_pressed() -> void:
	count_quarter = increment(count_quarter)
	var calculation = calculate(count_quarter,QUARTER)
	var formatted = format_currency(calculation)
	refresh(line_edit_quarter, count_quarter)
	update_totals(label_quarter, formatted)

# DIME - BUTTON EVENT
func _on_button_dime_decrement_pressed() -> void:
	count_dime = decrement(count_dime)
	var calculation = calculate(count_dime,DIME)
	var formatted = format_currency(calculation)
	refresh(line_edit_dime, count_dime)
	update_totals(label_dime, formatted)
# DIME LINE SUBMIT EVENT
func _on_line_edit_dime_count_text_submitted(new_text: String) -> void:
	count_dime = new_text.to_int()
	var calculation = calculate(count_dime,DIME)
	var formatted = format_currency(calculation)
	refresh(line_edit_dime, count_dime)
	update_totals(label_dime, formatted)
# DIME + BUTTON EVENT
func _on_button_dime_increment_pressed() -> void:
	count_dime = increment(count_dime)
	var calculation = calculate(count_dime,DIME)
	var formatted = format_currency(calculation)
	refresh(line_edit_dime, count_dime)
	update_totals(label_dime, formatted)

# NICKEL - BUTTON EVENT
func _on_button_nickel_decrement_pressed() -> void:
	count_nickel = decrement(count_nickel)
	var calculation = calculate(count_nickel,NICKEL)
	var formatted = format_currency(calculation)
	refresh(line_edit_nickel, count_nickel)
	update_totals(label_nickel, formatted)
# NICKEL LINE SUBMIT EVENT
func _on_line_edit_nickel_count_text_submitted(new_text: String) -> void:
	count_nickel = new_text.to_int()
	var calculation = calculate(count_nickel,NICKEL)
	var formatted = format_currency(calculation)
	refresh(line_edit_nickel, count_nickel)
	update_totals(label_nickel, formatted)
# NICKEL + BUTTON EVENT
func _on_button_nickel_increment_pressed() -> void:
	count_nickel = increment(count_nickel)
	var calculation = calculate(count_nickel,NICKEL)
	var formatted = format_currency(calculation)
	refresh(line_edit_nickel, count_nickel)
	update_totals(label_nickel, formatted)

# PENNY - BUTTON EVENT
func _on_button_penny_decrement_pressed() -> void:
	count_penny = decrement(count_penny)
	var calculation = calculate(count_penny,PENNY)
	var formatted = format_currency(calculation)
	refresh(line_edit_penny, count_penny)
	update_totals(label_penny, formatted)
# PENNY LINE SUBMIT EVENT
func _on_line_edit_penny_count_text_submitted(new_text: String) -> void:
	count_penny = new_text.to_int()
	var calculation = calculate(count_penny,PENNY)
	var formatted = format_currency(calculation)
	refresh(line_edit_penny, count_penny)
	update_totals(label_penny, formatted)
# PENNY + BUTTON EVENT
func _on_button_penny_increment_pressed() -> void:
	count_penny = increment(count_penny)
	var calculation = calculate(count_penny,PENNY)
	var formatted = format_currency(calculation)
	refresh(line_edit_penny, count_penny)
	update_totals(label_penny, formatted)
