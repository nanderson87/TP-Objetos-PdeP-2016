import escobas.*
import posicionJugador.*

class Jugador {
	var posicion
	var skills
	var peso
	var fuerza
	var escoba
	var otrasHabilidades
	 
	constructor( _posicion, _skills,_peso, _fuerza, _escoba, _otrasHabilidades ){
		
		posicion = _posicion 
		skills = _skills
		peso = _peso
		fuerza = _fuerza
		escoba = _escoba
		otrasHabilidades = _otrasHabilidades
		
	}
	
	method skills()= skills 
		
	method peso() =peso

	method fuerza() = fuerza
	
	method escoba() = escoba
			
	method otrasHabilidades() = otrasHabilidades
	
	method nivelManejoDeEscoba() = (skills * 1.0) / peso

	method velocidad()= escoba.velocidad() * self.nivelManejoDeEscoba() 
	
	method habilidad() = posicion.suHabilidadEs(self)

	method reflejo() = posicion.suReflejoEs(self)

	method golpearPorBludger() {
		skills -= 2
		escoba.golpearPorBludger() 
	} 
	
	method lePasaElTrapo(jugador) = self.habilidad() >= (jugador.habilidad()) * 2 
	
}