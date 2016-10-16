import jugador.*
import persecucion.*

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
	var metrosRecorridos
	var vision
	var actividad	// Un objeto para busqueda y otro para persecucion
	
			constructor( _skills,_peso, _fuerza, _escoba,_metrosRecorridos, _vision, _actividad ) = super( _skills,_peso, _fuerza, _escoba )
	{
		vision = _vision
		metrosRecorridos = _metrosRecorridos
		actividad = _actividad
	}
	
	//getters
	method vision() = vision
	method metrosRecorridos() = metrosRecorridos
	 //
	 
	 
	method aumentaTuRecorrido(){
		metrosRecorridos = 2* self.velocidad()
		return metrosRecorridos
	}
	
	method aumentaTusSkills() {
		self.skills() += 30
	}
	
	method haceGanarATuEquipo(){
		self.miEquipo().aumentaTuPuntaje()
	}
	
	method encontreLaSnitch(){
		return actividad.encontreLaSnitch()
	}
	
	//override methods
	override method golpearPorBludger(){
		super()
		if (self.soyGroso(unEquipo)){
			//quedoAturdidoEnLaAct
		}
		else
			metrosRecorridos = 0
			//objetoBusqueda.realizate(self)
		
	}
	
	
	override method habilidad() = super() + self.reflejo() * vision 
	override method puedeBloquear() = false
	override method hacerJugada(unEquipo) = actividad.realizate(self)

}

