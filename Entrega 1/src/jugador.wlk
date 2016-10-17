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
	
	 
	constructor( _skills,_peso, _fuerza, _escoba ){
		
		skills = _skills
		peso = _peso
		fuerza = _fuerza
		escoba = _escoba
	}
	
	method skills()= skills 
	
	method skills(_skills) {skills = _skills}
	
	method tengoQuaffle() = tengoQuaffle
	
	method tengoQuaffle(_tengoQuaffle) {tengoQuaffle = _tengoQuaffle}
	
	method ganarSkillsPorBloqueo() { self.skills((self.skills() + 3)) }

	method fuerza() = fuerza
	
	method escoba() = escoba			
	
	method miEquipo(_miEquipo) {miEquipo = _miEquipo}
		
	method nivelManejoDeEscoba() = skills / peso

	method velocidad()= escoba.velocidad() * self.nivelManejoDeEscoba() 
	
	method habilidad() = self.velocidad() + self.skills()

	method reflejo() = ( self.velocidad() * self.skills() / 100 )
	
	method soyGroso(equipo) =  self.habilidad() > equipo.habilidadPromedio() && self.velocidad() >=  mercadoDeEscobas.velocidadEstablecida()

	method golpearPorBludger() {
		skills -= 2
		escoba.golpearPorBludger() 
	} 
	
	method lePasaElTrapo(jugador) = self.habilidad() >= (jugador.habilidad()) * 2 
	
	method hacerJugada(equipoRival)
	
	method blancoUtil(equipoRival)

	method puedeBloquear(cazadorEnemigo) = self.lePasaElTrapo(cazadorEnemigo) || suerte.tieneSuerte()
	
}