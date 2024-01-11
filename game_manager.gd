extends Node

@export var points: int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	print("Game Manger has autoloaded...")
	
func increase_score(new_score: int) -> void:
	points += new_score
	
func get_score() -> int:
	return points
	
