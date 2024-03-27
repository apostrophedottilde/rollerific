extends MovementState
class_name JumpingState

func enter():
	print("Entering JUMPING state")
	

func exit():
	print("Exiting JUMPING state")
	

func process(delta: float) -> void:
	print("Regular processing in JUMPING state")
	
	
func physics_process(delta: float) -> void:
	print("Physics processing in JUMPING state")
