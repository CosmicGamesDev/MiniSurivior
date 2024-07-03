extends Node2D
class_name SkillManager

var skill_enemies_in_range = []
@export var skill_scene = preload("res://Skills/axe_skill.tscn")
var projectile_layer
var player : Node2D

func _ready():
	projectile_layer = get_tree().get_first_node_in_group("projectile_layer")
	player = get_tree().get_first_node_in_group("player")

func _on_skill_range_area_entered(area):
	skill_enemies_in_range.push_back(area)



func _on_skill_range_area_exited(area):
	skill_enemies_in_range.erase(area)


func find_closest_enemy():
	var distance = null
	var closest_enemy = null
	for enemy in skill_enemies_in_range:
		var current_enemy_distance = global_position.distance_to(enemy.global_position)
		if distance == null:
			distance = current_enemy_distance
			closest_enemy = enemy
		if distance > current_enemy_distance:
			distance = current_enemy_distance
			closest_enemy = enemy
	return closest_enemy


func _on_skill_timer_timeout():
	if skill_enemies_in_range.size() > 0:
		var target_enemy = find_closest_enemy() as Node2D
		var skill = skill_scene.instantiate() as Node2D
		print(projectile_layer)
		projectile_layer.add_child(skill)
		var normal_to_enemy = player.global_position.direction_to(target_enemy.global_position).normalized()
		skill.global_position = target_enemy.global_position - (normal_to_enemy * Vector2(8,8))
		skill.rotation = player.get_angle_to(target_enemy.global_position)
