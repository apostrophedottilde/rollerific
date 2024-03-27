extends MovementState
class_name FallingState

func enter():
	print("Entering FALLING state")
	

func exit():
	print("Exiting FALLING state")
	

func process(delta: float) -> void:
	print("Regular processing in FALLING state")
	
	
func physics_process(delta: float) -> void:
	print("Physics processing in FALLING state")
