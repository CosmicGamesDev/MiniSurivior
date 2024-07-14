extends Node2D

@export var enemy_scene : PackedScene
@export var enemy_layer : Node2D
var viewport_screen := Vector2(100,0)
var player : Node2D

var enemy_scenes = [
	"res://Actors/Enemies/skeleton_enemy.tscn",
	"res://Actors/Enemies/minotaur_enemy.tscn",
	"res://Actors/Enemies/giant_enemy.tscn",
	"res://Actors/Enemies/bear_enemy.tscn"
]


func _ready():
	player = get_tree().get_first_node_in_group("player")
	viewport_screen = get_viewport_rect().size

func _on_timer_timeout():
	var enemy = load(enemy_scenes.pick_random()).instantiate()
	enemy_layer.add_child(enemy)
	enemy.global_position = player.global_position + get_position_around_player()

func get_position_around_player():
	var screen_edge = randi_range(1,4)
	if screen_edge == 1:
		return Vector2(-(viewport_screen.x/2 + 16),randf_range(-viewport_screen.y/2,viewport_screen.y/2))
	elif screen_edge == 2:
		return Vector2(viewport_screen.x/2 + 16,randf_range(-viewport_screen.y/2,viewport_screen.y/2))
	elif  screen_edge == 3:
		return Vector2(randf_range(-viewport_screen.x/2,viewport_screen.x/2), -(viewport_screen.y/2 + 16))
	elif screen_edge == 4:
		return Vector2(randf_range(-viewport_screen.x/2,viewport_screen.x/2),(viewport_screen.y/2 + 16))
