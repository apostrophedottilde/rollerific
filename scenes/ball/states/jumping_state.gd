class_name JumpingState extends MovementState

func enter(_ball: BallCharacter, ):
	print("Entering JUMPING state")

	
func process(ball: BallCharacter, delta: float) -> void:
	if ball.linear_velocity.y <= 0:
		transitioned.emit("Falling")
	
	var input_rotation: float = Input.get_action_strength("left") - Input.get_action_strength("right")
	
	if Input.is_action_pressed("left") and ball.is_on_floor():
		print("Pressed left")
		ball.rotate_y(input_rotation * ball.ball_profile.max_rotation_speed * delta)
		ball.orientation_ray.rotate_y(input_rotation * ball.ball_profile.max_rotation_speed * delta)
		
	if Input.is_action_pressed("right") and ball.is_on_floor():
		print("Pressed Right")
		ball.rotate_y(input_rotation * ball.ball_profile.max_rotation_speed * delta)
		ball.orientation_ray.rotate_y(input_rotation * ball.ball_profile.max_rotation_speed * delta)
