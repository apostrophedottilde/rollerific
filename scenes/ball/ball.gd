class_name BallCharacter extends RigidBody3D

@onready var model: MeshInstance3D = $Model
@onready var floor_check_ray: RayCast3D = $FloorCheck
@onready var orientation_ray: RayCast3D = $Orientation
@onready var cam_spring_arm: SpringArm3D = $Orientation/SpringArm3D
@onready var fsm: MovementStateMachine = $MovementStateMachine

@export var ball_profile: BallProfile

var input_rotation: float

func _ready():
	print("BALL PROFILE: " + var_to_str(ball_profile))
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


func is_on_floor() -> bool:
	return floor_check_ray.is_colliding()
