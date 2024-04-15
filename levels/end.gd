extends Control

@onready var dialogue_box = $Dialogue

func _ready():
	var dial = "[center]You successfully worked out the rules of summoning, and it only took %d summoners.[/center]" % PersistedVars.deaths
	dialogue_box.parse_bbcode(dial)

func _input(event):
	if event.is_action_pressed("select"):
		_step_dialogue()

func _step_dialogue():
		get_tree().change_scene_to_file("res://levels/menu.tscn")
