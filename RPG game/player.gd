extends CharacterBody2D

const speed = 100
var current_dir = "none"
var lady_in_range = false
var enemy_inattack_range = false
var enemy_attack_cooldown = true
var health = 100
var player_alive = true
var attack_ip = false

 
func _read():
	$AnimatedSprite2D.play("front_idle")

func _physics_process(delta):
	if lady_in_range == true:
		if Input.is_action_just_pressed("ui_accept"):
			DialogueManager.show_example_dialogue_balloon(load("res://main.dialogue"), "fancy_lady")
			return
	player_movement(delta)
	enemy_attack()
	attack()
	update_health()
	
	if health <= 0:
		player_alive = false #add death animation and respawn screen
		health = 0
		print("Player died")
		self.queue_free()
		$AnimatedSprite2D.play()
			
func player_movement(_delta):
	if Global.current_scene == "game_level":
		if Input.is_action_pressed("ui_right"):
			play_anim(1)
			current_dir = "right"
			velocity.x = speed
			velocity.y = 0
		elif Input.is_action_pressed("ui_left"):
			play_anim(1)
			current_dir = "left"
			velocity.x = -speed
			velocity.y = 0
		elif Input.is_action_pressed("ui_down"):
			play_anim(1)
			current_dir = "down"
			velocity.y = speed
			velocity.x = 0
		elif Input.is_action_pressed("ui_up"):
			play_anim(1)
			current_dir = "up"
			velocity.y = -speed
			velocity.x = 0
		else:
			play_anim(0)
			velocity. x = 0
			velocity.y = 0
		move_and_slide()
	
func play_anim(movement):
	var dir = current_dir
	var anim = $AnimatedSprite2D
	
	if Global.current_scene == "game_level":
		if dir == "right":
			anim.flip_h = true
			if movement == 1:
				anim.play("side_walk")
			elif movement == 0:
				if attack_ip == false:
					anim.play("side_idle")
		if dir == "left":
			anim.flip_h = false
			if movement == 1:
				anim.play("side_walk")
			elif movement == 0:
				if attack_ip == false:
					anim.play("side_idle") 
		if dir == "down":
			anim.flip_h = false
			if movement == 1:
				anim.play("front_walk")
			elif movement == 0:
				if attack_ip == false:
					anim.play("front_idle") 
		if dir == "up":
			anim.flip_h = false
			if movement == 1:
				anim.play("back_walk")
			elif movement == 0:
				if attack_ip == false:
					anim.play("back_idle") 

func _on_detection_area_body_entered(body):
	if body.has_method("fancy_lady"):
		lady_in_range = true

func _on_detection_area_body_exited(body):
	if body.has_method("fancy_lady"):
		lady_in_range = false

func player():
	pass

func _on_player_hitbox_body_entered(body):
	if body.has_method("enemy"):
		enemy_inattack_range = true

func _on_player_hitbox_body_exited(body):
	if body.has_method("enemy"):
		enemy_inattack_range = false

func enemy_attack():
	if enemy_inattack_range and enemy_attack_cooldown == true:
		health = health - 10
		enemy_attack_cooldown = false
		$Attack_Cooldown.start()
		print(health)

func _on_attack_cooldown_timeout():
	enemy_attack_cooldown = true

func attack():
	var dir = current_dir
	
	if Input.is_action_just_pressed("attack"):
		Global.player_cur_attack = true
		attack_ip = true
		if dir == "right":
			$AnimatedSprite2D.flip_h = true
			$AnimatedSprite2D.play("side_attack")
			$Deal_attack_timer.start()
		if dir == "left":
			$AnimatedSprite2D.flip_h = false
			$AnimatedSprite2D.play("side_attack")
			$Deal_attack_timer.start()
		if dir == "up":
			$AnimatedSprite2D.play("back_attack")
			$Deal_attack_timer.start()
		if dir == "down":
			$AnimatedSprite2D.play("front_attack")
			$Deal_attack_timer.start()

func _on_deal_attack_timer_timeout():
	$Deal_attack_timer.stop()
	Global.player_cur_attack = false
	attack_ip = false

func update_health():
	var healthbar = $HealthBar
	healthbar.value = health
	
	if health >= 100:
		healthbar.visible = false
	else:
		healthbar.visible = true
		
		
		
		
		
