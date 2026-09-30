extends Control

func _ready():
	var button = Button.new()
	button.position.x = 500.0
	button.position.y = 50.0
	button.scale.x = 3.694
	button.scale.y = 3.694
	button.icon = ResourceLoader.load("res://Assets/Sprites/earthmenu.png")
	button.pressed.connect(_button_pressed)
	add_child(button)

func _button_pressed() -> void:
	get_tree().change_scene_to_file("res://Assets/Scenes/Lvls/Lvl1/LVL1.tscn")
