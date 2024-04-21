class_name MovementState extends Node

signal transitioned(new_state_name: StringName)

var current_state: MovementStateMachine

func _ready() -> void:
	current_state = get_parent()

func enter(ball: BallCharacter) -> void:
	pass
	

func exit(ball: BallCharacter) -> void:
	pass
	

func process(_ball: BallCharacter, _delta: float) -> void:
	pass
	
	
func physics_process(ball: BallCharacter, _delta: float) -> void:
	ball.orientation_ray.global_position = ball.position
	ball.floor_check_ray.global_position = ball.position
		
	
func integrate_forces(_ball: BallCharacter, _state: PhysicsDirectBodyState3D) -> void:
	pass
