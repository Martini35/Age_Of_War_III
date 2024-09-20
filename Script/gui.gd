extends Control

@onready var Unit1Timer = $Unit_1/Timer_1
@onready var CooldownUnit1 = $Unit_1/Cooldown_Unit_1
@onready var Unit2Timer = $Unit_2/Timer_2
@onready var CooldownUnit2 = $Unit_2/Cooldown_Unit_2
@onready var timer1 = true
@onready var timer2 = true

signal button_1_preset
signal button_2_preset


func _process(delta):
	CooldownUnit1.value = Unit1Timer.time_left * 100
	CooldownUnit2.value = Unit2Timer.time_left * 100


func _on_button_pressed():
	if timer1:
		button_1_preset.emit()
		timer1 = false
		Unit1Timer.start()


func _on_unit_2_pressed():
	if timer2:
		button_2_preset.emit()
		timer2 = false
		Unit2Timer.start()


func _on_timer_1_timeout():
	timer1 = true


func _on_timer_2_timeout():
	timer2 = true



