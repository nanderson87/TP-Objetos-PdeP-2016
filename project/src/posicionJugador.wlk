import jugador.*
import actividades.*
import exceptions.*
import suerte.*

class Cazador inherits Jugador {
	var punteria
	
	
	constructor(_skills,_peso,_fuerza,_escoba,_punteria) = super(_skills,_peso,_fuerza,_escoba){
		punteria = _punteria
	}
	
	override method habilidad() = super() + punteria * fuerza
	
	override method puedeObtenerQuaffle() = true
	
	method obtenerQuaffle(){
		tieneQuaffle = true
	}
	
	override method golpearPorBludger(rival){
		super(rival)
		if(tieneQuaffle){
			self.perderQuaffleContra(rival.miEquipo())
		}
	}
	
	override method blancoUtil(equipo) = super(equipo) || tieneQuaffle
	
	override method hacerJugada(equipoRival){
		if(tieneQuaffle){
			try{
				equipoRival.bloquear(self)
			} catch e:NoPudeBloquear{
				self.hacerGol()
			}
			self.perderQuaffleContra(equipoRival)
		}
	}

	method bloqueado(){
		self.perderSkills(3)
	}
	
	method hacerGol(){
		miEquipo.ganarPuntos(10)
		self.ganarSkills(5)
	}
}

class Guardian inherits Jugador{

	constructor(_skills,_peso,_fuerza,_escoba) = super(_skills,_peso,_fuerza,_escoba)

	override method reflejo() = super() + 20

	override method habilidad() = super() + self.reflejo() + fuerza

	override method puedeObtenerQuaffle() = true

	method obtenerQuaffle(){
		self.miEquipo().jugadoresQueObtienenQuaffle().filter({j=>j != self}).max({j=>j.habilidad()}).obtenerQuaffle()
	}

	override method blancoUtil(equipo) = super(equipo) || !miEquipo.tieneQuaffle()

	override method bloquear(rival){
		self.ganarSkills(10)
		rival.bloqueado()
	}

	override method hacerJugada(equipoRival){}
}

class Golpeador inherits Jugador{
	var punteria
		constructor(_skills,_peso,_fuerza, _escoba,_punteria) = super(_skills,_peso,_fuerza,_escoba){
		punteria = _punteria
	}
	
	override method habilidad() = super()+ punteria + fuerza
	
	override method hacerJugada(equipoRival){
		if(self.puedoGolpear(self.mejorBlanco(equipoRival))){
			self.mejorBlanco(equipoRival).golpearPorBludger(self)
			self.ganarSkills(5)
		}
	}
	
	method mejorBlanco(equipoRival) = equipoRival.jugadores().filter({j=>j.blancoUtil(miEquipo)}).max({j=>j.habilidad()})

	method puedoGolpear(blanco) = blanco.reflejo() < punteria || suerte.tieneSuerte()
}

class Buscador  inherits Jugador{
	var vision
	var actividad
	
	constructor(_skills,_peso,_fuerza,_escoba,_vision ) = super(_skills,_peso,_fuerza,_escoba ){
		vision = _vision
		actividad = new Busqueda()
	}
	
	method actividad() = actividad
	method vision() = vision
	
	method actividad(cual){
		actividad = cual
	}
	
	override method habilidad() = super() + self.reflejo() * vision
	
	override method hacerJugada(equipoRival){
		actividad.hacete(self)
	}

	override method golpearPorBludger(rival){
		super(rival)
		if(self.soyGroso(miEquipo)){
			self.actividad(new Aturdido(actividad))
		}
		else{
			self.actividad(new Busqueda())
		}
	}
	
	method atraparSnitch(){
		miEquipo.ganarPuntos(150)
		self.ganarSkills(30)
	}
	
	method encontroSnitch() = actividad.encontroSnitch()
	
	override method blancoUtil(equipo) = super(equipo) || (self.encontroSnitch() && actividad.distancia() < 1000)
	
	override method puedoBloquear(rival) = false
}
