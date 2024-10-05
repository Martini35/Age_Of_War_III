extends Node2D

@onready var camera = $Camera2D
@onready var LeftSpawn = $LeftSpawn
@onready var RightSpawn = $RightSpawn
@onready var gui = $Camera2D/GUI


var unit1 = preload("res://Character/unit_1.tscn")
var unit2 = preload("res://Character/unit_2.tscn")
var unit3 = preload("res://Character/unit_3.tscn")

var enemy1 = preload("res://Character/unit_1_enemy.tscn")

@onready var canSpawn = true

func _ready():
	pass


func _process(delta):
	if Input.is_action_pressed("A"):
		if camera.position.x > 340:
			camera.position.x -= 1
		
	if Input.is_action_pressed("D"):
		if camera.position.x < 635:
			camera.position.x += 1
		
	if canSpawn:
		spawnEnemy()


func _on_gui_button_1_preset():
	var unit = unit1.instantiate()
	unit.position = LeftSpawn.global_position
	add_child(unit)


func _on_gui_button_2_preset():
	var unit = unit2.instantiate()
	unit.position = LeftSpawn.global_position
	add_child(unit)


func _on_gui_button_3_preset():
	var unit = unit3.instantiate()
	unit.position = LeftSpawn.global_position
	add_child(unit)


func spawnEnemy():
	canSpawn = false
	var enemy = enemy1.instantiate()
	enemy.position = RightSpawn.global_position
	add_child(enemy)
	await get_tree().create_timer(3).timeout
	canSpawn = true






