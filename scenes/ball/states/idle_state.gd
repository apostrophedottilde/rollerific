class_name IdleState extends MovementState

func enter():
	print("Entering IDLE state")
	
func physics_process(delta: float) -> void:
	var cam_rotation_speed: float = agent.max_camera_rotation_speed
	
	if Input.is_action_pressed("cam_left") and is_on_floor():
		print("Pressed cam-left")
		agent.cam_spring_arm.rotation.y += Input.get_action_strength("cam_left") * cam_rotation_speed * delta
		
	if Input.is_action_pressed("cam_right") and is_on_floor():
		print("Pressed cam-right")
		agent.cam_spring_arm.rotation.y -= Input.get_action_strength("cam_right") * cam_rotation_speed * delta
		
	if Input.get_action_strength("cam_left") - Input.get_action_strength("cam_right") == 0.0:
		agent.cam_spring_arm.rotation.y = lerp(agent.cam_spring_arm.rotation.y, agent.floor_check_ray.rotation.y, 0.01)
	
func process(delta: float) -> void:
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
