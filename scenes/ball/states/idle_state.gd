class_name IdleState extends MovementState

func enter():
	print("Entering IDLE state")
	
func physics_process(delta: float) -> void:
	agent.orientation_ray.global_position = agent.position
	agent.floor_check_ray.global_position = agent.position
	
	agent.input_rotation = Input.get_action_strength("left") - Input.get_action_strength("right")
	
	if Input.is_action_pressed("forward") and is_on_floor():
		print("Pressed Forward")
		agent.apply_central_force(-agent.orientation_ray.basis.z * agent.rolling_force)
		
	if Input.is_action_pressed("back") and is_on_floor():
		print("Pressed Backwards")
		agent.apply_central_force(agent.orientation_ray.basis.z * agent.rolling_force)
		
	if Input.is_action_pressed("left") and is_on_floor():
		print("Pressed left")
		agent.rotate_y(agent.input_rotation * agent.max_rotation_speed * delta)
		agent.orientation_ray.rotate_y(agent.input_rotation * agent.max_rotation_speed * delta)
		
	if Input.is_action_pressed("right") and is_on_floor():
		print("Pressed Right")
		agent.rotate_y(agent.input_rotation * agent.max_rotation_speed * delta)
		agent.orientation_ray.rotate_y(agent.input_rotation * agent.max_rotation_speed * delta)
		
	if Input.is_action_just_pressed("jump") and is_on_floor():
		print("Pressed Jump")
		agent.apply_central_impulse(Vector3.UP * agent.jump_impulse)
		transitioned.emit("Jumping")
