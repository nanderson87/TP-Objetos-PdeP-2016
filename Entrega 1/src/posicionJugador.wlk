import jugador.*

class Cazador inherits Jugador {
	var punteria
		
		constructor(_skills,_peso,_fuerza,_escoba,_miEquipo,_tengoQuaffle,_punteria) = super(_skills,_peso,_fuerza,_escoba,_miEquipo,_tengoQuaffle)
		{
		punteria = _punteria
		}

	
	override method habilidad() = super() + punteria * fuerza
}

class Guardian inherits Jugador{
		
		constructor(_skills,_peso,_fuerza,_escoba,_miEquipo,_tengoQuaffle) = super(_skills,_peso,_fuerza,_escoba,_miEquipo,_tengoQuaffle)
	
	
	override method reflejo() = super() + 20
	
	override method habilidad() = super() + self.reflejo() + fuerza 
	
	override method ganarSkillsPorBloqueo() { self.skills((self.skills() + 10)) }
	
}

class Golpeador inherits Jugador{
	var punteria
	constructor(_skills,_peso,_fuerza,_escoba,_miEquipo,_tengoQuaffle,_punteria) = super(_skills,_peso,_fuerza,_escoba,_miEquipo,_tengoQuaffle)
		{
		punteria = _punteria
		}
	
	
	override method habilidad() = super()+ punteria + fuerza
	
	
}

class Buscador  inherits Jugador{
	var vision
	var actividad	// Un objeto para busqueda y otro para persecucion
	
			constructor(_skills,_peso,_fuerza,_escoba,_miEquipo,_tengoQuaffle,_vision,_actividad) = super(_skills,_peso,_fuerza,_escoba,_miEquipo,_tengoQuaffle)
	{
		vision = _vision
		actividad = _actividad
	}
	
	override method habilidad() = super() + self.reflejo() * vision 

	//override method puedeBloquear() = false
}
