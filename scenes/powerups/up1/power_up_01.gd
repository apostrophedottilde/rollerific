extends Node

func _on_collision_area_body_entered(_body: Node3D):
	GameManager.increase_score(50)
	queue_free()
