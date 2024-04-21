extends SpringArm3D

@export var ball: BallCharacter
@export var max_camera_rotation_speed: float = 2.5

func _ready() -> void:
	if ball:
		add_excluded_object(ball.get_rid())
		
		
func physics_process(delta: float) -> void:
	var cam_rotation_speed: float = max_camera_rotation_speed
	
	if Input.is_action_pressed("cam_left") and ball.is_on_floor():
		print("Pressed cam-left")
		ball.cam_spring_arm.rotation.y += Input.get_action_strength("cam_left") * cam_rotation_speed * delta
		
	if Input.is_action_pressed("cam_right") and ball.is_on_floor():
		print("Pressed cam-right")
		ball.cam_spring_arm.rotation.y -= Input.get_action_strength("cam_right") * cam_rotation_speed * delta
		
	if Input.get_action_strength("cam_left") - Input.get_action_strength("cam_right") == 0.0:
		ball.cam_spring_arm.rotation.y = lerp(ball.cam_spring_arm.rotation.y, ball.floor_check_ray.rotation.y, 0.01)
