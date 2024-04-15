extends AudioStreamPlayer

@onready var song_list = [
	preload("res://media/music/Song-4.wav"),
	preload("res://media/music/Song-1.wav"),
	preload("res://media/music/Song-2.wav"),
	preload("res://media/music/Song-3.wav"),
	preload("res://media/music/Song-5.wav"),
]

var current_song = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	volume_db = -35
	stream = song_list[current_song]
	play()


func _on_finished():
	current_song = ( current_song + 1 ) % song_list.size()
	stream = song_list[current_song]
	play()

func _notification(what):
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		stop()
		get_tree().quit() # default behavior
