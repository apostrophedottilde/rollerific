extends RigidBody3D
class_name BallCharacter 

@export var max_camera_rotation_speed: float = 2.5
@export var rolling_force: float = 14
@export var jump_impulse: float = 6

@onready var camera_rig: Marker3D = $CameraRig
@onready var floor_check_ray: RayCast3D = $FloorCheck
@onready var orientation_ray: RayCast3D = $Orientation
@onready var model: MeshInstance3D = $Model
@onready var fsm: MovementStateMachine = $MovementStateMachine

func _ready():
	can_sleep = false
	floor_check_ray.top_level = true
	orientation_ray.top_level = true
	

func _process(delta: float):
	fsm.current_state.process(delta)
	

func _physics_process(delta: float):
	fsm.current_state.physics_process(delta)

		
func _integrate_forces(state: PhysicsDirectBodyState3D):
	fsm.current_state.integrate_forces(state)


func _on_death_pit_body_entered(_body: Node3D) -> void:
	get_tree().call_deferred("reload_current_scene")


func _on_target_point_body_entered(_body: Node3D) -> void:
	pass
