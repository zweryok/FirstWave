extends RigidBody

var MASS_FUEL = 1600 # Масса топлива
var THRUST = 8000 # Тяга
var trust_input = 0
var pitch_input = 0 # Тангаж
var yaw_input = 0 # Рысканье
var roll_input = 0 # Крен
var strength = 0.1 # Прочность

func _ready():
	$LifeBoat_JetStream.hide()
	set_mass(get_mass() + MASS_FUEL)
	print($".".get_mass())
	pass

func get_input(delta):
	trust_input = 0; pitch_input=0; yaw_input=0; roll_input=0
	$LifeBoat_JetStream.hide(); $LifeBoat_JetStream2.hide();
	$LifeBoat_JetStream3.hide(); $LifeBoat_JetStream4.hide()
	
	if Input.is_action_pressed("ui_acceleration"):
		trust_input = THRUST
		$LifeBoat_JetStream.show(); $LifeBoat_JetStream2.show()
		$LifeBoat_JetStream3.show(); $LifeBoat_JetStream4.show()
		
		
	if Input.is_action_pressed("ui_braking"):
		trust_input = -(THRUST -200)
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

func _mass(delta):
	get_input(delta)
	set_mass(get_mass() - trust_input)
	MASS_FUEL = (MASS_FUEL -2*delta)
	print("fuel", MASS_FUEL,"mass", get_mass(),"delta", delta)
	
func _integrate_forces(state):
	get_input(state.step)
	add_central_force(transform.basis.z * trust_input)
	add_torque(transform.basis.x * pitch_input)
	add_torque(transform.basis.y * yaw_input)
	add_torque(-transform.basis.z * roll_input)
