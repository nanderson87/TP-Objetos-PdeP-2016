import escobas.*
import posicionJugador.*

class Jugador {
	var skills
	var peso
	var fuerza
	var escoba
	 
	constructor( _skills,_peso, _fuerza, _escoba ){
		
		skills = _skills
		peso = _peso
		fuerza = _fuerza
		escoba = _escoba
		
	}
	
	method skills()= skills 

	method fuerza() = fuerza
	
	method escoba() = escoba			
	
	method nivelManejoDeEscoba() = (skills * 1.0) / peso

	method velocidad()= escoba.velocidad() * self.nivelManejoDeEscoba() 
	
	method habilidad() = self.velocidad() + self.skills()

	method reflejo() = ( self.velocidad() * self.skills() / 100 )

	method golpearPorBludger() {
		skills -= 2
		escoba.golpearPorBludger() 
	} 
	
	method lePasaElTrapo(jugador) = self.habilidad() >= (jugador.habilidad()) * 2 
	
}