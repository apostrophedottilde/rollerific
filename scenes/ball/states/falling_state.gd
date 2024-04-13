extends MovementState
class_name FallingState

func enter():
	print("Entering FALLING state")
	

func exit():
	print("Exiting FALLING state")
	

func process(_delta: float) -> void:
	print("Regular processing in FALLING state")
	
	
func physics_process(_delta: float) -> void:
	print("Physics processing in FALLING state")
	

func integrate_forces(_state: PhysicsDirectBodyState3D) -> void:
	pass
