extends MovementState
class_name LongFallingState

func enter():
	print("Entering LONG_FALLING state")
	

func exit():
	print("Exiting LONG_FALLING state")
	

func process(delta: float) -> void:
	print("Regular processing in LONG_FALLING state")
	
	
func physics_process(delta: float) -> void:
	print("Physics processing in LONG_FALLING state")
