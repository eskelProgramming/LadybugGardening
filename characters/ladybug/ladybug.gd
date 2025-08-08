extends Node2D

@onready var _animated_sprite = $CharacterBody2D/AnimatedSprite2D

var current_direction = Direction.DOWN

func _process(_delta):
	if Input.is_action_pressed("right"):
		_animated_sprite.play("walk_right")
		current_direction = Direction.RIGHT
	elif Input.is_action_pressed("left"):
		_animated_sprite.play("walk_left")
		current_direction = Direction.LEFT
	elif  Input.is_action_pressed("down"):
		_animated_sprite.play("walk_down")
		current_direction = Direction.DOWN
	elif Input.is_action_pressed("up"):
		_animated_sprite.play("walk_up")
		current_direction = Direction.UP
	else:
		match current_direction:
			Direction.RIGHT:
				_animated_sprite.play("idle_right")
			Direction.LEFT:
				_animated_sprite.play("idle_left")
			Direction.DOWN:
				_animated_sprite.play("idle_down")
			Direction.UP:
				_animated_sprite.play("idle_up")

enum Direction {
	UP, DOWN, RIGHT, LEFT
}
