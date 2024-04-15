extends Control

var rule_boxes = []

func _ready():
	print(get_tree())
	for i in range(1, 6):
		rule_boxes.append(get_node("./GridContainer/Rule%d" % i))
	rule_boxes[0].text = PersistedVars.rule_1
	rule_boxes[1].text = PersistedVars.rule_2
	rule_boxes[2].text = PersistedVars.rule_3
	rule_boxes[3].text = PersistedVars.rule_4
	rule_boxes[4].text = PersistedVars.rule_5

func _on_close_pressed():
	hide()

func _on_rule_text_changed(new_text, rule_num):
	match rule_num:
		1:
			PersistedVars.rule_1 = rule_boxes[rule_num-1].text
		2:
			PersistedVars.rule_2 = rule_boxes[rule_num-1].text
		3:
			PersistedVars.rule_3 = rule_boxes[rule_num-1].text
		4:
			PersistedVars.rule_4 = rule_boxes[rule_num-1].text
		5:
			PersistedVars.rule_5 = rule_boxes[rule_num-1].text
