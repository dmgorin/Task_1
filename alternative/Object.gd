extends MeshInstance

var parameters: Dictionary = {
	"speed": 1.0
}
export var direction: Vector3 = Vector3.FORWARD setget set_direction, get_direction


# set/get
func set_direction(value: Vector3) -> void:
	direction = value
	# По заданию перемещение указано в плоскости, и вперед-назад. Перемещение вперед-назад по
	# умолчанию ось Z, а второй осью для формирования "плоскости перемещения" я выбрал X.
	# Соответственно, ось Y не учитывается и обнуляется.
	direction.y = 0


func get_direction() -> Vector3:
	return direction
#_______________

func _process(delta):
	# Вектор нормализован для отсутствия эффекта переменной на результирующую скорость.
	move(direction.normalized() * parameters["speed"] * delta)
	pass


func move(velocity: Vector3) -> void:
	translation += velocity


func change_direction():
	direction *= -1
