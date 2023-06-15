extends Node2D


func _input(event):
	if event.is_action_pressed("Inv"):
		if self.position.x == -200:
			get_node("Anim").play("transIn")
		elif self.position.x == -8:
			get_node("Anim").play("transOut")
