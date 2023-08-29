extends AnimatableBody2D

var player_in_range = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var anim = $AnimatedSprite2D
	if player_in_range == true:
		$F.show()
		if Input.is_action_just_pressed("openchest") and $AnimatedSprite2D.animation == "close":
			anim.play("open")
			$"Key Obtained".show()
			$Timer.start()
			$"Key Obtained".hide()
		elif Input.is_action_just_pressed("openchest") and $AnimatedSprite2D.animation == "open":
			anim.play("close")
	elif player_in_range == false:
		$F.hide()


func _on_area_2d_body_entered(body):
	if body.has_method("player"):
		player_in_range = true


func _on_area_2d_body_exited(body):
	if body.has_method("player"):
		player_in_range = false


func _on_timer_timeout():
	$"Key Obtained".show()
