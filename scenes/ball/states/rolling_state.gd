extends MovementState
class_name RollingState

func enter():
	print("Entering ROLLING state")
	

func exit():
	print("Exiting ROLLING state")
	

func process(_delta: float) -> void:
	print("Regular processing in ROLLING state")
	
	
func physics_process(_delta: float) -> void:
	print("Physics processing in ROLLING state")
	
	
func integrate_forces(_state: PhysicsDirectBodyState3D) -> void:
	pass
