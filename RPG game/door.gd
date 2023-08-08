extends AnimatableBody2D

var player_in_range = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	print($AnimatedSprite2D.frame)
	var anim = $AnimatedSprite2D
	if player_in_range == true:
		if Input.is_action_just_pressed("ui_accept") and $AnimatedSprite2D.animation == "close":
			anim.play("open")
			$CollisionShape2D.disabled = true
		elif Input.is_action_just_pressed("ui_accept") and $AnimatedSprite2D.animation == "open":
			anim.play("close")
			$CollisionShape2D.disabled = false


func _on_area_2d_body_entered(body):
	if body.has_method("player"):
		player_in_range = true
		
func _on_area_2d_body_exited(body):
	if body.has_method("player"):
		player_in_range = false
