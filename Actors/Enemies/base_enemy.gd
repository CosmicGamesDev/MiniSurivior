extends CharacterBody2D
class_name  BaseEnemy

@export var target : Node2D
@export var base_speed := 10
@export var base_health := 10
@onready var sprite_2d = $Sprite2D
@onready var hurt_box_component = $HurtBoxComponent
@onready var hit_label_scene = preload("res://damage_label.tscn")
var damage_layer
func _ready():
	hurt_box_component.area_entered.connect(_on_hurt_box_component_area_entered)
	target = get_tree().get_first_node_in_group("player")
	damage_layer=  get_tree().get_first_node_in_group("damage_layer")


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


func _on_hurt_box_component_area_entered(area: Area2D):
	if area.is_in_group("hit_box"):
		var hit_label = hit_label_scene.instantiate()
		hit_label.global_position = global_position
		hit_label.damage = area.damage
		damage_layer.add_child(hit_label)
		base_health = base_health - area.damage
	if base_health <= 0:
		queue_free()
