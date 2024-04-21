class_name MovementState extends Node

signal transitioned(new_state_name: StringName)

@onready var agent: BallCharacter

var current_state: MovementStateMachine


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
