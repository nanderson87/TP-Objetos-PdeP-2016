import jugador.*
import mercadoDeEscobas.*
import escobas.*
import posicionJugador.*

class Equipo {
	var jugadores
	
	constructor (_jugadores ){
		jugadores = _jugadores
		 
	}
	
	method jugadores() = jugadores
	
	method habilidadPromedio() = jugadores.sum({unJugador => unJugador.habilidad()}) / jugadores.size()
	
	method jugadoresGrosos() = jugadores.filter({unJugador => unJugador.soyGroso(self)})
	
	method jugadorEstrellaContra(equipoRival) = jugadores.any({d => equipoRival.jugadores().all({e => d.lePasaElTrapo(e)})})
	
}