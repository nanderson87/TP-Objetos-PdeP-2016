import escobas.*
import posicionJugador.*
import equipo.*
import mercadoDeEscobas.*
import suerte.*

class Jugador {
	var skills
	var peso
	var fuerza
	var escoba
	var miEquipo
	var tengoQuaffle = false
	
	 
	constructor( _skills,_peso, _fuerza, _escoba){
		skills = _skills
		peso = _peso
		fuerza = _fuerza
		escoba = _escoba
	}
	
	method skills() = skills 
	
	method aumentarSkills(cantidad) {
		skills += cantidad
	}
	
	method perderSkills(cantidad) {
		skills -= cantidad
	}
	
	method bloquear() {
		self.aumentarSkills(3)
	}

	method fuerza() = fuerza
	
	method escoba() = escoba	
	
	method miEquipo() = miEquipo
		
	method tieneLaQuaffle() = tengoQuaffle
	
	method skills(_skills){
		skills = _skills
	}
	
	method miEquipo(cual){
		miEquipo = cual
	}

	method nivelManejoDeEscoba() = skills / peso

	method velocidad()= escoba.velocidad() * self.nivelManejoDeEscoba() 
	
	method habilidad() = self.velocidad() + self.skills()

	method reflejo() = (self.velocidad() * self.skills() / 100)
	
	method soyGroso(equipo) =  self.habilidad() > equipo.habilidadPromedio() && self.velocidad() >=  mercadoDeEscobas.velocidadEstablecida()

	method golpearPorBludger(rival) {
		self.perderSkills(2)
		escoba.golpearPorBludger() 
	} 
	
	method lePasaElTrapo(jugador) = self.habilidad() >= (jugador.habilidad()) * 2
	
	method soyJugadorEstrellaContra(equipoRival) = equipoRival.jugadores().all({j => self.lePasaElTrapo(j)}) 
	
	method puedoObtenerQuaffle() = false

	method blancoUtil(equipoRival) = self.soyJugadorEstrellaContra(equipoRival)
	
	method puedeBloquear(cazadorEnemigo) = self.lePasaElTrapo(cazadorEnemigo) or suerte.tieneSuerte()
			
	method hacerJugada(equipoRival)
	
}
