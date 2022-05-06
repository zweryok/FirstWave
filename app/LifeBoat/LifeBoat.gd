extends RigidBody

var FUEL = 1600 # Масса топлива
var fuel_burning = 0 #Сжигание толива 

var THRUST = 8000 # Тяга
var trust_input = 0

var pitch_input = 0 # Тангаж
var yaw_input = 0 # Рысканье
var roll_input = 0 # Крен
var strength = 100 # Прочность

func _ready():
	$LifeBoat_JetStream.hide()
	set_mass(get_mass() + FUEL)
	print($".".get_mass())
	pass

func get_input(_delta):
	trust_input = 0; pitch_input=0; yaw_input=0; roll_input=0
	$LifeBoat_JetStream.hide(); $LifeBoat_JetStream2.hide();
	$LifeBoat_JetStream3.hide(); $LifeBoat_JetStream4.hide()
	
	if Input.is_action_pressed("ui_trust"):
		trust_input = THRUST
		$LifeBoat_JetStream.show(); $LifeBoat_JetStream2.show()
		$LifeBoat_JetStream3.show(); $LifeBoat_JetStream4.show()
		
	if Input.is_action_pressed("ui_braking"):
		trust_input -=(THRUST -6000)
	if Input.is_action_pressed("ui_up"):
		pitch_input -=100; $LifeBoat_JetStream2.show()
	if Input.is_action_pressed("ui_down"):
		pitch_input +=100; $LifeBoat_JetStream.show()
	if Input.is_action_pressed("yaw_right"):
		yaw_input -=1; $LifeBoat_JetStream3.show()
	if Input.is_action_pressed("yaw_left"):
		yaw_input +=1; $LifeBoat_JetStream4.show()
	if Input.is_action_pressed("ui_right"):
		roll_input +=1
	if Input.is_action_pressed("ui_left"):
		roll_input -=1
	
func _integrate_forces(state):
	get_input(state.step)
	add_central_force(transform.basis.z * trust_input)
	add_torque(transform.basis.x * pitch_input)
	add_torque(transform.basis.y * yaw_input)
	add_torque(-transform.basis.z * roll_input)
	#Сжигание топлива
	#fuel_burning = (abs(trust_input)+abs(pitch_input)*5 +abs(yaw_input)*5 +abs(roll_input)*5)*0.002*get_process_delta_time()
	#set_mass(get_mass() - fuel_burning)
	#FUEL = FUEL - fuel_burning
	print("speed", ceil (linear_velocity.length()*3),"fuel",ceil(FUEL))
