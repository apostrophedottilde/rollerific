extends Node3D

@export_file(".tscn") var next_point: String = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_3d_body_entered(body: Node3D):
	print("DID IT!")
	get_tree().change_scene_to_file(next_point)
