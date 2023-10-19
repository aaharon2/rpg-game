extends AnimatableBody2D

var player_in_range = false
var chest_open = false

func _ready():
	pass # Replace with function body.

func _process(_delta):
	var anim = $AnimatedSprite2D
	if player_in_range == true:
		$F.show()
		if chest_open:
			if Input.is_action_just_pressed("openchest"): #when f is pressed and the chest is open, close anim will play
				anim.play("close")
				$FX.play()
				chest_open = false
		else:
			if Input.is_action_just_pressed("openchest"): #when f is pressed and the chest is closed, open anim will play
				anim.play("open")
				$FX.play()
				$Empty.show()
				chest_open = true
	elif player_in_range == false:
		$F.hide()
		$Empty.hide()

func _on_area_2d_body_entered(body):
	if body.has_method("player"):
		player_in_range = true

func _on_area_2d_body_exited(body):
	if body.has_method("player"):
		player_in_range = false
