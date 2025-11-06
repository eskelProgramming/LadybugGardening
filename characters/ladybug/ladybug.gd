class_name Ladybug

extends CharacterBody2D

@onready var _animated_sprite = $AnimatedSprite2D
@onready var toolbar = $Camera2D/toolbar
@onready var ladybug = $"."

# Properties
@export var speed = 250.0
var face_direction = "down"
var animation_to_play = "idle_down"

var is_touching_stump = false

# Start front idle animation on load
func _ready():
	_animated_sprite.stop()
	_animated_sprite.play("idle_down")

func _physics_process(_delta):
	# Reset velocity
	velocity = Vector2.ZERO
	
	# Add appropriate velocities depending on button press
	if Input.is_action_pressed("left"):
		velocity.x -= 1.0 * speed
		# Only face left/right if not diagonal movement
		if velocity.y == 0.0:
			face_direction = "left"
	if Input.is_action_pressed("right"):
		velocity.x += 1.0 * speed
		# Only face left/right if not diagonal movement
		if velocity.y == 0.0:
			face_direction = "right"
	if Input.is_action_pressed("up"):
		velocity.y -= 1.0 * speed
		face_direction = "up"
	if Input.is_action_pressed("down"):
		velocity.y += 1.0 * speed
		face_direction = "down"
	
	if Input.is_action_just_pressed("toolbar_1"):
		ToolManager.current_tool = ToolManager.Tools.WATERING_CAN
	if Input.is_action_just_pressed("toolbar_2"):
		ToolManager.current_tool = ToolManager.Tools.HOE
	if Input.is_action_just_pressed("toolbar_3"):
		ToolManager.current_tool = ToolManager.Tools.SCYTHE
	if Input.is_action_just_pressed("toolbar_4"):
		ToolManager.current_tool = ToolManager.Tools.SEEDBAG
		
		# Set the toolbar to the correct tool
	match ToolManager.current_tool:
		ToolManager.Tools.WATERING_CAN:
			toolbar.select(0)
		ToolManager.Tools.HOE:
			toolbar.select(1)
		ToolManager.Tools.SCYTHE:
			toolbar.select(2)
		ToolManager.Tools.SEEDBAG:
			toolbar.select(3)
	
	animation_to_play = ("walk" if velocity.length() > 0.0 else "idle") + "_" + face_direction
	
	if Input.is_action_just_pressed("use") :
		if MouseHandler.current_tile != null && is_ladybug_in_range() :
			match ToolManager.current_tool:
				ToolManager.Tools.WATERING_CAN:
					MouseHandler.current_tile.water_dirt()
				ToolManager.Tools.HOE:
					MouseHandler.current_tile.hoe_dirt()
					animation_to_play = "hoe_" + face_direction
				ToolManager.Tools.SCYTHE:
					pass
				ToolManager.Tools.SEEDBAG:
					pass
	
	
	_animated_sprite.play(animation_to_play)
	
	move_and_slide()


func _on_toolbar_item_clicked(index: int, at_position: Vector2, mouse_button_index: int) -> void:
	match index:
		0:
			ToolManager.current_tool = ToolManager.Tools.WATERING_CAN
			toolbar.select(0)
		1:
			ToolManager.current_tool = ToolManager.Tools.HOE
			toolbar.select(1)
		2:
			ToolManager.current_tool = ToolManager.Tools.SCYTHE
			toolbar.select(2)
		3:
			ToolManager.current_tool = ToolManager.Tools.SEEDBAG
			toolbar.select(3)

func is_ladybug_in_range():
	var distance_to = ladybug.position.distance_to(MouseHandler.current_tile.position)
	return distance_to < 40
