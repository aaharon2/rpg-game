extends Node

var fancy_lady_talked = false
var emo_teen_talked = false
var alphy_talk = false #while talking
var alphy_talked = false #finished talking
var fauna_talked = false
var mother_talked = false
var man_talked = false
var nerd_talked = false
var town_saved = false
var merida_saved = false
var alphy_saved = false
var fauna_saved = false
var mother_saved = false
var man_saved = false
var olivia_saved = false
var npcs_talked = true
var npcs_saved = false

var current_scene = "game_level"

var player_cur_attack = false #for when the player atk anim is on
var has_key = false
var enemy_alive = true
var monster_alive = true
var in_dungeon = false

func _ready():
	if merida_saved and alphy_saved and fauna_saved and mother_saved and man_saved and olivia_saved == true:
		npcs_saved = true
		get_tree().change_scene_to_file("res://maps/game_completed")
	if fancy_lady_talked and alphy_talked and fauna_talked and mother_talked and man_talked and nerd_talked == true:
		npcs_talked = true
