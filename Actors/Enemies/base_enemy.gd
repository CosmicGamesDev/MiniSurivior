extends CharacterBody2D
class_name  BaseEnemy

@export var target : Node2D
@export var base_speed := 10
@export var base_health := 10
@onready var sprite_2d = $Sprite2D

func _ready():
	target = get_tree().get_first_node_in_group("player")


func _physics_process(delta):
	move_to_player()

func move_to_player():
	if target != null:
		velocity = global_position.direction_to(target.global_position).normalized() * base_speed
	if velocity.x > 0:
		sprite_2d.flip_h = false
	else:
		sprite_2d.flip_h = true
	move_and_slide()
