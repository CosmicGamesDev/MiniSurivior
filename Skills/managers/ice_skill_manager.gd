extends SkillManager


func _process(delta):
	rotation_degrees += 1
	if rotation_degrees > 360:
		rotation_degrees = 0

func _on_skill_timer_timeout():
	if skill_enemies_in_range.size() > 0:
		var ice = skill_scene.instantiate() as Node2D
		projectile_layer.add_child(ice)
		ice.direction = Vector2.UP.rotated(rotation)
		ice.rotation_degrees = rotation_degrees
		ice.global_position = global_position
