extends Node2D

@onready var goldText = $GoldLabel
@onready var foodText = $FoodLabel
@onready var animacja = $AnimationPlayer

var gold: int = 0
var food: int = 0

func _ready():
	animacja.play("RESET")
	goldText.text = str(gold)
	foodText.text = str(food)

func _process(delta):
	animacja.play("show")
	await animacja.animation_finished
	self.queue_free()
