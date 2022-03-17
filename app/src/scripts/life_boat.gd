extends KinematicBody

var active
const MOUSE_SENSITIVITY = 0.01
const SPEED = 10

var rotare_x = 0
var rotare_y = 0


func _ready():
	pass
# Мышь
func _input(event):
	if event is InputEventMouseMotion:
		# Преобразование сигнала мыши в вращение
		rotare_x -= event.relative.x * MOUSE_SENSITIVITY
		rotare_y -= event.relative.y * MOUSE_SENSITIVITY
		# Ограничение вращения
		rotare_y = clamp(rotare_y, -1 , 1)
		# Вращение
		transform.basis = Basis()
		rotate_object_local(Vector3(0, 1, 0), rotare_x)
		rotate_object_local(Vector3(1, 0, 0), rotare_y)
# Клавиатура
func my_get_input():
	if Input.is_action_pressed("ui_up"):
		move_and_slide($".".global_transform.basis.z * - SPEED)
	if Input.is_action_pressed("ui_down"):
		move_and_slide($".".global_transform.basis.z * SPEED)
	if Input.is_action_pressed("ui_left"):
		move_and_slide($".".global_transform.basis.x * - SPEED)
	if Input.is_action_pressed("ui_right"):
		move_and_slide($".".global_transform.basis.x * SPEED)
	if Input.is_action_pressed("ui_jump"):
		move_and_slide($".".global_transform.basis.y * SPEED/2)
	if Input.is_action_pressed("ui_landing"):
		move_and_slide($".".global_transform.basis.y * -SPEED)
#Физика
func _physics_process(delta):
	my_get_input()
