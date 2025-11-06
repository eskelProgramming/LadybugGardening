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
			
	
enum dirt_states {UNTILLED, TILLED, WATERED}

func _on_mouse_entered() -> void:
	MouseHandler.current_tile = self
