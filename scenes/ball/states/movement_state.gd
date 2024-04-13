extends Node
class_name MovementState

signal transitioned(new_state_name: StringName)

var current_state: MovementStateMachine
var agent: BallCharacter

func _ready() -> void:
	current_state = get_parent()
	agent = current_state.agent

func enter():
	pass
	

func exit():
	pass
	

func process(_delta: float) -> void:
	pass
	
	
func physics_process(_delta: float) -> void:
	pass
	
	
func integrate_forces(_state: PhysicsDirectBodyState3D) -> void:
	pass
	

func is_on_floor() -> bool:
	return agent.floor_check_ray.is_colliding()
