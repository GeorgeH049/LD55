extends OptionButton

const Level = preload("res://utils/level.gd")

var level

# Called when the node enters the scene tree for the first time.
func _ready():
	level = Level.new()
	_load_ingredient_options()
	select(-1)
	

func _load_ingredient_options():
	add_separator("Plant")
	for item in level.get_ingredients(1):
		add_item(item)
	add_separator("Animal")
	for item in level.get_ingredients(2):
		add_item(item)
	add_separator("Gem")
	for item in level.get_ingredients(3):
		add_item(item)
	add_separator("Mineral")
	for item in level.get_ingredients(4):
		add_item(item)
	add_separator("Object")
	for item in level.get_ingredients(5):
		add_item(item)
