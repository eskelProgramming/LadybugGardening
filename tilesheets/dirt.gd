class_name Dirt

extends Area2D

var dirt_state = UNTILLED
@onready var animation_player = $AnimatedSprite2D

func _ready():
	animation_player.stop()
	animation_player.play("default")

func hoe_dirt() :
	if dirt_state == UNTILLED:
		animation_player.play("tilled")
		dirt_state = TILLED

enum {UNTILLED, TILLED, WATERED}

func _on_mouse_entered() -> void:
	MouseHandler.current_tile = self
