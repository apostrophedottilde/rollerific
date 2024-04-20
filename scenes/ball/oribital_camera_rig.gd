extends Marker3D

@onready var camera: Camera3D = $Camera3D
@export var target: Node3D


func _ready() -> void:
	pass


func _process(delta: float) -> void:
	pass
	

func _physics_process(delta: float) -> void:
	look_at(target.position)
