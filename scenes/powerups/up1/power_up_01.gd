extends Node

func _on_collision_area_body_entered(body: Node3D):
	queue_free()
