extends Control

@export var demon_name = ""
@export var num_components = 1
@export var next_level = "res://levels/menu.tscn"

const Level = preload("res://utils/level_helper.gd")

var sound_player
var level
var history
var ingredients_chosen = []
var required_choices
var submit_button

# Called when the node enters the scene tree for the first time.
func _ready():
	sound_player = get_node("SoundFeedbackPlayer")
	level = Level.new()
	history = get_node("./Foreground/History")
	required_choices = get_tree().get_nodes_in_group("RequiredChoice")
	submit_button = get_node("./Foreground/SubmitButton")
	submit_button.disabled = true
	
	get_node("./Foreground/DemonName").text=demon_name.to_pascal_case()
	
	var ingr_images = get_tree().get_nodes_in_group("IngredientImage")
	for img in ingr_images:
		img.texture = load("res://media/ingredients/_blank.png")
	for i in range(num_components):
		ingredients_chosen.append("")

func _on_ingredient_selected(index, ingr_number):
	var ingr_name = level.get_ingredient_by_index(index)
	var img_path = level.get_image_name_by_ingredient_name(ingr_name)
	get_node("./Background/Ingredient%d" % ingr_number).texture = load(img_path)
	
	ingredients_chosen[ingr_number] = ingr_name
	_enable_submit_button_if_ready()

func _enable_submit_button_if_ready():
	# Handle enabling the submit button if all choices are filled
	for choice in required_choices:
		if choice.get_selected_id() == -1:
			submit_button.disabled = true
			submit_button.get_child(0).hide()
			return
	submit_button.disabled = false
	submit_button.get_child(0).show()

func _on_submit_button_pressed():
	# Evaluate the rules on the chosen options
	if level.evaluate(demon_name, ingredients_chosen, num_components):
		history.add_entry(demon_name, ingredients_chosen, "[color=#00aa00]Success[/color]")
		sound_player.play_sound("success")
		await get_tree().create_timer(1.8).timeout
		get_tree().change_scene_to_file(next_level)
	else:
		history.add_entry(demon_name, ingredients_chosen, "[color=#aa0000]Fail[/color]")
		PersistedVars.deaths += 1
		get_node("Foreground/FailScreen").show()
		sound_player.play_sound("failure")

func _on_rules_button_pressed():
	get_node("Foreground/Rulebook").show()

func _on_history_button_pressed():
	get_node("Foreground/History").show()
