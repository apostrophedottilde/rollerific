extends MovementState
class_name JumpingState

func enter():
	print("Entering JUMPING state")
	

func exit():
	print("Exiting JUMPING state")
	

func process(_delta: float) -> void:
	print("Regular processing in JUMPING state")
	
	
func physics_process(_delta: float) -> void:
	print("Physics processing in JUMPING state")
	
	
func integrate_forces(_state: PhysicsDirectBodyState3D) -> void:
	# TODO: Should be checking if has started to fall again and switch to 'Falling' state instead.
	if is_on_floor():
		transitioned.emit("Idle")
