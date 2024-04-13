extends MovementState
class_name IdleState

func enter():
	print("Entering IDLE state")
	

func exit():
	print("Exiting IDLE state")
	

func process(_delta: float) -> void:
	print("Regular processing in IDLE state")
	
	
func physics_process(_delta: float) -> void:
	print("Physics processing in IDLE state")
	
	
func integrate_forces(_state: PhysicsDirectBodyState3D) -> void:
	if Input.is_action_pressed("forward") and is_on_floor():
		print("Pressed Forward")
		agent.apply_force(-agent.basis.z * agent.rolling_force)
		
	if Input.is_action_pressed("back") and is_on_floor():
		print("Pressed Backwards")
		agent.apply_force(agent.basis.z * agent.rolling_force)
		
	if Input.is_action_just_pressed("jump"):
		print("Pressed Jump")
		agent.apply_central_impulse(Vector3.UP * agent.jump_impulse)
		transitioned.emit("Jumping")
