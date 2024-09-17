extends Node2D

@onready var camera = $Camera2D
@onready var LeftSpawn = $LeftSpawn
@onready var gui = $Camera2D/GUI

var unit = preload("res://Character/unit_1.tscn")


func _ready():
	pass


func _process(delta):
	if Input.is_action_pressed("A"):
		camera.position.x -= 1
		
	if Input.is_action_pressed("D"):
		camera.position.x += 1

	if Input.is_action_just_pressed("Space"):
		spawnUnit()


func spawnUnit():
	pass


func _on_gui_button_1_preset():
	var unit1 = unit.instantiate()
	unit1.position = LeftSpawn.global_position
	add_child(unit1)
