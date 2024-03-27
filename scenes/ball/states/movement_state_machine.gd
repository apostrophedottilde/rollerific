extends Node
class_name MovementStateMachine

@export var current_state: MovementState

var states: Dictionary = {}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for possible_state in get_children():
		if possible_state is MovementState:
			states[possible_state.name] = possible_state
			possible_state.transitioned.connect(on_child_transitioned)
		else:
			push_warning("State machine contains child node that is not a STATE")
			
	current_state.enter()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	current_state.process(delta)
	
func _physics_process(delta: float) -> void:
	current_state.physics_process(delta)
	

func on_child_transitioned(new_state_name: StringName):
	var new_state = states.get(new_state_name)
	
	if new_state != null:
		if new_state != current_state:
			current_state.exit()
			new_state.enter()
			current_state = new_state
	else: 
		push_warning("Called transition on state that does not exist")
