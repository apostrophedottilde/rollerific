class_name FallingState extends MovementState

func enter(_ball: BallCharacter):
	print("Entering FALLING state")
		
	
func process(ball: BallCharacter, _delta: float) -> void:
	if ball.is_on_floor():
		transitioned.emit("Idle")
		
	if Input.is_action_pressed("forward"):
		ball.apply_central_force(-ball.orientation_ray.basis.z * ball.ball_profile.rolling_force * .8)
		
	if Input.is_action_pressed("back"):
		ball.apply_central_force(ball.orientation_ray.basis.z * ball.ball_profile.rolling_force * .8)
