class_name IdleState extends MovementState

@export var max_camera_rotation_speed: float = 2.5

func enter():
	print("Entering IDLE state")
	
func process(delta: float) -> void:
	agent.orientation_ray.global_position = agent.position
	agent.floor_check_ray.global_position = agent.position
	
	agent.input_rotation = Input.get_action_strength("left") - Input.get_action_strength("right")
	
	if Input.is_action_pressed("forward") and agent.is_on_floor():
		print("Pressed Forward")
		agent.apply_central_force(-agent.orientation_ray.basis.z * agent.ball_profile.rolling_force)
		
	if Input.is_action_pressed("back") and agent.is_on_floor():
		print("Pressed Backwards")
		agent.apply_central_force(agent.orientation_ray.basis.z * agent.ball_profile.rolling_force)
		
	if Input.is_action_pressed("left") and agent.is_on_floor():
		print("Pressed left")
		agent.rotate_y(agent.input_rotation * agent.ball_profile.max_rotation_speed * delta)
		agent.orientation_ray.rotate_y(agent.input_rotation * agent.ball_profile.max_rotation_speed * delta)
		
	if Input.is_action_pressed("right") and agent.is_on_floor():
		print("Pressed Right")
		agent.rotate_y(agent.input_rotation * agent.ball_profile.max_rotation_speed * delta)
		agent.orientation_ray.rotate_y(agent.input_rotation * agent.ball_profile.max_rotation_speed * delta)
		
	if Input.is_action_just_pressed("jump") and agent.is_on_floor():
		print("Pressed Jump")
		agent.apply_central_impulse(Vector3.UP * agent.ball_profile.jump_impulse)
		transitioned.emit("Jumping")
