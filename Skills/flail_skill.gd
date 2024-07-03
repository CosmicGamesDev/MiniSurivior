extends Node2D

const MAX_RADIUS = 100
var base_rotation = Vector2.RIGHT
var target_enemy_direction = Vector2.RIGHT
var speed = .5

func _ready():
	base_rotation = Vector2.RIGHT.rotated(randf_range(0, TAU))
	var tween = create_tween()
	tween.tween_method(spin_around, 0.0, 1.5, 1.5)
	tween.tween_method(fly_toward, 1.5, 2.5, 2.5)
	tween.tween_callback(queue_free)

func spin_around(rotations: float):
	var percent = rotations / 2
	var current_radius = percent * MAX_RADIUS
	var current_direction = base_rotation.rotated(rotations * TAU)
	
	var player = get_tree().get_first_node_in_group("player")
	if player == null:
		return
	global_position = player.global_position + (current_direction * current_radius)

func fly_toward(time: float):
	position = position + (speed * target_enemy_direction)/time
