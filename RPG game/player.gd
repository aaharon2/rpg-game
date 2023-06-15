extends CharacterBody2D

const speed = 100
var current_dir = "none"

var cashier_in_range = false
var sign_in_range = false
 
func _read():
	$AnimatedSprite2D.play("front_idle")

func _physics_process(delta):
	if cashier_in_range == true:
		if Input.is_action_just_pressed("ui_accept"):
			DialogueManager.show_example_dialogue_balloon(load("res://dialogue/main.dialogue"), "main")
			return
	if sign_in_range == true:
		if Input.is_action_just_pressed("ui_accept"):
			DialogueManager.show_example_dialogue_balloon(load("res://dialogue/sign.dialogue"), "sign")
			return		
			
	player_movement(delta)
			
func player_movement(_delta):
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
	
	if dir == "right":
		anim.flip_h = true
		if movement == 1:
			anim.play("side_walk")
		elif movement == 0:
			anim.play("side_idle") 
	if dir == "left":
		anim.flip_h = false
		if movement == 1:
			anim.play("side_walk")
		elif movement == 0:
			anim.play("side_idle")
	if dir == "down":
		anim.flip_h = false
		if movement == 1:
			anim.play("front_walk")
		elif movement == 0:
			anim.play("front_idle")
	if dir == "up":
		anim.flip_h = false
		if movement == 1:
			anim.play("back_walk")
		elif movement == 0:
			anim.play("back_idle")

func _on_detection_area_body_entered(body):
	if body.has_method("cashier"):
		cashier_in_range = true
	if body.has_method("sign"):
		sign_in_range = true

func _on_detection_area_body_exited(body):
	if body.has_method("cashier"):
		cashier_in_range = false
	if body.has_method("sign"):
		sign_in_range = false
