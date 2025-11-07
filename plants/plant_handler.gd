class_name Plant_Handler
extends Node

var current_seed = "sunflower"
var all_plants = []

func plant(dirt_tile) :
	if dirt_tile.dirt_state == dirt_tile.dirt_states.WATERED:
		var new_plant = load("res://plants/" + current_seed + ".tscn").instantiate()
		new_plant.position = dirt_tile.position
		get_tree().current_scene.add_child(new_plant)
		all_plants.append(new_plant)

func update_plants():
	for plant in all_plants:
		plant.progress_plant()
