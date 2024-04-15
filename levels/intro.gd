extends Control

@onready var dialogue_box = $Dialogue

const dialogue_lines = [
	"[center][i]\"Knowledge is power.\"[/i][/center]\n[right]- Francis Bacon[/right]",
	"[center]Occult knowledge, like all other knowledge, is revealed to us by trial and error.[/center]",
	"[center]Your task is to identify the rules of summoning, and prove your knowledge by documenting the rituals of summoning for 15 extraplanar entities.[/center]",
	"[center]Should you fail in this task, you will be brutally ripped apart, then replaced by your apprentice. They will learn from your mistakes...[/center]",
	"[center]... in theory, at least.[/center]",
	"[center][i][color=#88ff88]In this game, you will have to work out the rules. You will be given your own rulebook - use it to keep things straight. The History button will show you all your attempts to summon creatures. Good luck![/color][/i][/center]",
	"[center][i][color=#88ff88](The incomplete red-and-grey texture is a placeholder, due to lack of completion on the art.)[/color][/i][/center]",
]

var current_line = 0

func _ready():
	PersistedVars.deaths = 0
	dialogue_box.parse_bbcode(dialogue_lines[current_line])

func _input(event):
	if event.is_action_pressed("select"):
		_step_dialogue()

func _step_dialogue():
	current_line += 1
	if current_line < dialogue_lines.size():
		dialogue_box.parse_bbcode(dialogue_lines[current_line])
	else:
		get_tree().change_scene_to_file("res://levels/level_1.tscn")
