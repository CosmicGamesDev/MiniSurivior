extends Button

@export var scene_path = "res://world.tscn"

func _on_pressed():
	get_tree().change_scene_to_file(scene_path)
