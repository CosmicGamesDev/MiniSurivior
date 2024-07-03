extends SkillManager

func _ready():
	player = get_tree().get_first_node_in_group("player")
	projectile_layer = get_tree().get_first_node_in_group("projectile_layer")
	add_shock_wave()

func _on_skill_timer_timeout():
	return

func add_shock_wave():
	var shock_wave = skill_scene.instantiate()
	player.call_deferred("add_child", shock_wave)
	shock_wave.global_position = player.global_position
