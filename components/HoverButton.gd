extends Button

@export var hover_text = ""
@export var list_text = ""

func _ready():
	set_text(list_text)

func _on_focused():
	set_text(hover_text)

func _on_unfocused():
	set_text(list_text)
