extends Spatial

export var speed_controls: Dictionary = {
	KEY_1: 1.0,
	KEY_2: 2.0,
	KEY_3: 3.0,
	KEY_4: 4.0
}

export var top_limit: float = -1.0
export var bottom_limit: float = 1.0
export var left_limit: float = -1.0
export var right_limit: float = 1.0
var is_reflect: bool = false


func _input(event):
	if event is InputEventKey:
		if speed_controls.has(event.scancode):
			change_speed(speed_controls[event.scancode])


func change_speed(value: float) -> void:
	$Object.set_speed(value)


func rotate_object():
	$Object.change_direction()


func _process(delta):
	if has_intersection():
		if not is_reflect:
			rotate_object()
	else:
		if is_reflect:
			is_reflect = false


func has_intersection() -> bool:
	if $Object.translation.x > right_limit or $Object.translation.x < left_limit:
		return true
	elif $Object.translation.z > bottom_limit or $Object.translation.z < top_limit:
		return true
	else:
		return false
