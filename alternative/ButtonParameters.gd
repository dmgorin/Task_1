extends Button

export var parameters: Dictionary = {
	"speed": 0.0
}


func _ready():
	connect("pressed", get_parent(), "set_parameters", [parameters])
