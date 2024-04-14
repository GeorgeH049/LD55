extends Control

const Level = preload("res://utils/level.gd")

var level
var ingredients_chosen = []
var required_choices
var submit_button

# Called when the node enters the scene tree for the first time.
func _ready():
	level = Level.new()
	required_choices = get_tree().get_nodes_in_group("RequiredChoice")
	submit_button = get_node("./Foreground/SubmitButton")
	submit_button.disabled = true

func _on_ingredient_selected(index):
	var ingr_name = level.get_ingredient_by_index(index)
	level.get_image_name_by_ingredient_name(ingr_name)

func _submit_button_ready():
	# Handle enabling the submit button if all choices are filled
	for choice in required_choices:
		if choice.get_selected_id() == -1:
			submit_button.disabled = true
			return
	submit_button.disabled = false

func _on_submit_button_pressed():
	
	# Evaluate the rules on the chosen options
	level.evaluate()
