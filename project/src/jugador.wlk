import escobas.*
import posicionJugador.*
import equipo.*
import mercadoDeEscobas.*
import exceptions.*
import suerte.*

class Jugador {
	var skills
	var peso
	var fuerza
	var escoba
	var tieneQuaffle = false
	var miEquipo
	
	 
	constructor( _skills,_peso, _fuerza, _escoba ){
		
		skills = _skills
		peso = _peso
		fuerza = _fuerza
		escoba = _escoba
		
	}
	
	method skills()= skills
	method fuerza() = fuerza
	method escoba() = escoba
	method tieneQuaffle() = tieneQuaffle
	method miEquipo() = miEquipo
	
	method miEquipo(cual){
		miEquipo = cual
	}
	method ganarSkills(cuantos){
		skills += cuantos
	}
	method perderSkills(cuantos){
		skills -= cuantos
	}
	method escoba(cual){
		escoba = cual
	}
	
	method nivelManejoDeEscoba() = skills / peso

	method velocidad()= escoba.velocidad() * self.nivelManejoDeEscoba()
	
	method habilidad() = self.velocidad() + self.skills()

	method reflejo() = (self.velocidad() * self.skills() / 100)
	
	method soyGroso(equipo) =  self.habilidad() > equipo.habilidadPromedio() && self.velocidad() >=  mercadoDeEscobas.velocidadEstablecida()

	method golpearPorBludger(rival){
		skills -= 2
		escoba.golpearPorBludger() 
	} 
	
	method lePasaElTrapo(jugador) = self.habilidad() >= (jugador.habilidad()) * 2 
		
	method puedeObtenerQuaffle() = false
	
	method perderQuaffleContra(equipo){
		if (!self.tieneQuaffle()){
			throw new NoTengoQuaffle()
		}
		tieneQuaffle = false
		equipo.obtenerQuaffle()
	}
	
	method jugadorEstrellaContra(equipo) = equipo.jugadores().all({r=>self.lePasaElTrapo(r)})
	
	method hacerJugada(equipoRival)
	
	method blancoUtil(equipo) = self.jugadorEstrellaContra(equipo)
	
	method puedoBloquear(rival) = self.lePasaElTrapo(rival) || suerte.tieneSuerte()
	
	method bloquear(rival){
		self.ganarSkills(3)
		rival.bloqueado()
	}
}