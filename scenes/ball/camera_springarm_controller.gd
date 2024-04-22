extends SpringArm3D

@export var ball: BallCharacter
@export var max_camera_rotation_speed: float = 2.5
@export var spring_back_speed: float = 0.05

func _ready() -> void:
	if ball:
		add_excluded_object(ball.get_rid())
		
		
func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("cam_left"):
		ball.cam_spring_arm.rotation.y += Input.get_action_strength("cam_left") * max_camera_rotation_speed * delta
		
	if Input.is_action_pressed("cam_right"):
		ball.cam_spring_arm.rotation.y -= Input.get_action_strength("cam_right") * max_camera_rotation_speed * delta
		
	if Input.get_action_strength("cam_left") - Input.get_action_strength("cam_right") == 0.0:
		ball.cam_spring_arm.rotation.y = lerp(ball.cam_spring_arm.rotation.y, ball.floor_check_ray.rotation.y, spring_back_speed)
