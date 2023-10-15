extends Node

var fancy_lady_talked = true
var emo_teen_talked = true
var alphy_talk = false #while talking
var alphy_talked = true #finished talking
var fauna_talked = true
var mother_talked = true
var man_talked = true
var nerd_talked = true

var merida_saved = false
var alphy_saved = false
var fauna_saved = false
var mother_saved = false
var man_saved = false
var olivia_saved = false

var npcs_saved = false

var current_scene = "game_level"

var player_cur_attack = false #for when the player atk anim is on
var has_key = false
var enemy_alive = true
var monster_alive = false
var in_dungeon = false

func _process(delta):
	if merida_saved == true and alphy_saved == true and fauna_saved == true and mother_saved == true and man_saved == true and olivia_saved == true:
		print("saved")
		npcs_saved = true
