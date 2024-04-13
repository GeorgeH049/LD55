# Base Level script. This defines the possible ingredients and demons, to avoid them being redefined elsewhere.

extends Node

class_name Level
const NUM_RULES = 2

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

const DEMONS = [
	"abb",
	"aco",
	"adz",
	"aff",
	"aga",
	"ail",
	"ake",
	"ald",
	"alt",
	"amb",
	"app",
	"arc",
	"arl",
	"art",
	"ate",
	"ath",
	"auz",
	"avi",
	"ayp",
	"bat",
	"ber",
	"blo",
	"bon",
	"bri",
	"cat",
	"cha",
	"cin",
	"cla",
	"cop",
	"cor",
	"den",
	"dia",
	"dof",
	"dra",
	"dus",
	"ear",
	"eco",
	"eed",
	"egu",
	"eld",
	"ell",
	"eme",
	"ent",
	"eof",
	"epe",
	"era",
	"erc",
	"ere",
	"erp",
	"ers",
	"ewt",
	"fea",
	"fel",
	"fil",
	"fis",
	"fra",
	"gat",
	"gof",
	"hai",
	"ham",
	"han",
	"hea",
	"het",
	"hol",
	"hos",
	"hym",
	"ial",
	"iam",
	"idi",
	"ilv",
	"ime",
	"ing",
	"ins",
	"iri",
	"iro",
	"irr",
	"ist",
	"ite",
	"lar",
	"las",
	"lec",
	"led",
	"leg",
	"leo",
	"let",
	"lim",
	"lit",
	"lly",
	"lof",
	"loo",
	"mer",
	"mon",
	"mos",
	"mro",
	"ned",
	"nof",
	"nyx",
	"oal",
	"ock",
	"oco",
	"ode",
	"off",
	"oli",
	"ond",
	"ony",
	"ood",
	"oon",
	"opa",
	"opp",
	"ore",
	"orn",
	"oto",
	"ott",
	"owd",
	"par",
	"paz",
	"per",
	"phi",
	"pho",
	"pil",
	"ple",
	"pow",
	"pri",
	"qui",
	"rig",
	"rof",
	"ron",
	"ror",
	"row",
	"rry",
	"rub",
	"rys",
	"sal",
	"sap",
	"sha",
	"sid",
	"sil",
	"sle",
	"sof",
	"sol",
	"spi",
	"squ",
	"sto",
	"tac",
	"tai",
	"ten",
	"ter",
	"ton",
	"tro",
	"uby",
	"uid",
	"ull",
	"ume",
	"ure",
	"uro",
	"ury",
	"ust",
	"uze",
	"ver",
	"via",
	"whe",
	"ybe",
	"yeo",
	"yme",
]

func evaluate():
	# Checks whether the level data meets all the rules, returns boolean of this.
	pass

func get_ingredients(category:int):
	# Returns the ingredients in that category.
	return INGREDIENTS[category]

func get_a_demon():
	# Gets a random demon from the list of possibilities.
	return DEMONS[randi() % DEMONS.size()]

func _check_if_contains_name(demon, ingredients):
	# Checks whether any ingredient includes the demon's name as a substring.
	# 0 is a negative response (i.e. check fails)
	for ingredient in ingredients:
		if ingredient.to_lower().format(["", "", ""], " ").contains(demon):
			return 0
	return 1

func _check_if_same_category(ingredients):
	# Checks whether any ingredients start with the same letter
	# 0 is a negative response (i.e. check fails)
	var starts = []
	for ingredient in ingredients:
		if ingredient[0] in starts:
			return 0
		starts.append(ingredient[0])
	return 1

func _check_if_same_start(ingredients):
	# Checks whether any ingredients start with the same letter
	# 0 is a negative response (i.e. check fails)
	var starts = []
	for ingredient in ingredients:
		if ingredient[0] in starts:
			return 0
		starts.append(ingredient[0])
	return 1
