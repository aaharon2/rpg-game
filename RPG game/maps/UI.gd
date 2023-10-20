extends CanvasLayer

@onready var q1 = $Quest1
@onready var q2 = $Quest2
@onready var q3 = $Quest3


func _ready():
	q1.show()
	q2.hide()
	q3.hide()
	$npc.hide()
	$npc2.hide()

func _process(_delta):
	if Global.interacted == true:
		q1.hide()
		q2.show()
		q3.hide()
		$npc.show()
		$npc2.hide()
	if Global.npcs_talked == true:
		q1.hide()
		q2.hide()
		q3.show()
		$npc.hide()
		$npc2.hide()
	if Global.monster_alive == false:
		$npc.hide()
		q1.hide()
		q2.show()
		q3.hide()
		$npc2.show()

func npcs_talked(_npc):
	$npc.text = "[" + str(Global.npc) + "/6]"
	

func npcs2_talked(_npc):
	$npc2.text = "[" + str(Global.npc2) + "/6]"
