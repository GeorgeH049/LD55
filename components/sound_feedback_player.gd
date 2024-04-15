extends AudioStreamPlayer

@onready var sounds = {
	"success": preload("res://media/music/success.wav"),
	"failure": preload("res://media/music/failure.wav"),
}

func play_sound(key:String):
	# Plays the sound associated with the key
	stream = sounds[key]
	play()
