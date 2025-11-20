extends Plant

func sell_plant():
	pass

func buy_plant():
	pass

func _on_mouse_entered() -> void:
	MouseHandler.current_plant_tile = self
