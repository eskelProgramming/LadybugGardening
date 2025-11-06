class_name Stump

extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body is Ladybug:
		body.is_touching_stump = true



func _on_body_exited(body: Node2D) -> void:
	if body is Ladybug:
		body.is_touching_stump = false
