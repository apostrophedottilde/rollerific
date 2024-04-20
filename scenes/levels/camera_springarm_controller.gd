extends SpringArm3D

@export var player: BallCharacter

func _ready() -> void:
	if player:
		add_excluded_object(player.get_rid())
