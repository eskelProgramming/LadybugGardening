class_name Day_Night_Handler

extends Node

var farm_tilemap

func sleep() :
	print("Sleeping...")
	reset_tiles()

func reset_tiles() :
	for dirt in get_tree().get_nodes_in_group("dirt_tiles"):
		match dirt.dirt_state:
			dirt.dirt_states.UNTILLED:
				pass
			dirt.dirt_states.TILLED:
				if randf() < 0.5:
					dirt.update_state(dirt.dirt_states.UNTILLED)
			dirt.dirt_states.WATERED:
				dirt.update_state(dirt.dirt_states.TILLED)
