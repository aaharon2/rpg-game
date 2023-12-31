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
signal npc
signal npc2


func _ready():
	$AnimatedSprite2D.play("front_idle")

func _physics_process(delta):
	player_movement(delta)
	enemy_attack()
	monster_attack()
	attack()
	update_health()
	
	if Global.npcs_saved == true:
		await get_tree().create_timer(20).timeout
		get_tree().change_scene_to_file("res://maps/game_completed.tscn")
	
	if lady_in_range == true and Global.fancy_lady_talked == false:
		if Input.is_action_just_pressed("ui_accept") and Global.monster_alive == true:
			Global.npc += 1
			npc.emit(delta)
			DialogueManager.show_example_dialogue_balloon(load("res://miscellaneous/main.dialogue"), "fancy_lady")
			lady_in_range = false
			return
	if lady_in_range == true and Global.fancy_lady_talked == true:
		if Input.is_action_just_pressed("ui_accept") and Global.monster_alive == true:
			DialogueManager.show_example_dialogue_balloon(load("res://miscellaneous/main.dialogue"), "fancy_lady2")
			lady_in_range = false
			return
	if lady_in_range == true:
		if Input.is_action_just_pressed("ui_accept") and Global.monster_alive == false:
			Global.npc2 += 1
			npc2.emit(delta)
			DialogueManager.show_example_dialogue_balloon(load("res://miscellaneous/main.dialogue"), "merida")
			Global.merida_saved = true
			lady_in_range = false
			return
	if emoteen_in_range and Global.monster_alive == true and Global.alphy_talked == false and Global.alphy_talk == false:
		if Input.is_action_just_pressed("ui_accept"):
			DialogueManager.show_example_dialogue_balloon(load("res://miscellaneous/main.dialogue"), "emo_teen_1")
			emoteen_in_range = false
			return
	if emoteen_in_range and Global.monster_alive == true and Global.alphy_talk == true and Global.alphy_talked == false:
		if Input.is_action_just_pressed("ui_accept"):
			Global.npc += 1
			npc.emit(delta)
			DialogueManager.show_example_dialogue_balloon(load("res://miscellaneous/main.dialogue"), "emo_teen_2")
			emoteen_in_range = false
			return
	if emoteen_in_range and Global.monster_alive == true and Global.alphy_talked == true:
		if Input.is_action_just_pressed("ui_accept"):
			DialogueManager.show_example_dialogue_balloon(load("res://miscellaneous/main.dialogue"), "emo_teen_3")
			emoteen_in_range = false
			return
	if emoteen_in_range == true:
		if Input.is_action_just_pressed("ui_accept") and Global.monster_alive == false:
			Global.npc2 += 1
			npc2.emit(delta)
			DialogueManager.show_example_dialogue_balloon(load("res://miscellaneous/main.dialogue"), "alphy")
			Global.alphy_saved = true
			emoteen_in_range = false
			return
	if girl_in_range == true and Global.fancy_lady_talked == true and Global.fauna_talked == false:
		if Input.is_action_just_pressed("ui_accept") and Global.monster_alive == true:
			Global.npc += 1
			npc.emit(delta)
			DialogueManager.show_example_dialogue_balloon(load("res://miscellaneous/main.dialogue"), "nature_girl")
			girl_in_range = false
			return
	if girl_in_range == true and Global.fancy_lady_talked == true and Global.monster_alive == true and Global.fauna_talked == true:
		if Input.is_action_just_pressed("ui_accept"):
			DialogueManager.show_example_dialogue_balloon(load("res://miscellaneous/main.dialogue"), "nature_girl2")
			girl_in_range = false
			return
	if girl_in_range == true:
		if Input.is_action_just_pressed("ui_accept") and Global.monster_alive == false:
			Global.npc2 += 1
			npc2.emit(delta)
			DialogueManager.show_example_dialogue_balloon(load("res://miscellaneous/main.dialogue"), "fauna")
			Global.fauna_saved = true
			girl_in_range = false
			return
	if mother_in_range == true and Global.mother_talked == false:
		if Input.is_action_just_pressed("ui_accept") and Global.monster_alive == true:
			Global.npc += 1
			npc.emit(delta)
			DialogueManager.show_example_dialogue_balloon(load("res://miscellaneous/main.dialogue"), "mother")
			mother_in_range = false
			return
	if mother_in_range == true:
		if Global.mother_talked == true and Global.monster_alive == true:
			if Input.is_action_just_pressed("ui_accept"):
				DialogueManager.show_example_dialogue_balloon(load("res://miscellaneous/main.dialogue"), "mother2")
				mother_in_range = false
				return
	if mother_in_range == true:
		if Input.is_action_just_pressed("ui_accept") and Global.monster_alive == false:
			Global.npc2 += 1
			npc2.emit(delta)
			DialogueManager.show_example_dialogue_balloon(load("res://miscellaneous/main.dialogue"), "motherr")
			Global.mother_saved = true
			mother_in_range = false
			return
	if twins_in_range == true and Global.mother_talked == true and Global.twins_talked == false:
		if Input.is_action_just_pressed("ui_accept") and Global.monster_alive == true:
			DialogueManager.show_example_dialogue_balloon(load("res://miscellaneous/main.dialogue"), "twins")
			twins_in_range = false
			return
	if man_in_range == true and Global.man_talked == false:
		if Input.is_action_just_pressed("ui_accept") and Global.monster_alive == true:
			Global.npc += 1
			npc.emit(delta)
			DialogueManager.show_example_dialogue_balloon(load("res://miscellaneous/main.dialogue"), "man")
			man_in_range = false
			return
	if man_in_range == true: 
		if Global.man_talked == true:
			if Input.is_action_just_pressed("ui_accept") and Global.monster_alive == true:
				DialogueManager.show_example_dialogue_balloon(load("res://miscellaneous/main.dialogue"), "man2")
				man_in_range = false
			return
	if man_in_range == true:
		if Input.is_action_just_pressed("ui_accept") and Global.monster_alive == false:
			Global.npc2 += 1
			npc2.emit(delta)
			DialogueManager.show_example_dialogue_balloon(load("res://miscellaneous/main.dialogue"), "mann")
			Global.man_saved = true
			man_in_range = false
			return
	if nerd_in_range == true and Global.nerd_talked == false:
		if Input.is_action_just_pressed("ui_accept") and Global.monster_alive == true:
			Global.npc += 1
			npc.emit(delta)
			DialogueManager.show_example_dialogue_balloon(load("res://miscellaneous/main.dialogue"), "nerd")
			nerd_in_range = false
			return
	if nerd_in_range == true and Global.nerd_talked == true:
		if Input.is_action_just_pressed("ui_accept") and Global.monster_alive == true:
			Global.npc += 1
			npc.emit(delta)
			DialogueManager.show_example_dialogue_balloon(load("res://miscellaneous/main.dialogue"), "nerd2")
			nerd_in_range = false
			return
	if nerd_in_range == true:
		if Input.is_action_just_pressed("ui_accept") and Global.monster_alive == false:
			Global.npc2 += 1
			npc2.emit(delta)
			DialogueManager.show_example_dialogue_balloon(load("res://miscellaneous/main.dialogue"), "olivia")
			Global.olivia_saved = true
			nerd_in_range = false
			return
	
	if health <= 0: #death
		player_alive = false
		health = 0
		print("Player died")
		position.x = 1289
		position.y = 323
		$Respawn.emitting = true #plays respawn particles
		$Hit.emitting = false #can't play hit particles
		player_alive = true
		health = 100
		
