extends Spatial

export var speed_controls: Dictionary = {
	KEY_1: 1.0,
	KEY_2: 2.0,
	KEY_3: 3.0,
	KEY_4: 4.0
}

export var object_path := @""
onready var object := get_node(object_path) as Node


func _input(event):
	if event is InputEventKey:
		if speed_controls.has(event.scancode):
			set_parameters({"speed": speed_controls[event.scancode]})

# Если здесь параметры регулируются у конкретного объекта...
func set_parameters(parameters) -> void:
	for parameter in parameters:
		object.parameters[parameter] = parameters[parameter]

# то в данном случае я решил продемонстрировать возможность управлять не только конкретным,
# а любым, столкнувшимся с границей, объектом, будь их больше одного.
func rotate_object(obj_path: NodePath) -> void:
	get_node(obj_path).change_direction()
	# Учитывая, что у контроллера управляемый объект один, 
	# параметр obj_path не нужен ни в rotate_object(), ни в object_bumped(),
	# и можно просто написать:
	# object.change_direction()

func object_bumped(obj_path: NodePath) -> void:
	rotate_object(obj_path)

