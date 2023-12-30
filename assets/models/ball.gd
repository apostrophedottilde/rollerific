extends RigidBody3D

@export var rolling_force: float = 40
@export var jump_impulse: float = 10.00

@onready var camera_rig: Marker3D = $CameraRig
@onready var floor_check_ray: RayCast3D = $FloorCheck


# Called when the node enters the scene tree for the first time.
func _ready():
	camera_rig.top_level = true
	floor_check_ray.top_level = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float):
	var old_camera_pos: Vector3 = camera_rig.global_transform.origin
	var ball_pos: Vector3 = global_transform.origin
	var new_camera_pos: Vector3 = lerp(old_camera_pos, ball_pos, 0.01)
	
	camera_rig.global_transform.origin = new_camera_pos
	floor_check_ray.global_transform.origin = global_transform.origin
	
	if Input.is_action_pressed("forward"):
		angular_velocity.x -= rolling_force * delta
	if Input.is_action_pressed("back"):
		angular_velocity.x += rolling_force * delta
	if Input.is_action_pressed("left"):
		angular_velocity.z += rolling_force * delta
	if Input.is_action_pressed("right"):
		angular_velocity.z -= rolling_force * delta
		
	var is_on_floor: bool = floor_check_ray.is_colliding()
	if Input.is_action_just_pressed("jump") and is_on_floor:
		apply_central_impulse(Vector3.UP * jump_impulse)
	
