extends CharacterBody2D

@export var speed = 50
@onready var animation_player = $AnimationPlayer

@onready var sprite_2d = $Sprite2D
var state = PLAYER_STATES.normal
enum PLAYER_STATES {
	normal,
	rage
}

func  _input(event):
	if event.is_action_pressed("rage"):
		if state == PLAYER_STATES.rage:
			sprite_2d.scale = Vector2(1,1)
			state = PLAYER_STATES.normal
		else:
			sprite_2d.scale = Vector2(2,2)
			state = PLAYER_STATES.rage


func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed
	if velocity != Vector2.ZERO:
		animation_player.play("walking")
	else:
		animation_player.play("idle")
	if velocity.x > 0:
		sprite_2d.flip_h = false
	elif velocity.x < 0:
		sprite_2d.flip_h = true

func _physics_process(delta):
	get_input()
	move_and_slide()



