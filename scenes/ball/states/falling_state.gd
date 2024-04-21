class_name FallingState extends MovementState

func enter(_ball: BallCharacter):
	print("Entering FALLING state")
		
	
func process(ball: BallCharacter, _delta: float) -> void:
	if ball.is_on_floor():
		print("POS " + var_to_str(ball.position.y))
		transitioned.emit("Idle")
		
	if Input.is_action_pressed("forward"):
		print("Pressed Forward")
		ball.apply_central_force(-ball.orientation_ray.basis.z * ball.ball_profile.rolling_force * .8)
		
	if Input.is_action_pressed("back"):
		print("Pressed Backwards")
		ball.apply_central_force(ball.orientation_ray.basis.z * ball.ball_profile.rolling_force * .8)
