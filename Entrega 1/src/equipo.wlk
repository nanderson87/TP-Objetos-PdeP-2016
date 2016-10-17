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
	
	method jugadorEstrellaContra(equipoRival) = jugadores.any({d => equipoRival.jugadores().all({e => d.lePasaElTrapo(e)})})
	
	method tieneLaQuaffle() = jugadores.any({jugador=>jugador.tieneLaQuaffle()})
	
	method jugadoresPuedenObtenerQuaffle() = jugadores.filter({jugador=>jugador.puedoObtenerQuaffle()})
	
	method obtenerLaQuaffle(){
		self.jugadoresPuedenObtenerQuaffle().max({jugador=>jugador.velocidad()}).obtenerLaQuaffle()
	}
}