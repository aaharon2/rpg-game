extends CharacterBody2D

var speed = 35
var player_chase = false
var player = null

var health = 200
var player_inattack_zone = false
var can_take_damage = true
var took_dmg = false

func _physics_process(_delta):
	deal_with_damage()
	update_health()
	if player_chase == true and health >= 1: #movement
		position += (player.position - position)/speed
		$AnimatedSprite2D.play("walk1")
		if(player.position.x - position.x) < 0:
			$AnimatedSprite2D.flip_h = true
		else:
			$AnimatedSprite2D.flip_h = false
		move_and_collide(Vector2(0,0))
	elif player_chase == false and health >= 1:
		$AnimatedSprite2D.play("idle1")

func monster():
	pass

func _on_detection_area_body_entered(body):
	if body.has_method("player"):
		player = body
		player_chase = true

func _on_detection_area_body_exited(body):
	if body.has_method("player"):
		player = null #empty (no player)
		player_chase = false

func deal_with_damage():
	if player_inattack_zone and Global.player_cur_attack == true and health > 0:
		if can_take_damage == true:
			health = health - 20 #takes dmg
			$CPUParticles2D.restart() #plays hit particles
			took_dmg = true
			$Damage_cooldown.start()
			can_take_damage = false
			print("enemy health = ", health)
			if health <= 0:
				$AnimatedSprite2D.play("death1")
				Global.monster_alive = false
				can_take_damage = false
				$CollisionShape2D.disabled = true
				await get_tree().create_timer(3).timeout #waits 3s until despawning
				queue_free()

func _on_damage_cooldown_timeout():
	can_take_damage = true

func update_health():
	var healthbar = $HealthBar
	healthbar.value = health
	
	if health >= 200:
		healthbar.visible = false
	elif health >= 1 or health < 200:
		healthbar.visible = true
	elif health <= 0:
		healthbar.visible = false
		Global.monster_alive = false

func _on_monster_hitbox_body_entered(body):
	if body.has_method("player"):
		player_inattack_zone = true

func _on_monster_hitbox_body_exited(body):
	if body.has_method("player"):
		player_inattack_zone = false
