class_name FallingState extends MovementState

@export var max_camera_rotation_speed: float = 2.5

func enter():
	print("Entering FALLING state")
		
	
func process(_delta: float) -> void:
	agent.orientation_ray.global_position = agent.position
	agent.floor_check_ray.global_position = agent.position
	
	if agent.is_on_floor():
		print("POS " + var_to_str(agent.position.y))
		transitioned.emit("Idle")
		
	if Input.is_action_pressed("forward"):
		print("Pressed Forward")
		agent.apply_central_force(-agent.orientation_ray.basis.z * agent.ball_profile.rolling_force * .8)
		
	if Input.is_action_pressed("back"):
		print("Pressed Backwards")
		agent.apply_central_force(agent.orientation_ray.basis.z * agent.ball_profile.rolling_force * .8)
