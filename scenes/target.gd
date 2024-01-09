extends MeshInstance3D

func _on_area_3d_body_entered(body: Node3D):
	print("DID IT!")
	body.call_deferred("queue_free")


func _on_area_3d_area_entered(area):
	print("DID IT!")
	body.call_deferred("queue_free")
