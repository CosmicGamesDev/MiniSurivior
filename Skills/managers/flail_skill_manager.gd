extends SkillManager


func _on_skill_timer_timeout():
	if skill_enemies_in_range.size() > 0:
		var target_enemy = find_closest_enemy() as Node2D
		var flail = skill_scene.instantiate() as Node2D
		projectile_layer.add_child(flail)
		var normal_to_enemy = player.global_position.direction_to(target_enemy.global_position).normalized()
		flail.global_position = global_position
		flail.target_enemy_direction = normal_to_enemy
