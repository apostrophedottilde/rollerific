class_name LongFallingState extends MovementState

func enter(_ball: BallCharacter):
	print("Entering LONG_FALLING state")
	

func exit(_ball: BallCharacter):
	print("Exiting LONG_FALLING state")
	

func process(_ball: BallCharacter, _delta: float) -> void:
	print("Regular processing in LONG_FALLING state")
	
	
func physics_process(_ball: BallCharacter, _delta: float) -> void:
	print("Physics processing in LONG_FALLING state")
	

func integrate_forces(_ball: BallCharacter, _state: PhysicsDirectBodyState3D) -> void:
	pass
	
