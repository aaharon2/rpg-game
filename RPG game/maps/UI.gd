extends CanvasLayer

@onready var q1 = $Quest1
@onready var q2 = $Quest2
@onready var q3 = $Quest3

func _ready():
	q1.show()
	q2.hide()
	q3.hide()

func _process(_delta):
	if Global.interacted == true:
		q1.hide()
		q2.show()
		q3.hide()
	if Global.nerd_talked == true:
		q1.hide()
		q2.hide()
		q3.show()
	if Global.monster_alive == false:
		q1.hide()
		q2.show()
		q3.hide()
