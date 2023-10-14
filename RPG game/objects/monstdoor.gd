extends AnimatableBody2D

var player_in_range = false
var door_open = false

func _ready():
	pass # Replace with function body.

func _process(_delta):
	var anim = $AnimatedSprite2D
	if player_in_range == true and Global.has_key == true:
		if door_open:
			if Input.is_action_just_pressed("ui_accept"): #when f is pressed and the door is open, close anim will play
				anim.play("close")
				$CollisionShape2D.disabled = false
				door_open = false
		else:
			if Input.is_action_just_pressed("ui_accept"): #when f is pressed and the door is closed, open anim will play
				anim.play("open")
				$CollisionShape2D.disabled = true
				door_open = true
	if player_in_range == true and Input.is_action_just_pressed("ui_accept") and Global.has_key == false:
		$Needkey.show() #shows the text when player doesnt have the key
	elif player_in_range == false and Global.has_key == false:
		$Needkey.hide() #doesn't show the text when player has the key

func _on_area_2d_body_entered(body):
	if body.has_method("player"):
		player_in_range = true
		
func _on_area_2d_body_exited(body):
	if body.has_method("player"):
		player_in_range = false
