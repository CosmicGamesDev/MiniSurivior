extends Node2D

var damage = 1
var direction = Vector2.UP
var speed = .05

func _physics_process(delta):
	position += direction * speed/delta