func player_movement(_delta): #player movement
	if Global.current_scene == "game_level" and $Respawn.emitting == false: #doesn't let you move when respawn particles are playing
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
			velocity.x = 0
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
		$Hit.emitting = true #plays hit particles
		enemy_attack_cooldown = false
		$Enemy_Attack_Cooldown.start()
		print(health)
	
func monster_attack(): #when the monster attacks
	if monster_inattack_range and monster_attack_cooldown == true:
		health = health - 20 #gets hit
		$Hit.emitting = true #plays hit particles
		monster_attack_cooldown = false
		$Monster_Attack_Cooldown.start()
		print(health)

func attack(): #attack animations
	var dir = current_dir
	
	if Input.is_action_just_pressed("attack") and Global.in_dungeon == true: #can only atk if in dungeon
		Global.player_cur_attack = true
		attack_ip = true
		if dir == "right":
			$AnimatedSprite2D.flip_h = true
			$AnimatedSprite2D.play("side_attack")
			$atk.play()
			$Deal_attack_timer.start()
		if dir == "left":
			$AnimatedSprite2D.flip_h = false
			$AnimatedSprite2D.play("side_attack")
			$atk.play()
			$Deal_attack_timer.start()
		if dir == "up":
			$AnimatedSprite2D.play("back_attack")
			$atk.play()
			$Deal_attack_timer.start()
		if dir == "down":
			$AnimatedSprite2D.play("front_attack")
			$atk.play()
			$Deal_attack_timer.start()

func _on_deal_attack_timer_timeout(): #player atk cooldown
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

func _on_enemy_attack_cooldown_timeout():
	enemy_attack_cooldown = true

func _on_monster_attack_cooldown_timeout():
	monster_attack_cooldown = true

func _on_collectables_area_entered(area):#collecting the health potions
	var heal = $hp
	if area.has_method("collect"):
		area.collect()
		if health < 100:
			health += 20
			$Healthpotion.emitting = true #plays the potion particles
			heal.play()
			print(health)
			if health > 100:
				health = 100
				print(health)
		if health <= 0:
			health = 0
			print(health)


