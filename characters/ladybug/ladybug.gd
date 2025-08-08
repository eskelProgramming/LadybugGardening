extends CharacterBody2D

@onready var _animated_sprite = $AnimatedSprite2D

var current_direction = Direction.DOWN
var speed = 200.0

	
func _physics_process(delta: float) -> void:
	velocity = Vector2.ZERO
	
	if Input.is_action_pressed("right"):
		_animated_sprite.play("walk_right")
		current_direction = Direction.RIGHT
		velocity.x += 1
	if Input.is_action_pressed("left"):
		_animated_sprite.play("walk_left")
		current_direction = Direction.LEFT
		velocity.x -= 1
	if  Input.is_action_pressed("down"):
		_animated_sprite.play("walk_down")
		current_direction = Direction.DOWN
		velocity.y += 1
	if Input.is_action_pressed("up"):
		_animated_sprite.play("walk_up")
		current_direction = Direction.UP
		velocity.y -= 1
	
	if Input.is_action_just_released("right"):
		_animated_sprite.play("idle_right")
	if Input.is_action_just_released("left"):
		_animated_sprite.play("idle_left")
	if Input.is_action_just_released("down"):
		_animated_sprite.play("idle_down")
	if Input.is_action_just_released("up"):
		_animated_sprite.play("idle_up")
	
	velocity = velocity.normalized() * speed
	move_and_slide()

enum Direction {
	UP, DOWN, RIGHT, LEFT
}
