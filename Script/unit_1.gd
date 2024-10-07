extends frend 

@onready var animacja = $AnimationPlayer
@onready var attackCooldown = $AttackCooldown
@onready var hpBar = $TextureProgressBar

@onready var attackBool = false
@onready var canAttac = true
@onready var frendS = false
@onready var enemys: Array

@onready var hp = 100


func _ready():
	hpBar.max_value = hp
	hpBar.value = hp


func _physics_process(delta):
	if enemys.size() > 0:
		attack()
	else:
		animactrion()


func animactrion():
	if !attackBool && !frendS:
		animacja.play("walk_right")
		
		position.x += 0.5


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
	if hp <= 0 :
		self.queue_free()


func _on_mele_attack_body_entered(body):
	if body is enemy:
		enemys.append(body)
		
	if body is rightBase:
		enemys.append(body)
		
	if body is frend:
		frendS = true


func _on_mele_attack_body_exited(body):
	if body is enemy:
		enemys.erase(body)
		if enemys.size() == 0:
			attackBool = false
	
	if body is frend:
		frendS = false
