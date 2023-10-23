extends Spatial

export var speed_controls: Dictionary = {
	KEY_1: 1.0,
	KEY_2: 2.0,
	KEY_3: 3.0,
	KEY_4: 4.0
}
export var direction: Vector3 = Vector3.FORWARD setget set_direction, get_direction
# Ограничение в пределах вперед/назад и влево/вправо.
export var forward_limit: float = -1.0
export var backward_limit: float = 1.0
export var left_limit: float = -1.0
export var right_limit: float = 1.0
var is_reflect: bool = false

# set-get
func set_direction(value: Vector3) -> void:
	direction = value
	# По заданию перемещение указано в плоскости, и вперед-назад. Перемещение вперед-назад по
	# умолчанию ось Z, а второй осью для формирования "плоскости перемещения" я выбрал X.
	# Соответственно, ось Y не учитывается и обнуляется.
	direction.y = 0


func get_direction() -> Vector3:
	return direction
#_______________

func change_direction():
	direction *= -1


func _process(delta):
	$Object.move(direction, delta)
	if has_intersection():
		if not is_reflect:
			change_direction()
	else:
		if is_reflect:
			is_reflect = false
	pass


func _input(event):
	if event is InputEventKey:
		if speed_controls.has(event.scancode):
			change_speed(speed_controls[event.scancode])


func change_speed(value: float) -> void:
	$Object.set_speed(value)


func has_intersection() -> bool:
	if $Object.translation.x > right_limit or $Object.translation.x < left_limit:
		return true
	elif $Object.translation.z > backward_limit or $Object.translation.z < forward_limit:
		return true
	else:
		return false
