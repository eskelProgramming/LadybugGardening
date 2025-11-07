class_name Plant
extends Area2D

@onready var animated_sprite = $AnimatedSprite2D

@export var num_days_per_tick: int
@export var plant_sell_price: int
@export var plant_buy_price: int
@export var tileset_id: int

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
	pass
	
func harvest_plant():
	pass

func sell_plant():
	pass

func buy_plant():
	pass

enum plant_stage {SEED, SPROUT, STALK, GROWN}
