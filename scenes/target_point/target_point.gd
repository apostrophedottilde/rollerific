extends Node3D

@export_file(".tscn") var next_point: String = ""

func _on_area_3d_body_entered(_body: Node3D):
	print("DID IT!")
	get_tree().change_scene_to_file(next_point)
