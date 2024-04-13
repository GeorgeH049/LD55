extends Control

const Level = preload("res://utils/level.gd")

# Called when the node enters the scene tree for the first time.
func _ready():
	var level = Level.new()
	print(level._check_if_contains_name("gor", ["f or", "F or"]))


func _on_submit_button_pressed():
	pass
