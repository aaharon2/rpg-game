extends CharacterBody2D

const speed = 100
var current_dir = "none"
var lady_in_range = false
var emoteen_in_range = false
var girl_in_range = false
var mother_in_range = false
var twins_in_range = false
var man_in_range = false
var nerd_in_range = false
var enemy_inattack_range = false
var enemy_attack_cooldown = true
var monster_inattack_range = false
var monster_attack_cooldown = true
var health = 100
var player_alive = true
var attack_ip = false
var talking = false


func _read():
	$AnimatedSprite2D.play("front_idle")

func _physics_process(delta):
	player_movement(delta)
	enemy_attack()
	monster_attack()
	attack()
	update_health()
	if lady_in_range == true:
		if Input.is_action_just_pressed("ui_accept"):
			talk_ip()
			DialogueManager.show_example_dialogue_balloon(load("res://main.dialogue"), "fancy_lady")
			talk_not_ip()
			lady_in_range = false
			return
	if emoteen_in_range == true and Global.alphy_talked == false and Global.alphy_talk == false:
		if Input.is_action_just_pressed("ui_accept"):
			DialogueManager.show_example_dialogue_balloon(load("res://main.dialogue"), "emo_teen_1")
			$AnimatedSprite2D.play("back_idle")
			emoteen_in_range = false
			return
	if emoteen_in_range == true and Global.alphy_talk == true and Global.alphy_talked == false:
		if Input.is_action_just_pressed("ui_accept"):
			DialogueManager.show_example_dialogue_balloon(load("res://main.dialogue"), "emo_teen_2")
			$AnimatedSprite2D.play("back_idle")
			emoteen_in_range = false
			return
	if emoteen_in_range == true and Global.alphy_talked == true:
		if Input.is_action_just_pressed("ui_accept"):
			DialogueManager.show_example_dialogue_balloon(load("res://main.dialogue"), "emo_teen_3")
			$AnimatedSprite2D.play("back_idle")
			emoteen_in_range = false
			return
	if girl_in_range == true and Global.fancy_lady_talked == true:
		if Input.is_action_just_pressed("ui_accept"):
			DialogueManager.show_example_dialogue_balloon(load("res://main.dialogue"), "nature_girl")
			$AnimatedSprite2D.play("back_idle")
			girl_in_range = false
			return
	if mother_in_range == true:
		if Input.is_action_just_pressed("ui_accept"):
			DialogueManager.show_example_dialogue_balloon(load("res://main.dialogue"), "mother")
			$AnimatedSprite2D.play("back_idle")
			mother_in_range = false
			return
	if twins_in_range == true and Global.mother_talked == true:
		if Input.is_action_just_pressed("ui_accept"):
			DialogueManager.show_example_dialogue_balloon(load("res://main.dialogue"), "twins")
			$AnimatedSprite2D.play("back_idle")
			twins_in_range = false
			return
	if man_in_range == true:
		if Input.is_action_just_pressed("ui_accept"):
			DialogueManager.show_example_dialogue_balloon(load("res://main.dialogue"), "man")
			$AnimatedSprite2D.play("back_idle")
			man_in_range = false
			return
	if nerd_in_range == true:
		if Input.is_action_just_pressed("ui_accept"):
			DialogueManager.show_example_dialogue_balloon(load("res://main.dialogue"), "nerd")
			$AnimatedSprite2D.play("back_idle")
			nerd_in_range = false
			return
		
	
	if health <= 0: #death
		player_alive = false #add death animation
		health = 0
		print("Player died")
		position.x = 1289
		position.y = 323
		$Respawn.emitting = true
		$Hit.emitting = false
		player_alive = true
		health = 100

func player_movement(_delta): #player movement
	if Global.current_scene == "game_level" and $Respawn.emitting == false:
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
	
func play_anim(movement): #movement animation
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
	if body.has_method("emo_teen"):
		emoteen_in_range = true
	if body.has_method("nature_girl"):
		girl_in_range = true
	if body.has_method("mother"):
		mother_in_range = true
	if body.has_method("twins"):
		twins_in_range = true
	if body.has_method("man"):
		man_in_range = true
	if body.has_method("nerd"):
		nerd_in_range = true

func _on_detection_area_body_exited(body):
	if body.has_method("fancy_lady"):
		lady_in_range = false
	if body.has_method("emo_teen"):
		emoteen_in_range = false
	if body.has_method("nature_girl"):
		girl_in_range = false
	if body.has_method("mother"):
		mother_in_range = false
	if body.has_method("twins"):
		twins_in_range = false
	if body.has_method("man"):
		man_in_range = false
	if body.has_method("nerd"):
		nerd_in_range = false

func player():
	pass

func _on_player_hitbox_body_entered(body):
	if body.has_method("enemy"):
		enemy_inattack_range = true
	if body.has_method("monster"):
		monster_inattack_range = true
func _on_player_hitbox_body_exited(body):
	if body.has_method("enemy"):
		enemy_inattack_range = false
	if body.has_method("monster"):
		monster_inattack_range = false

func enemy_attack(): #when the enemy attacks
	if enemy_inattack_range and enemy_attack_cooldown == true:
		health = health - 20 #gets hit
		$Hit.emitting = true
		enemy_attack_cooldown = false
		$Enemy_Attack_Cooldown.start()
		print(health)
	
func monster_attack(): #when the monster attacks
	if monster_inattack_range and monster_attack_cooldown == true:
		health = health - 20 #gets hit
		$Hit.emitting = true
		monster_attack_cooldown = false
		$Monster_Attack_Cooldown.start()
		print(health)

func attack(): #attack animations
	var dir = current_dir
	
	if Input.is_action_just_pressed("attack") and Global.in_dungeon == true:
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

func _on_deal_attack_timer_timeout(): #when the player attacks
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
		

func _on_collectables_area_entered(area): #collecting the health potions
	if area.has_method("collect"):
		area.collect()
		if health < 100:
			health += 20
			$Healthpotion.emitting = true
			print(health)
			if health > 100:
				health = 100
				print(health)
		if health <= 0:
			health = 0
			print(health)


func _on_enemy_attack_cooldown_timeout():
	enemy_attack_cooldown = true


func _on_monster_attack_cooldown_timeout():
	monster_attack_cooldown = true

func talk_ip(): #talking in progress
	talking = true
	set_process_input(false)
	
func talk_not_ip(): #talking not in progress
	talking = false
	set_process_input(true)
