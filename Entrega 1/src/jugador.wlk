import escobas.*
import posicionJugador.*
import equipo.*
import mercadoDeEscobas.*

class Jugador {
	var skills
	var peso
	var fuerza
	var escoba
	var miEquipo
	var tengoQuaffle = false
	
	 
	constructor( _skills,_peso, _fuerza, _escoba ){
		
		skills = _skills
		peso = _peso
		fuerza = _fuerza
		escoba = _escoba
		
	}
	
	method skills()= skills 

	method fuerza() = fuerza
	
	method escoba() = escoba	
	
	method miEquipo() = miEquipo
	
	method miEquipo(cual){
		miEquipo = cual
	}		
	
	method nivelManejoDeEscoba() = skills / peso

	method velocidad()= escoba.velocidad() * self.nivelManejoDeEscoba() 
	
	method habilidad() = self.velocidad() + self.skills()

	method reflejo() = ( self.velocidad() * self.skills() / 100 )
	
	method soyGroso(equipo) =  self.habilidad() > equipo.habilidadPromedio() && self.velocidad() >=  mercadoDeEscobas.velocidadEstablecida()

	method golpearPorBludger(rival) {
		skills -= 2
		escoba.golpearPorBludger() 
	} 
	
	method lePasaElTrapo(jugador) = self.habilidad() >= (jugador.habilidad()) * 2 
	
	method tieneLaQuaffle() = tengoQuaffle
	
	method puedoObtenerQuaffle() = false
	
	method hacerJugada()
	
	method blancoUtil()
	
	method puedeBloquear() //TODO, los buscadores tienen que hacerle un override y retornar false
	
}