extends Marker3D

@onready var camera: Camera3D = $Camera3D
@export var target: Node3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#camera_3d.top_level = true 
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	

func _physics_process(delta: float) -> void:
	look_at(target.position)
