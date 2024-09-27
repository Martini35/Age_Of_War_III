extends Control

@onready var Unit1Timer = $Unit_1/Timer_1
@onready var CooldownUnit1 = $Unit_1/Cooldown_Unit_1
@onready var Unit2Timer = $Unit_2/Timer_2
@onready var CooldownUnit2 = $Unit_2/Cooldown_Unit_2
@onready var Unit3Timer = $Unit_3/Timer_3
@onready var CooldownUnit3 = $Unit_3/Cooldown_Unit_3
@onready var timer1 = true
@onready var timer2 = true
@onready var timer3 = true

signal button_1_preset
signal button_2_preset
signal button_3_preset


func _process(delta):
	CooldownUnit1.value = Unit1Timer.time_left * 100
	CooldownUnit2.value = Unit2Timer.time_left * 100
	CooldownUnit3.value = Unit3Timer.time_left * 100


func _on_button_pressed():
	if timer1:
		button_1_preset.emit()
		timer1 = false
		timer2 = false
		timer3 = false
		Unit1Timer.start()
		Unit2Timer.start()
		Unit3Timer.start()


func _on_unit_2_pressed():
	if timer2:
		button_2_preset.emit()
		timer1 = false
		timer2 = false
		timer3 = false
		Unit1Timer.start()
		Unit2Timer.start()
		Unit3Timer.start()


func _on_unit_3_pressed():
	if timer3:
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
