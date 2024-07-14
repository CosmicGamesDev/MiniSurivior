extends Area2D

@export var damage = 10



func _on_area_entered(area):
	if area.is_in_group("hurt_box"):
		area.parent.damage(damage)
