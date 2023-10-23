extends MeshInstance

var speed: float = 1.0 setget set_speed, get_speed
export var direction: Vector3 = Vector3.FORWARD setget set_direction, get_direction


# set/get
func set_speed(value: float) -> void:
	speed = value


func get_speed() -> float:
	return speed


func set_direction(value: Vector3) -> void:
	direction = value


func get_direction() -> Vector3:
	return direction
#_______________

func _process(delta):
	# Вектор нормализован для отсутствия эффекта переменной на результирующую скорость.
	move(direction.normalized() * speed * delta)
	pass


func move(velocity: Vector3) -> void:
	translation += velocity


func change_direction():
	direction *= -1
