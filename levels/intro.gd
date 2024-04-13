extends Control

@onready var dialogue_box = $Dialogue

const dialogue_lines = [
	"[center][i]\"Knowledge is power.\"[/i][/center]\n[right]- Francis Bacon[/right]",
	"[center]Occult knowledge, like all other knowledge, is revealed to us by trial and error.[/center]",
	"[center]Your role is to maximise trial, and minimise error.[/center]",
	"[center]Should you fail, your apprentice will follow on, learning from your mistakes...[/center]",
	"[center]... in theory, at least.[/center]",
]

var current_line = 0

func _ready():
	dialogue_box.parse_bbcode(dialogue_lines[current_line])

func _input(event):
	if event.is_action_pressed("select"):
		_step_dialogue()

func _step_dialogue():
	current_line += 1
	if current_line < dialogue_lines.size():
		dialogue_box.parse_bbcode(dialogue_lines[current_line])
	else:
		get_tree().change_scene_to_file("res://levels/tutorial.tscn")
