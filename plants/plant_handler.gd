class_name Plant_Handler
extends Node

var all_plant_types = ["sunflower", "potato"]
var current_seed = all_plant_types[0]
var all_plants = []

func plant(dirt_tile) :
	if dirt_tile.dirt_state == dirt_tile.dirt_states.WATERED:
		var new_plant = load("res://plants/" + current_seed + ".tscn").instantiate()
		new_plant.position = dirt_tile.position
		new_plant.dirt = dirt_tile
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
	for plant : Plant in all_plants:
		plant.progress_plant()

func remove_plant(plant: Plant):
	MoneyManager.add_money(plant.plant_sell_price)
	all_plants.remove_at(all_plants.find(plant))
	plant.dirt.dirt_state = plant.dirt.dirt_states.TILLED
	get_tree().queue_delete(plant)
	print(MoneyManager.current_money)
