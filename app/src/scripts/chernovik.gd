#extends Node
#
#extends Position3D
#var Asteroid_Silicate = preload("res://models/stones/Asteroid_Silicate.tscn")
#
## зависит от скорости движения - выше скорость чаще создаются.
#func _on_Timer_timeout():
#	if $"..".linear_velocity.z > 1:
#
#		var Asteroid_Silicate_New = Asteroid_Silicate.instance()
#		# Размещение
#		Asteroid_Silicate_New.translation = Vector3(rand_range(-100,100),rand_range(-100,100),0)
#		$".".add_child(Asteroid_Silicate_New)
#		# Поворот излучателя --> поворот астеройда
#		Asteroid_Silicate_New.rotation_degrees = rotation_degrees
#		# Импульс
#		Asteroid_Silicate_New.apply_impulse(Vector3(rand_range(-0.2,0.2),rand_range(-0.2,0.2),rand_range(-0.2,0.2)),
#		transform.basis.xform(Vector3(rand_range(5,10),rand_range(0,5),rand_range(0,5))))
#		# Рандомный размер и изменение массы
#		Asteroid_Silicate_New.set_scale(scale*rand_range(1,5))
#		Asteroid_Silicate_New.set_mass(Asteroid_Silicate_New.mass*scale.z)
#		# Смена родителя
#		var Asteroid_moving = Asteroid_Silicate_New.get_global_transform().origin
#		$".".remove_child(Asteroid_Silicate_New)
#		$"../../..".add_child(Asteroid_Silicate_New)
#		Asteroid_Silicate_New.translation = Asteroid_moving
#func _process(delta):
#	$TimerEmitterFrontal.wait_time = $TimerEmitterFrontal.wait_time / 1 * $"..".linear_velocity.z
