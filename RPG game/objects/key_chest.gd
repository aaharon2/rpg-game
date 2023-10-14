extends AnimatableBody2D

var player_in_range = false
var chest_open = false
var chest_closed = false
var shown = false
var opened = false
var press_f = false

func _ready():
	pass

func _process(delta):
	var anim = $AnimatedSprite2D
	if player_in_range == true:
		
		if not $"Key Obtained".is_visible():
			$F.show()
		
		if chest_open:
			if Input.is_action_just_pressed("openchest"): #when f is pressed and the chest is open, close anim will play
				anim.play("close")
				chest_open = false
				chest_closed = true
				Global.has_key = true
				$"Key Obtained".hide()
		elif chest_closed:
			if Input.is_action_just_pressed("openchest"): #when f is pressed and the chest is closed, open anim will play
				anim.play("open")
				chest_open = true
				chest_closed = false
				Global.has_key = true
				$"Key Obtained".hide()
		else:
			if Input.is_action_just_pressed("openchest"): #when f is pressed and the chest is closed, open anim will play
				anim.play("open")
				chest_open = true
				chest_closed = false
				show_text() #key obtained will show
				opened = true
				Global.has_key = true
				if shown == true:
					$F.hide()
	if player_in_range == false:
		$F.hide()

func show_text():
	var shown = true
	$"Key Obtained".show()
	
func _on_area_2d_body_entered(body):
	if body.has_method("player"):
		player_in_range = true

func _on_area_2d_body_exited(body):
	if body.has_method("player"):
		player_in_range = false

func _on_timer_timeout():
	$"Key Obtained".hide()
