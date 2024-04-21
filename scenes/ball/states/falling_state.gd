class_name FallingState extends MovementState

func enter():
	print("Entering FALLING state")


func physics_process(delta: float) -> void:
	var cam_rotation_speed: float = agent.max_camera_rotation_speed
	
	if Input.is_action_pressed("cam_left") and is_on_floor():
		print("Pressed cam-left")
		agent.cam_spring_arm.rotation.y += Input.get_action_strength("cam_left") * cam_rotation_speed * delta
		
	if Input.is_action_pressed("cam_right") and is_on_floor():
		print("Pressed cam-right")
		agent.cam_spring_arm.rotation.y -= Input.get_action_strength("cam_right") * cam_rotation_speed * delta
		
	
func process(_delta: float) -> void:
	agent.orientation_ray.global_position = agent.position
	agent.floor_check_ray.global_position = agent.position
	
	if is_on_floor():
		print("POS " + var_to_str(agent.position.y))
		transitioned.emit("Idle")
		
	if Input.is_action_pressed("forward"):
		print("Pressed Forward")
		agent.apply_central_force(-agent.orientation_ray.basis.z * agent.rolling_force * .8)
		
	if Input.is_action_pressed("back"):
		print("Pressed Backwards")
		agent.apply_central_force(agent.orientation_ray.basis.z * agent.rolling_force * .8)
