extends Control

@onready var Unit1Timer = $Unit_1/Timer_1
@onready var CooldownUnit1 = $Unit_1/Cooldown_Unit_1
@onready var Unit2Timer = $Unit_2/Timer_2
@onready var CooldownUnit2 = $Unit_2/Cooldown_Unit_2
@onready var Unit3Timer = $Unit_3/Timer_3
@onready var CooldownUnit3 = $Unit_3/Cooldown_Unit_3
@onready var GoldLabel = $Gold
@onready var FoodLabel = $Food
@onready var Unit1GoldLabel = $Unit_1/Gold
@onready var Unit1FoodLabel = $Unit_1/Food
@onready var Unit1GoldImg = $Unit_1/GoldImg
@onready var Unit1FoodImg = $Unit_1/FoodImg
@onready var Unit2GoldLabel = $Unit_2/Gold
@onready var Unit2FoodLabel = $Unit_2/Food
@onready var Unit2GoldImg = $Unit_2/GoldImg
@onready var Unit2FoodImg = $Unit_2/FoodImg
@onready var Unit3GoldLabel = $Unit_3/Gold
@onready var Unit3FoodLabel = $Unit_3/Food
@onready var Unit3GoldImg = $Unit_3/GoldImg
@onready var Unit3FoodImg = $Unit_3/FoodImg

@onready var timer1 = true
@onready var timer2 = true
@onready var timer3 = true
@onready var gold: int = 100
@onready var food: int = 10

var unitGoldCost = [10, 20, 50]
var unitFoodCost = [0, 2, 10]

signal button_1_preset
signal button_2_preset
signal button_3_preset


func _ready():
	Unit1GoldLabel.visible = false
	Unit1FoodLabel.visible = false
	Unit1GoldImg.visible = false
	Unit1FoodImg.visible = false
	
	Unit2GoldLabel.visible = false
	Unit2FoodLabel.visible = false
	Unit2GoldImg.visible = false
	Unit2FoodImg.visible = false
	
	Unit3GoldLabel.visible = false
	Unit3FoodLabel.visible = false
	Unit3GoldImg.visible = false
	Unit3FoodImg.visible = false
	
	Unit1GoldLabel.text = str(unitGoldCost[0])
	Unit1FoodLabel.text = str(unitFoodCost[0])
	
	Unit2GoldLabel.text = str(unitGoldCost[1])
	Unit2FoodLabel.text = str(unitFoodCost[1])
	
	Unit3GoldLabel.text = str(unitGoldCost[2])
	Unit3FoodLabel.text = str(unitFoodCost[2])
	
	Global.connect("res", Callable(self, "_add_resours"))


func _process(delta):
	CooldownUnit1.value = Unit1Timer.time_left * 100
	CooldownUnit2.value = Unit2Timer.time_left * 100
	CooldownUnit3.value = Unit3Timer.time_left * 100
	
	GoldLabel.text = str(gold)
	FoodLabel.text = str(food)
	
	if gold < unitGoldCost[0]:
		Unit1GoldLabel.add_theme_color_override("font_color", "red")
	else:
		Unit1GoldLabel.add_theme_color_override("font_color", "white")
	if gold < unitGoldCost[1]:
		Unit2GoldLabel.add_theme_color_override("font_color", "red")
	else:
		Unit2GoldLabel.add_theme_color_override("font_color", "white")
	if gold < unitGoldCost[2]:
		Unit3GoldLabel.add_theme_color_override("font_color", "red")
	else:
		Unit3GoldLabel.add_theme_color_override("font_color", "white")
		
	if food < unitFoodCost[0]:
		Unit1FoodLabel.add_theme_color_override("font_color", "red")
	else:
		Unit1FoodLabel.add_theme_color_override("font_color", "white")
	if food < unitFoodCost[1]:
		Unit2FoodLabel.add_theme_color_override("font_color", "red")
	else:
		Unit2FoodLabel.add_theme_color_override("font_color", "white")
	if food < unitFoodCost[2]:
		Unit3FoodLabel.add_theme_color_override("font_color", "red")
	else:
		Unit3FoodLabel.add_theme_color_override("font_color", "white")


func _on_unit_1_pressed():
	if timer1:
		if gold >= unitGoldCost[0] && food >= unitFoodCost[0]:
			buyUnit(unitGoldCost[0], unitFoodCost[0])
			button_1_preset.emit()
			timer1 = false
			timer2 = false
			timer3 = false
			Unit1Timer.start()
			Unit2Timer.start()
			Unit3Timer.start()


func _on_unit_2_pressed():
	if timer2:
		if gold >= unitGoldCost[1] && food >= unitFoodCost[1]:
			buyUnit(unitGoldCost[1], unitFoodCost[1])
			button_2_preset.emit()
			timer1 = false
			timer2 = false
			timer3 = false
			Unit1Timer.start()
			Unit2Timer.start()
			Unit3Timer.start()


func _on_unit_3_pressed():
	if timer3:
		if gold >= unitGoldCost[2] && food >= unitFoodCost[2]:
			buyUnit(unitGoldCost[2], unitFoodCost[2])
			button_3_preset.emit()
			timer1 = false
			timer2 = false
			timer3 = false
			Unit1Timer.start()
			Unit2Timer.start()
			Unit3Timer.start()


func _on_timer_1_timeout():
	timer1 = true
	timer2 = true
	timer3 = true


func _on_timer_2_timeout():
	timer1 = true
	timer2 = true
	timer3 = true


func _on_timer_3_timeout():
	timer1 = true
	timer2 = true
	timer3 = true


func buyUnit(buyGold, buyFood):
	gold -= buyGold
	food -= buyFood


func _on_unit_1_mouse_entered():
	Unit1GoldLabel.visible = true
	Unit1FoodLabel.visible = true
	Unit1GoldImg.visible = true
	Unit1FoodImg.visible = true


func _on_unit_1_mouse_exited():
	Unit1GoldLabel.visible = false
	Unit1FoodLabel.visible = false
	Unit1GoldImg.visible = false
	Unit1FoodImg.visible = false


func _on_unit_2_mouse_entered():
	Unit2GoldLabel.visible = true
	Unit2FoodLabel.visible = true
	Unit2GoldImg.visible = true
	Unit2FoodImg.visible = true


func _on_unit_2_mouse_exited():
	Unit2GoldLabel.visible = false
	Unit2FoodLabel.visible = false
	Unit2GoldImg.visible = false
	Unit2FoodImg.visible = false


func _on_unit_3_mouse_entered():
	Unit3GoldLabel.visible = true
	Unit3FoodLabel.visible = true
	Unit3GoldImg.visible = true
	Unit3FoodImg.visible = true


func _on_unit_3_mouse_exited():
	Unit3GoldLabel.visible = false
	Unit3FoodLabel.visible = false
	Unit3GoldImg.visible = false
	Unit3FoodImg.visible = false


func _add_resours(getGold, getFood):
	gold += getGold
	food += getFood
