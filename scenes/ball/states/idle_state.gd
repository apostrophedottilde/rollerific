class_name IdleState extends MovementState

func enter(_ball: BallCharacter, ):
	print("Entering IDLE state")
	
	
func process(ball: BallCharacter, delta: float) -> void:
	var input_rotation: float = Input.get_action_strength("left") - Input.get_action_strength("right")
	
	if Input.is_action_pressed("forward") and ball.is_on_floor():
		print("Pressed Forward")
		ball.apply_central_force(-ball.orientation_ray.basis.z * ball.ball_profile.rolling_force)
		
	if Input.is_action_pressed("back") and ball.is_on_floor():
		print("Pressed Backwards")
		ball.apply_central_force(ball.orientation_ray.basis.z * ball.ball_profile.rolling_force)
		
	if Input.is_action_pressed("left") and ball.is_on_floor():
		print("Pressed left")
		ball.rotate_y(input_rotation * ball.ball_profile.max_rotation_speed * delta)
		ball.orientation_ray.rotate_y(input_rotation * ball.ball_profile.max_rotation_speed * delta)
		
	if Input.is_action_pressed("right") and ball.is_on_floor():
		print("Pressed Right")
		ball.rotate_y(input_rotation * ball.ball_profile.max_rotation_speed * delta)
		ball.orientation_ray.rotate_y(input_rotation * ball.ball_profile.max_rotation_speed * delta)
		
	if Input.is_action_just_pressed("jump") and ball.is_on_floor():
		print("Pressed Jump")
		ball.apply_central_impulse(Vector3.UP * ball.ball_profile.jump_impulse)
		transitioned.emit("Jumping")
