extends MovementState
class_name RollingState

func enter(_ball: BallCharacter):
	print("Entering ROLLING state")
	

func exit(_ball: BallCharacter):
	print("Exiting ROLLING state")
	

func process(_ball: BallCharacter, _delta: float) -> void:
	print("Regular processing in ROLLING state")
	
	
func physics_process(_ball: BallCharacter, _delta: float) -> void:
	print("Physics processing in ROLLING state")
	
	
func integrate_forces(_ball: BallCharacter, _state: PhysicsDirectBodyState3D) -> void:
	pass
