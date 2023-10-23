extends Button

export var speed_value: float = 0.0


func _ready():
	connect("pressed", get_parent(), "speed_changed", [speed_value])
