extends Position3D

var Asteroid_Silicate = preload("res://models/stones/Asteroid_Silicate.tscn")
var x = -1
func TimerEmitterFrontal_start():
	$TimerEmitterFrontal.start()


#func _on_TimerEmitterFrontal_timeout():
#	if abs($"..".linear_velocity.z) > 1:
#		$TimerEmitterFrontal.wait_time = 1 -(floor((abs($"..".linear_velocity.z)))*0.01)
#		var Asteroid_Silicate_New = Asteroid_Silicate.instance()
#		Asteroid_Silicate_New.translation = Vector3(rand_range(-30,30),rand_range(-30,30),0)
#		$".".add_child(Asteroid_Silicate_New)
#		# Импульс
#		Asteroid_Silicate_New.apply_impulse(Vector3(rand_range(-0.2,0.2),rand_range(-0.2,0.2),rand_range(-0.2,0.2)),
#		transform.basis.xform(Vector3(rand_range(0,5),rand_range(0,5),rand_range(-1,-5))))
#		# Рандомный размер и изменение массы
#		Asteroid_Silicate_New.set_scale(scale*rand_range(1,5))
#		Asteroid_Silicate_New.set_mass(Asteroid_Silicate_New.mass*scale.z)
#		# Смена родителя
#		var Asteroid_moving = Asteroid_Silicate_New.get_global_transform().origin
#		$".".remove_child(Asteroid_Silicate_New)
#		$"../../..".add_child(Asteroid_Silicate_New)
#		Asteroid_Silicate_New.translation = Asteroid_moving
		
func _process(delta):
	
	print("time",$TimerEmitterFrontal.wait_time,"speed", $"..".linear_velocity.z)
