extends Container

@onready var score_label: Label = $Score

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	score_label.text = "%s" % GameManager.get_score()
