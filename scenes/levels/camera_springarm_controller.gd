extends SpringArm3D

@export var player: BallCharacter
@export var max_camera_rotation_speed: float = 2.5

func _ready() -> void:
	if player:
		add_excluded_object(player.get_rid())
		
		
func physics_process(delta: float) -> void:
	var cam_rotation_speed: float = max_camera_rotation_speed
	
	if Input.is_action_pressed("cam_left") and player.is_on_floor():
		print("Pressed cam-left")
		player.cam_spring_arm.rotation.y += Input.get_action_strength("cam_left") * cam_rotation_speed * delta
		
	if Input.is_action_pressed("cam_right") and player.is_on_floor():
		print("Pressed cam-right")
		player.cam_spring_arm.rotation.y -= Input.get_action_strength("cam_right") * cam_rotation_speed * delta
		
	if Input.get_action_strength("cam_left") - Input.get_action_strength("cam_right") == 0.0:
		player.cam_spring_arm.rotation.y = lerp(player.cam_spring_arm.rotation.y, player.floor_check_ray.rotation.y, 0.01)
