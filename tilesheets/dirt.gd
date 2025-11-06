class_name Dirt

extends Area2D

var dirt_state = UNTILLED

enum {UNTILLED, TILLED, WATERED}

func _on_mouse_entered() -> void:
	MouseHandler.current_tile = self
