extends CanvasLayer

@onready var q1 = $Quest1
@onready var q2 = $Quest2
@onready var q3 = $Quest3


func _ready():
	q1.show()
	q2.hide()
	q3.hide()
	$npc.hide()

func _process(_delta):
	if Global.interacted == true:
		q1.hide()
		q2.show()
		q3.hide()
		$npc.show()
	if Global.npc == 6:
		Global.npc = 0
		q1.hide()
		q2.hide()
		q3.show()
		$npc.hide()
	if Global.monster_alive == false:
		q1.hide()
		q2.show()
		q3.hide()
		Global.npc = 0
		$npc.show()

func npcs_talked(_npc):
	$npc.text = "[" + str(Global.npc) + "/6]"
	
