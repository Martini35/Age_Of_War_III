extends CharacterBody2D

class_name LeftBase

@onready var hpBar = $TextureProgressBar

var hp = 1000

func _ready():
	hpBar.max_value = hp
	hpBar.value = hp


func _process(delta):
	if hpBar.value == hpBar.max_value:
		hpBar.visible = false
	else:
		hpBar.visible = true


func takeDamageFromEnemy(damage):
	hpBar.visible = true
	hp -= damage
	hpBar.value = hp
	if hp <= 0:
		pass
