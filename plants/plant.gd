class_name Plant
extends Area2D

@onready var animated_sprite = $AnimatedSprite2D

@export var num_days_per_tick: int
@export var plant_sell_price: int
@export var plant_buy_price: int

var current_days = 1
var current_stage = plant_stage.SEED
var dirt : Dirt

func _ready() -> void:
	animated_sprite.stop()
	animated_sprite.play("seed")

func plant_seed():
	animated_sprite.stop()
	animated_sprite.play("seed")

func progress_plant():
	current_days += 1
	print(current_stage)
	if current_days >= (num_days_per_tick * (current_stage + 1)) and dirt.dirt_state == dirt.dirt_states.PLANTED_WATERED:
			match current_stage:
				plant_stage.SEED:
					current_stage = plant_stage.SPROUT
					animated_sprite.play("sprout")
				plant_stage.SPROUT:
					current_stage = plant_stage.STALK
					animated_sprite.play("stalk")
				plant_stage.STALK:
					current_stage = plant_stage.GROWN
					animated_sprite.play("grown")
				plant_stage.GROWN:
					current_stage = plant_stage.GROWN
					animated_sprite.play("grown")
	
func harvest_plant():
	if current_stage == plant_stage.GROWN:
		PlantHandler.remove_plant(self)

func sell_plant():
	pass

func buy_plant():
	pass

enum plant_stage {SEED, SPROUT, STALK, GROWN}


func _on_mouse_entered() -> void:
	MouseHandler.current_plant_tile = self
