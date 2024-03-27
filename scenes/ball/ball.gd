extends RigidBody3D
class_name BallCharacter

@export var max_camera_rotation_speed: float = 2.5
@export var rolling_force: float = 20
@export var jump_impulse: float = 20

@onready var camera_rig: Marker3D = $CameraRig
@onready var floor_check_ray: RayCast3D = $FloorCheck
@onready var orientation_ray: RayCast3D = $Orientation
@onready var model: MeshInstance3D = $Model

func _ready():
	camera_rig.top_level = true
	floor_check_ray.top_level = true
	orientation_ray.top_level = true


func _physics_process(delta: float):
	var input_rotation: float = Input.get_action_strength("left") - Input.get_action_strength("right")
	var old_camera_pos: Vector3 = camera_rig.global_transform.origin
	var ball_pos: Vector3 = global_transform.origin
	var new_camera_pos: Vector3 = lerp(old_camera_pos, ball_pos, 0.1)
	
	camera_rig.global_transform.origin = new_camera_pos
	camera_rig.rotate_y(input_rotation * max_camera_rotation_speed * delta)
	
	orientation_ray.global_transform.origin = ball_pos
	orientation_ray.rotate_y(input_rotation * max_camera_rotation_speed * delta)
	
	rotate_y(input_rotation * max_camera_rotation_speed * delta)
	floor_check_ray.global_transform.origin = global_transform.origin
	
	var is_on_floor: bool = floor_check_ray.is_colliding()
	
	if Input.is_action_pressed("forward") and is_on_floor:
		apply_force(-camera_rig.basis.z * rolling_force)
	if Input.is_action_pressed("back") and is_on_floor:
		apply_force(camera_rig.basis.z * rolling_force)
	if Input.is_action_just_pressed("jump") and is_on_floor:
		apply_central_impulse(Vector3.UP * jump_impulse)


func _on_death_pit_body_entered(_body: Node3D) -> void:
	get_tree().call_deferred("reload_current_scene")


func _on_target_point_body_entered(_body: Node3D) -> void:
	pass # Replace with function body.
