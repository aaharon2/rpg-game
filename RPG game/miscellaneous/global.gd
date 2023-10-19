extends Node

var fancy_lady_talked = false
var emo_teen_talked = false
var alphy_talk = false #while talking
var alphy_talked = false #finished talking
var fauna_talked = false
var mother_talked = false
var twins_talked = false
var man_talked = false
var nerd_talked = false

var merida_saved = false
var alphy_saved = false
var fauna_saved = false
var mother_saved = false
var man_saved = false
var olivia_saved = false

var npcs_saved = false
var npc = 0

var current_scene = "game_level"

var player_cur_attack = false #for when the player atk anim is on
var has_key = false
var enemy_alive = true
var monster_alive = true
var in_dungeon = false
var interacted = false

func _process(_delta):
	if merida_saved == true and alphy_saved == true and fauna_saved == true and mother_saved == true and man_saved == true and olivia_saved == true:
		print("saved")
		npcs_saved = true
		
