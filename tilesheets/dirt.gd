class_name Dirt

extends Area2D

var dirt_state = dirt_states.UNTILLED
@onready var animation_player = $AnimatedSprite2D

func _ready():
	animation_player.stop()
	animation_player.play("default")

func hoe_dirt() :
	if dirt_state == dirt_states.UNTILLED:
		update_state(dirt_states.TILLED)

func water_dirt() :
	if dirt_state == dirt_states.TILLED:
		update_state(dirt_states.WATERED)
	elif dirt_state == dirt_states.PLANTED_UNWATERED:
		update_state(dirt_states.PLANTED_WATERED)

func plant_seed() :
	if dirt_state == dirt_states.WATERED:
		update_state(dirt_states.PLANTED_WATERED)

func update_state(state):
	match state:
		dirt_states.UNTILLED:
			animation_player.play("default")
			dirt_state = dirt_states.UNTILLED
		dirt_states.TILLED:
			animation_player.play("tilled")
			dirt_state = dirt_states.TILLED
		dirt_states.WATERED:
			animation_player.play("watered")
			dirt_state = dirt_states.WATERED
		dirt_states.PLANTED_WATERED:
			animation_player.play("watered")
			dirt_state = dirt_states.PLANTED_WATERED
		dirt_states.PLANTED_UNWATERED:
			animation_player.play("tilled")
			dirt_state = dirt_states.PLANTED_UNWATERED

enum dirt_states {UNTILLED, TILLED, WATERED, PLANTED_WATERED, PLANTED_UNWATERED}

func _on_mouse_entered() -> void:
	MouseHandler.current_dirt_tile = self
