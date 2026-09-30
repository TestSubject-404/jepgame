extends Node2D

var test: bool = true


func _on_area_2d_body_entered(body: Node2D) -> void:
	print("test")
	get_tree().change_scene_to_file("res://Assets/Scenes/Lvls/Lvl1/LVL2.tscn")
