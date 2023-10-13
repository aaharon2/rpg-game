extends AnimatableBody2D

var player_in_range = false
var door_open = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var anim = $AnimatedSprite2D
	if player_in_range == true and Global.has_key == true:
		if door_open:
			if Input.is_action_just_pressed("ui_accept"):
				anim.play("close")
				$CollisionShape2D.disabled = false
				door_open = false
		else:
			if Input.is_action_just_pressed("ui_accept"):
				anim.play("open")
				$CollisionShape2D.disabled = true
				door_open = true
	if player_in_range == true and Input.is_action_just_pressed("ui_accept") and Global.has_key == false:
		$Needkey.show()
	elif player_in_range == false and Global.has_key == false:
		$Needkey.hide()


func _on_area_2d_body_entered(body):
	if body.has_method("player"):
		player_in_range = true
		
func _on_area_2d_body_exited(body):
	if body.has_method("player"):
		player_in_range = false
