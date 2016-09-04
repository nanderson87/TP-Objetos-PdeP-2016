import jugador.*
import mercadoDeEscobas.*

class Equipo {
	var jugadores
	
	constructor (_jugadores ){
		jugadores = _jugadores
		 
	}
	
	method jugadores() = jugadores
	
	method habilidadPromedio() = jugadores.sum({unJugador => unJugador.habilidad()}) / jugadores.size()
	
	method jugadoresGrosos() = jugadores.filter({unJugador => unJugador.habilidad() > self.habilidadPromedio() && unJugador.velocidad() >=  mercadoDeEscobas.velocidadEstablecida()})
	
	method unJugadorLePasaElTrapoA(jugador, unEquipo) = unEquipo.all({unRival => jugador.lePasaElTrapo(unRival)}) 
	
	//No le pude encontrar la vuelta
	method jugadorEstrellaContra(equipoRival) = jugadores.any({jugador => self.unJugadorLePasaElTrapoA(jugador, equipoRival)})
	
}