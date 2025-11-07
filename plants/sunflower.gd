extends Plant

func progress_plant():
	current_days += 1
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
	pass

func sell_plant():
	pass

func buy_plant():
	pass
