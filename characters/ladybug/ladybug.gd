extends CharacterBody2D

@onready var _animated_sprite = $AnimatedSprite2D
@onready var toolbar = $toolbar

# Properties
@export var speed = 250.0
var face_direction = "down"
var animation_to_play = "idle_down"
var current_tool = Tools.WATERING_CAN

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
	
	# All movement animations named appropriately, eg "Left_Idle" or "Back_Walk"
	animation_to_play = ("walk" if velocity.length() > 0.0 else "idle") + "_" + face_direction
	_animated_sprite.play(animation_to_play)
	
	if Input.is_action_just_pressed("toolbar_1"):
		current_tool = Tools.WATERING_CAN
	if Input.is_action_just_pressed("toolbar_2"):
		current_tool = Tools.HOE
	if Input.is_action_just_pressed("toolbar_3"):
		current_tool = Tools.SCYTHE
	if Input.is_action_just_pressed("toolbar_4"):
		current_tool = Tools.SEEDBAG
	
	# Move character, slide at collision
	move_and_slide()
	
	# Set the toolbar to the correct tool
	match current_tool:
		Tools.WATERING_CAN:
			toolbar.select(0)
		Tools.HOE:
			toolbar.select(1)
		Tools.SCYTHE:
			toolbar.select(2)
		Tools.SEEDBAG:
			toolbar.select(3)

enum Tools { WATERING_CAN, HOE, SCYTHE, SEEDBAG }


func _on_toolbar_item_clicked(index: int, at_position: Vector2, mouse_button_index: int) -> void:
	match index:
		0:
			current_tool = Tools.WATERING_CAN
		1:
			current_tool = Tools.HOE
		2:
			current_tool = Tools.SCYTHE
		3: 
			current_tool = Tools.SEEDBAG
