extends enemy

@onready var hpBar = $TextureProgressBar
@onready var animacja = $AnimationPlayer
@onready var attackCooldown = $AttackCooldown
@onready var resourcesSpawn = $ResourcesSpawn

var resours = preload("res://Scean/resources.tscn")

@onready var attackBool = false
@onready var canAttac = true
@onready var enemyS = false
@onready var enemys: Array

@onready var hp = 100
var gold = 12
var food = 1


func _ready():
	hpBar.visible = false
	hpBar.value = hp


func _physics_process(delta):
	if enemys.size() > 0:
		attack()
	else:
		animactrion()


func animactrion():
	if !attackBool && !enemyS:
		animacja.play("walk_left")
		if enemys.size() > 0:
			animacja.stop()
		position.x -= 0.5


func attack():
	if canAttac && enemys.size() > 0:
		attackCooldown.start()
		animacja.play("attack")
		enemys[0].takeDamageFromEnemy(10)
		attackBool = true
		canAttac = false
		
		await attackCooldown.timeout
		canAttac = true


func takeDamageFromEnemy(damage):
	hpBar.visible = true
	hp -= damage
	hpBar.value = hp
	if hp <= 0:
		dead()


func _on_mele_attack_body_entered(body):
	if body is frend:
		enemys.append(body)
		
	if body is enemy:
		enemyS = true


func _on_mele_attack_body_exited(body):
	if body is frend:
		enemys.erase(body)
		if enemys.size() == 0:
			attackBool = false
	
	if body is enemy:
		enemyS = false


func dead():
	var resours1 = resours.instantiate()
	resours1.position = resourcesSpawn.global_position
	resours1.gold = gold
	resours1.food = food
	get_tree().root.add_child(resours1)
	Global.emit_signal("res", gold, food)
	self.queue_free()
