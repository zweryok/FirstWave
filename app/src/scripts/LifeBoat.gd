extends RigidBody

var Asteroid_Silicate = preload("res://models/stones/Asteroid_Silicate.tscn")

var thrust = 0 # Тяга
var pitch_input = 0 # Тангаж
var yaw_input = 0 # Рысканье
var roll_input = 0 # Крен
var fuel = 1000 # Топливо
var strength = 100 # Прочность

func _ready():
	$LifeBoat_JetStream.hide()
	pass

func get_input(_delta):
	
	thrust=0; pitch_input=0; yaw_input=0; roll_input=0
	$LifeBoat_JetStream.hide(); $LifeBoat_JetStream2.hide();
	$LifeBoat_JetStream3.hide(); $LifeBoat_JetStream4.hide()
	
	if Input.is_action_pressed("ui_acceleration"):
		thrust = 10; $LifeBoat_JetStream.show(); $LifeBoat_JetStream2.show();
		$LifeBoat_JetStream3.show(); $LifeBoat_JetStream4.show()
		
	if Input.is_action_pressed("ui_braking"):
		thrust = -5
	if Input.is_action_pressed("ui_up"):
		pitch_input -=1; $LifeBoat_JetStream2.show()
	if Input.is_action_pressed("ui_down"):
		pitch_input +=1; $LifeBoat_JetStream.show()
	if Input.is_action_pressed("yaw_right"):
		yaw_input -=1; $LifeBoat_JetStream3.show()
	if Input.is_action_pressed("yaw_left"):
		yaw_input +=1; $LifeBoat_JetStream4.show()
	if Input.is_action_pressed("ui_right"):
		roll_input -=1
	if Input.is_action_pressed("ui_left"):
		roll_input +=1

func _integrate_forces(state):
	get_input(state.step)
	add_central_force(transform.basis.z * thrust)
	add_torque(transform.basis.x * pitch_input)
	add_torque(transform.basis.y * yaw_input)
	add_torque(-transform.basis.z * roll_input)
