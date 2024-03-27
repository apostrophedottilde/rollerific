extends MovementState
class_name IdleState

func enter():
	print("Entering IDLE state")
	

func exit():
	print("Exiting IDLE state")
	

func process(delta: float) -> void:
	print("Regular processing in IDLE state")
	
	
func physics_process(delta: float) -> void:
	print("Physics processing in IDLE state")
