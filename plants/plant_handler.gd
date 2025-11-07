class_name Plant_Handler
extends Node

var current_seed = "sunflower"
var all_plants = []

func plant(dirt_tile) :
	if dirt_tile.dirt_state == dirt_tile.dirt_states.WATERED:
		var new_plant = load("res://plants/" + current_seed + ".tscn").instantiate()
		new_plant.position = dirt_tile.position
		if MoneyManager.can_remove_money(new_plant.plant_buy_price) :
			MoneyManager.remove_money(new_plant.plant_buy_price)
			get_tree().current_scene.add_child(new_plant)
			all_plants.append(new_plant)
			print(MoneyManager.current_money)
			return true
		else:
			return false
	else :
		return false

func update_plants():
	for plant in all_plants:
		plant.progress_plant()
