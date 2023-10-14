extends Control

@onready var menu = $Menu
@onready var options = $Options
@onready var video = $Video
@onready var audio = $Audio
@onready var controls = $Controls

func _ready():
	show()

func toggle():
	visible = !visible
	get_tree().paused = visible

func _on_play_pressed():
	get_tree().change_scene_to_file("res://maps/game_level.tscn")

func show_and_hide(first, second):
	first.show()
	second.hide()

func _on_options_pressed():
	show_and_hide(options, menu) #shows options and hides menu
	
func _on_controls_pressed():
	show_and_hide(controls, menu)
	
func _on_back_from_controls_pressed():
	show_and_hide(menu, controls)

func _on_exit_pressed():
	get_tree().quit()

func _on_video_pressed():
	show_and_hide(video, options)

func _on_audio_pressed():
	show_and_hide(audio, options)

func _on_back_from_options_pressed():
	show_and_hide(menu, options)
	
func _on_fullscreen_toggled(button_pressed):
	if button_pressed == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN) #sets fullscreen
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED) #sets windowed
		
func _on_borderless_toggled(button_pressed):
	if button_pressed == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_MAXIMIZED) #sets borederless
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED) #sets windowed

func _on_v_sync_toggled(button_pressed):
	if button_pressed == true:
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_ENABLED)
	else:
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)
		
func _on_back_from_video_pressed():
	show_and_hide(options, video)
	
func _on_master_value_changed(value):
	volume(0, value)
	
func volume(bus_index, value):
	AudioServer.set_bus_volume_db(bus_index, value)

func _on_music_value_changed(value):
	volume(1, value)
	
func _on_sound_fx_value_changed(value):
	volume(2, value)

func _on_back_from_audio_pressed():
	show_and_hide(options, audio)
