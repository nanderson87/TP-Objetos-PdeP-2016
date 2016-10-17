import jugador.*

class Cazador inherits Jugador {
	var punteria
	
	
	constructor( _skills,_peso, _fuerza, _escoba,_punteria ) = super( _skills,_peso, _fuerza, _escoba )
	{
		punteria = _punteria
	}
	
	override method habilidad() = super() + punteria * fuerza
	
	override method puedoObtenerQuaffle() = true
	
	method obtenerLaQuaffle(){
		tengoQuaffle = true
	}
}

class Guardian inherits Jugador{
	
		constructor(_skills,_peso,_fuerza,_escoba) = super(_skills,_peso,_fuerza,_escoba)
		
	
	override method reflejo() = super() + 20
	
	override method habilidad() = super() + self.reflejo() + fuerza 
	
	override method puedoObtenerQuaffle() = true
	
	method obtenerLaQuaffle(){
		miEquipo.jugadoresPuedenObtenerQuaffle().filter({jugador=>jugador != self}).max({jugador=>jugador.habilidad()})
	}
	
	
}

class Golpeador inherits Jugador{
	var punteria
		constructor( _skills,_peso, _fuerza, _escoba,_punteria ) = super( _skills,_peso, _fuerza, _escoba )
	{
		punteria = _punteria
	}
	
	
	override method habilidad() = super()+ punteria + fuerza
	
	
}

class Buscador  inherits Jugador{
	var vision
	var actividad	// Un objeto para busqueda y otro para persecucion
	
			constructor( _skills,_peso, _fuerza, _escoba,_vision ) = super( _skills,_peso, _fuerza, _escoba )
	{
		vision = _vision
	}
	
	
	override method habilidad() = super() + self.reflejo() * vision 

}
