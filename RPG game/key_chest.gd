extends AnimatableBody2D

var player_in_range = false
var chest_open = false
var chest_closed = false
var shown = false
var opened = false
var obtained_key = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var anim = $AnimatedSprite2D
	if player_in_range == true:
		$F.show()
		if chest_open:
			if Input.is_action_just_pressed("openchest"):
				anim.play("close")
				chest_open = false
				chest_closed = true
				obtained_key = true
				$"Key Obtained".hide()
		elif chest_closed:
			if Input.is_action_just_pressed("openchest"):
				anim.play("open")
				chest_open = true
				chest_closed = false
				$"Key Obtained".hide()
		else:
			if Input.is_action_just_pressed("openchest"):
				anim.play("open")
				chest_open = true
				chest_closed = false
				show_text()
				opened = true
				obtained_key = true
				if shown == true:
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
