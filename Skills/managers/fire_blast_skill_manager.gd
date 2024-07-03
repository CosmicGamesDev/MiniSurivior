extends SkillManager

func find_random_enemy():
	return skill_enemies_in_range.pick_random()

func _on_skill_timer_timeout():
	if skill_enemies_in_range.size() > 0:
		var target_enemy = find_random_enemy() as Node2D
		var fire_blast = skill_scene.instantiate() as Node2D
		projectile_layer.add_child(fire_blast)
		fire_blast.global_position = target_enemy.global_position
