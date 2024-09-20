extends CharacterBody2D

@onready var animacje = $AnimationPlayer

@export var wey = 0

func _physics_process(delta):
	self.position.x += wey
	animacje.play("fly")


func _on_area_2d_body_entered(body):
	if body is enemy:
		body.takeDamageFromEnemy(15)
		self.queue_free()
