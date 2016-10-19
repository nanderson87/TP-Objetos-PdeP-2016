import jugador.*
import equipo.*
import suerte.*


class Cazador inherits Jugador {
	var punteria
	
	
	constructor( _skills,_peso, _fuerza, _escoba,_punteria ) = super( _skills,_peso, _fuerza, _escoba )
	{
		punteria = _punteria
	}
	
	override method habilidad() = super() + punteria * fuerza

}

class Guardian inherits Jugador{
	
	constructor(_skills,_peso,_fuerza,_escoba,_miEquipo, _tengoQuaffle) = super(_skills,_peso,_fuerza,_escoba, _miEquipo, _tengoQuaffle)
		
	override method reflejo() = super() + 20
	
	override method habilidad() = super() + self.reflejo() + fuerza 
	
	override method hacerJugada(equipoRival){}
	
	method bloquear(){
		skills += 10
	}
	
	override method blancoUtil( equipoRival ) = super( equipoRival ) or !self.miEquipo().tieneLaQuaffle()
	
}

class Golpeador inherits Jugador{
	var punteria
		constructor( _skills,_peso, _fuerza, _escoba, _miEquipo,_tengoQuaffle, _punteria ) = super( _skills,_peso, _fuerza, _escoba, _miEquipo, _tengoQuaffle)
	{
		punteria = _punteria
	}
	
	override method habilidad() = super()+ punteria + fuerza
	
	override method hacerJugada(equipoRival) {
		var miBlanco = equipoRival.filter({j => j.blancoUtil(self.miEquipo())}).max({b => b.habilidad()})
		if (( miBlanco.reflejo() < punteria ) or suerte.tieneSuerte()){
			miBlanco.golpearPorBludger()
			skills += 5 
		}
	}
	
	method bloquear() {
		skills += 3
	}

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
