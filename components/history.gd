extends Control

var display

# Called when the node enters the scene tree for the first time.
func _ready():
	display = get_node('./VBoxContainer/HistoryDisplay')
	for entry in PersistedVars.attempts:
		display.append_text(entry)

func add_entry(demon, ingredients, outcome):
	var entry = "[left]Summoning [b]%s[/b][/left]\n [center]- " % demon.to_pascal_case()
	for i in range(0, ingredients.size() - 1):
		entry += "[b]%s[/b], " % ingredients[i]
	
	if ingredients.size() > 1:
		entry += "and "
	entry += "[b]%s[/b] - %s[/center]\n" % [ingredients[-1], outcome]
	
	# Save and display
	PersistedVars.attempts.append(entry)
	display.append_text(entry)

func _on_close_button_pressed():
	hide()
