extends Spatial

signal object_bumped(object_path)

export var forward_limit: float = -1.0
export var backward_limit: float = 1.0
export var left_limit: float = -1.0
export var right_limit: float = 1.0
var is_reflect: bool = false

export var watched_object_path := @""
onready var watched_object := get_node(watched_object_path) as Node


func _ready():
	connect("object_bumped", get_node(@"/root/Scene/Controller"), "object_bumped", [watched_object_path])


func _process(delta):
	if has_intersection(watched_object):
		if not is_reflect:
			emit_signal("object_bumped")
	else:
		if is_reflect:
			is_reflect = false


func has_intersection(object: Node) -> bool:
	if object.translation.x > right_limit or object.translation.x < left_limit:
		return true
	elif object.translation.z > backward_limit or object.translation.z < forward_limit:
		return true
	else:
		return false

