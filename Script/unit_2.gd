extends frend

@onready var animacja = $AnimationPlayer
@onready var attackCooldown = $AttackCooldown
@onready var hpBar = $TextureProgressBar
@onready var shoot = $Marker2D

@onready var attackBool = false
@onready var canAttac = true
@onready var frendS = false
@onready var enemyS = false
@onready var enemys: Array

@onready var hp = 50

var fireBall = preload("res://Scean/flame_progectile.tscn")

func _ready():
	hpBar.max_value = hp
	hpBar.value = hp


func _physics_process(delta):
	if enemys.size() > 0:
		attack()
	else:
		animactrion()


func animactrion():
	if !frendS && !enemyS:
		animacja.play("walk_right")
		
		position.x += 0.5


func attack():
	if canAttac && enemys.size() > 0:
		attackCooldown.start()
		animacja.play("attack")
		var fireball = fireBall.instantiate()
		fireball.position = shoot.position
		fireball.wey = 1
		add_child(fireball)
		attackBool = true
		canAttac = false
	else:
		animactrion()
		


func takeDamageFromEnemy(damage):
	hpBar.visible = true
	hp -= damage
	hpBar.value = hp
	if hp <= 0 :
		self.queue_free()


#func _on_mele_attack_body_entered(body):
	#if body is enemy:
		#enemys.append(body)
		#
	#if body is frend:
		#frendS = true
#
#
#func _on_mele_attack_body_exited(body):
	#if body is enemy:
		#enemys.erase(body)
		#if enemys.size() == 0:
			#attackBool = false
	#
	#if body is frend:
		#frendS = false


func _on_attac_area_body_entered(body):
	if body is enemy:
		enemys.append(body)


func _on_attac_area_body_exited(body):
	if body is enemy:
		enemys.erase(body)


func _on_close_counter_area_body_entered(body):
	if body is enemy:
		enemyS = true
	
	if body is frend:
		frendS = true


func _on_close_counter_area_body_exited(body):
	if body is enemy:
		enemyS = false
	
	if body is frend:
		frendS = false


func _on_attack_cooldown_timeout():
	canAttac = true
