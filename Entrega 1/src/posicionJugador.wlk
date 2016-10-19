import jugador.*
import equipo.*
import suerte.*
import exceptions.*

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
	
	method perderQuaffleContra(equipo){
		if(!tengoQuaffle){
			throw new NoTengoQuaffle()
		}
		tengoQuaffle = false
		equipo.obtenerLaQuaffle()
	}
	
	override method golpearPorBludger(rival){
		super(rival)
		if(tengoQuaffle){
			self.perderQuaffleContra(rival.miEquipo())
		}
	}
	
	override method blancoUtil(equipoRival) = super(equipoRival) || self.tengoQuaffle()
	
	override method hacerJugada(equipoRival){
		if(tengoQuaffle){
			self.perderQuaffleContra(equipoRival)
			try{
				equipoRival.bloquear(self)
				self.perderSkills(3)
			}catch e:NoPudeBloquear{
				self.hacerGol()
			}
		}
	}
	
	method hacerGol(){
		self.aumentarSkills(5)
		miEquipo.ganarPuntos(10)
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
	
	override method hacerJugada(equipoRival){}
	
	override method bloquear(){
		self.aumentarSkills(10)
	}
	
	override method blancoUtil( equipoRival ) = super( equipoRival ) or !self.miEquipo().tieneLaQuaffle()
	
}

class Golpeador inherits Jugador{
	var punteria
	
	constructor(_skills,_peso,_fuerza,_escoba,_punteria) = super(_skills,_peso,_fuerza,_escoba){
		punteria = _punteria
	}
	
	override method habilidad() = super()+ punteria + fuerza
	
	override method hacerJugada(equipoRival) {
		var miBlanco = equipoRival.filter({j => j.blancoUtil(self.miEquipo())}).max({b => b.habilidad()})
		if (( miBlanco.reflejo() < punteria ) or suerte.tieneSuerte()){
			miBlanco.golpearPorBludger()
			self.aumentarSkills(5)  
		}
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
	
	override method puedeBloquear(cazadorEnemigo) = false 

}
