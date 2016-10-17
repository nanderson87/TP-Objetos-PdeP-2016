import escobas.*
import posicionJugador.*
import equipo.*
import mercadoDeEscobas.*

class Jugador {
	var skills
	var peso
	var fuerza
	var escoba
	var miEquipo		//TODO a ser seteado por el constructor de equipo
	var tengoQuaffle
	
	 
	constructor( _skills,_peso, _fuerza, _escoba, _miEquipo, _tengoQuaffle ){
		
		skills = _skills
		peso = _peso
		fuerza = _fuerza
		escoba = _escoba
		miEquipo = _miEquipo
		tengoQuaffle = _tengoQuaffle
		
	}
	
	method skills()= skills 

	method fuerza() = fuerza
	
	method escoba() = escoba
	
	method miEquipo() = miEquipo			
	
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
	
	method soyJugadorEstrellaContra(equipoRival) = equipoRival.all({j => self.lePasaElTrapo(j)}) 
	
	method hacerJugada(equipoRival)
	
	method blancoUtil(equipoRival) = self.soyJugadorEstrellaContra(equipoRival)
	
	method puedeBloquear() //TODO, los buscadores tienen que hacerle un override y retornar false
	
}