# Base Level script. This defines the possible ingredients and demons, to avoid them being redefined elsewhere.

extends Node

class_name Level
const NUM_RULES = 4

const INGREDIENTS = {
	1: [	# Plant
		"Acorn",
		"Apple Core",
		"Holly Berry",
		"Hot Pepper",
		"Moss of Phosphor",
		"Root of Mandrake",
		"Seed of Legume",
		"Shamrock",	
		"Sprig of Mistletoe",
		"Thyme",
		"Wheat Chaff",
	],
	2: [	# Animal
		"Bone Dust",
		"Blood Vial",
		"Cocoon of Caterpillar",
		"Cured Leather",
		"Eye of Newt",
		"Feather of Crow",
		"Foot of Rabbit",
		"Fur of Bat",
		"Hair of Bull",
		"Heart of Lamb",
		"Tail of Fish",
		"Tentacle of Squid",
		"Trotter of Pig",
	],
	3: [	# Gem
		"Agate",
		"Amber",
		"Chrysolite",
		"Diamond",
		"Emerald",
		"Jacinth",
		"Onyx",
		"Pearl",
		"Ruby",
		"Sapphire",
		"Topaz",
	],
	4: [	#Mineral
		"Brimstone",
		"Coal",
		"Copper Shavings",
		"Feldspar",
		"Iron Filings",
		"Lime",
		"Mercury",
		"Obsidian",
		"Powdered Silver",
		"Salt",
	],
	5: [	# Object
		"Clay Pot",
		"Distilled Spirits",
		"Gauze",
		"Glass Lens",
		"Golden Bell",
		"Hand Mirror",
		"Iron Adze",
		"Lodestone",
		"Parchment",
		"Silver Pins",
		"Whetstone",
	],
}

const INGREDIENT_DROPDOWN_IDENTIFIER = {
	1: "Acorn",
	2: "Apple Core",
	3: "Holly Berry",
	4: "Hot Pepper",
	5: "Moss of Phosphor",
	6: "Root of Mandrake",
	7: "Seed of Legume",
	8: "Shamrock",	
	9: "Sprig of Mistletoe",
	10: "Thyme",
	11: "Wheat Chaff",
	13: "Bone Dust",
	14: "Blood Vial",
	15: "Cocoon of Caterpillar",
	16: "Cured Leather",
	17: "Eye of Newt",
	18: "Feather of Crow",
	19: "Foot of Rabbit",
	20: "Fur of Bat",
	21: "Hair of Bull",
	22: "Heart of Lamb",
	23: "Tail of Fish",
	24: "Tentacle of Squid",
	25: "Trotter of Pig",
	27: "Agate",
	28: "Amber",
	29: "Chrysolite",
	30: "Diamond",
	31: "Emerald",
	32: "Jacinth",
	33: "Onyx",
	34: "Pearl",
	35: "Ruby",
	36: "Sapphire",
	37: "Topaz",
	39: "Brimstone",
	40: "Coal",
	41: "Copper Shavings",
	42: "Feldspar",
	43: "Iron Filings",
	44: "Lime",
	45: "Mercury",
	46: "Obsidian",
	47: "Powdered Silver",
	48: "Salt",
	50: "Clay Pot",
	51: "Distilled Spirits",
	52: "Gauze",
	53: "Glass Lens",
	54: "Golden Bell",
	55: "Hand Mirror",
	56: "Iron Adze",
	57: "Lodestone",
	58: "Parchment",
	59: "Silver Pins",
	60: "Whetstone",
}

func evaluate(demon, ingredients, num_components):
	# Checks whether the level data meets all the rules, returns boolean of this.
	return NUM_RULES == _check_first_contains_name(demon, ingredients) + \
	_check_if_same_category(ingredients, num_components) + \
	_check_starts(ingredients) 

func get_ingredients(category:int):
	# Returns the ingredients in that category.
	return INGREDIENTS[category]

func get_ingredient_by_index(index:int):
	# Gets a single ingredient by it's index in the dropdown.
	return INGREDIENT_DROPDOWN_IDENTIFIER[index]

func get_image_name_by_ingredient_name(name:String):
	var img = "res://media/ingredients/%s.png" % name.replace(" ", "_").to_lower()
	if FileAccess.file_exists(img):
		return img
	return "res://media/ingredients/default.png"

func _check_first_contains_name(demon, ingredients):
	# Checks whether any ingredient includes the demon's name as a substring.
	# 0 is a negative response (i.e. check fails)
	if ingredients[0].to_lower().replace(" ", "").contains(demon):
		return 1
	return 0

func _check_if_same_category(ingredients, num_components):
	# Checks whether any ingredients start with the same letter
	# 0 is a negative response (i.e. check fails)
	var categories = []
	for ingredient in ingredients:
		for i in range(1,6):
			if ingredient in INGREDIENTS[i]:
				if i in categories:
					if num_components != 4:
						return 0
					else:
						if categories[-1] == i:
							return 0
						if categories.size() == 3 and categories[0] == i:
							return 0
				categories.append(i)
	return 1

func _check_starts(ingredients):
	# Checks whether any ingredients start with the same letter
	# 0 is a negative response (i.e. check fails)
	var starts = []
	for ingredient in ingredients:
		if ingredient[0] in starts:
			return 0
		starts.append(ingredient[0])

	# Checks that ingredient start letters increase with the index
	var cpy = starts.duplicate(true)
	cpy.sort()
	if cpy != starts:
		return 1
	return 2
