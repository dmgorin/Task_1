extends MeshInstance

var speed: float = 1.0 setget set_speed, get_speed

# set/get
func set_speed(value: float) -> void:
	speed = value


func get_speed() -> float:
	return speed
#_______________

func move(direction: Vector3, delta: float) -> void:
	# Вектор нормализован для отсутствия эффекта переменной на результирующую скорость.
	translation += direction.normalized() * speed * delta


