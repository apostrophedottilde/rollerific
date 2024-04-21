extends MovementState
class_name JumpingState

func enter():
	print("Entering JUMPING state")
	
	
func physics_process(delta: float) -> void:
	var cam_rotation_speed: float = agent.max_camera_rotation_speed
	
	if Input.is_action_pressed("cam_left") and is_on_floor():
		print("Pressed cam-left")
		agent.cam_spring_arm.rotation.y += Input.get_action_strength("cam_left") * cam_rotation_speed * delta
		
	if Input.is_action_pressed("cam_right") and is_on_floor():
		print("Pressed cam-right")
		agent.cam_spring_arm.rotation.y -= Input.get_action_strength("cam_right") * cam_rotation_speed * delta

	
func process(delta: float) -> void:
	print("Physics processing in JUMPING state")
	agent.orientation_ray.global_position = agent.position
	agent.floor_check_ray.global_position = agent.position
	
	if agent.linear_velocity.y <= 0:
		transitioned.emit("Falling")
	
	agent.input_rotation = Input.get_action_strength("left") - Input.get_action_strength("right")
	
	if Input.is_action_pressed("left") and is_on_floor():
		print("Pressed left")
		agent.rotate_y(agent.input_rotation * agent.max_rotation_speed * delta)
		agent.orientation_ray.rotate_y(agent.input_rotation * agent.max_rotation_speed * delta)
		
	if Input.is_action_pressed("right") and is_on_floor():
		print("Pressed Right")
		agent.rotate_y(agent.input_rotation * agent.max_rotation_speed * delta)
		agent.orientation_ray.rotate_y(agent.input_rotation * agent.max_rotation_speed * delta)
