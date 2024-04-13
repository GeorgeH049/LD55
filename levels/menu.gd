extends Control

func _ready():
	pass # Replace with function body.

# Buttons
func _on_begin_button_pressed():
	get_tree().change_scene_to_file("res://levels/intro.tscn")

func _on_quit_button_pressed():
	get_tree().root.propagate_notification(NOTIFICATION_WM_CLOSE_REQUEST)
	get_tree().quit(0)
