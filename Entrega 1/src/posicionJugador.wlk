import jugador.*

class Cazador inherits Jugador {
	var punteria
	
	
	constructor( _skills,_peso, _fuerza, _escoba,_punteria ) = super( _skills,_peso, _fuerza, _escoba )
	{
		punteria = _punteria
	}
	
	override method habilidad() = super() + punteria * fuerza
}

class Guardian inherits Jugador{
	
		constructor(_skills,_peso,_fuerza,_escoba) = super(_skills,_peso,_fuerza,_escoba)
		
	
	override method reflejo() = super() + 20
	
	override method habilidad() = super() + self.reflejo() + fuerza 
	
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
	
			constructor( _skills,_peso, _fuerza, _escoba,_vision ) = super( _skills,_peso, _fuerza, _escoba )
	{
		vision = _vision
	}
	
	
	override method habilidad() = super() + self.reflejo() * vision 

}
