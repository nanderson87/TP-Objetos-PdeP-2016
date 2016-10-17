import jugador.*
import mercadoDeEscobas.*
import escobas.*
import posicionJugador.*

class Equipo {
	var jugadores
	var puntaje = 0
	
	constructor (_jugadores ){
		jugadores = _jugadores
		jugadores.forEach({jugador=>jugador.miEquipo(self)})
		 
	}
	
	method jugadores() = jugadores
	
	method habilidadPromedio() = jugadores.sum({unJugador => unJugador.habilidad()}) / jugadores.size()
	
	method jugadoresGrosos() = jugadores.filter({unJugador => unJugador.soyGroso(self)})
		
	method tieneLaQuaffle() = jugadores.any({jugador=>jugador.tieneLaQuaffle()})
	
	method jugadoresPuedenObtenerQuaffle() = jugadores.filter({jugador=>jugador.puedoObtenerQuaffle()})
	
	method obtenerLaQuaffle(){
		self.jugadoresPuedenObtenerQuaffle().max({jugador=>jugador.velocidad()}).obtenerLaQuaffle()
	}

	method jugadorEstrellaContra(equipoRival) = jugadores.any({j => j.soyJugadorEstrellaContra(equipoRival)})
}