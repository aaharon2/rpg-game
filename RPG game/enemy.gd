extends CharacterBody2D

var speed = 45
var player_chase = false
var player = null

var health = 100
var player_inattack_zone = false
var can_take_damage = true
var can_pause = false

func _physics_process(_delta):
	deal_with_damage()
	
	if player_chase == true and health >= 1:
		position += (player.position - position)/speed
		$AnimatedSprite2D.play("walk")
		if(player.position.x - position.x) < 0:
			$AnimatedSprite2D.flip_h = true
		else:
			$AnimatedSprite2D.flip_h = false
		move_and_collide(Vector2(0,0))
	elif player_chase == false and health >= 1:
		$AnimatedSprite2D.play("idle")

func _on_detection_area_body_entered(body):
	if body.has_method("player"):
		player = body
		player_chase = true

func _on_detection_area_body_exited(body):
	if body.has_method("player"):
		player = null
		player_chase = false

func enemy():
	pass
	
func _on_enemy_hitbox_body_entered(body):
	if body.has_method("player"):
		player_inattack_zone = true

func _on_enemy_hitbox_body_exited(body):
	if body.has_method("player"):
		player_inattack_zone = false

func deal_with_damage():
	if player_inattack_zone and Global.player_cur_attack == true:
		if can_take_damage == true:
			health = health - 20
			$Damage_cooldown.start()
			can_take_damage = false
			print("enemy health = ", health)
			if health <= 0 and can_pause == false:
				$AnimatedSprite2D.play("death")
				can_pause = true
				pause()

func _on_damage_cooldown_timeout():
	can_take_damage = true

func pause():
	if can_pause == true:
		process_mode = Node.PROCESS_MODE_DISABLED

