extends Spatial


var Asteroid_Silicate = preload("res://models/stones/Asteroid_Silicate.tscn")
#var Asteroid_Carbon = preload()
#var Asteroid_Metal = preload()
#var Asteroid_ice= preload()

var AsteroidEmitter_SpreadAngle = 0

	
#func _on_Timer_timeout():
#		# Добавление потомка
#		var Asteroid_Silicate_New = Asteroid_Silicate.instance()
#		# Размещение
#		Asteroid_Silicate_New.translation = Vector3(rand_range(-10,10),0,0)
#		$AsteroidEmitter.add_child(Asteroid_Silicate_New)
#		# Поворот излучателя --> поворот астеройда
#		Asteroid_Silicate_New.rotation_degrees = rotation_degrees
#		# Импульс
#		Asteroid_Silicate_New.apply_impulse(Vector3(rand_range(-0.2,0.2),rand_range(-0.2,0.2),rand_range(-0.2,0.2)),
#		transform.basis.xform(Vector3(0,0,rand_range(-5,-10))))
#		# Рандомный размер и изменение массы
#		#Asteroid_Silicate_New.set_scale(scale*rand_range(1,5))
#		#Asteroid_Silicate_New.set_mass(Asteroid_Silicate_New.mass*scale.z)
#		# Смена родителя
#		var Asteroid_moving = Asteroid_Silicate_New.get_global_transform().origin
#		$"AsteroidEmitter".remove_child(Asteroid_Silicate_New)
#		$"..".add_child(Asteroid_Silicate_New)
#		Asteroid_Silicate_New.translation = Asteroid_moving
#		#AsteroidEmitter_SpreadAngle += 45
#		#$".".rotation_degrees = Vector3(0,AsteroidEmitter_SpreadAngle,0)

func _on_Area_body_exited(Asteroid_Silicate_New):
	Asteroid_Silicate_New.queue_free()
	pass # Replace with function body.
