import jugador.*
import mercadoDeEscobas.*
import escobas.*
import posicionJugador.*
import exceptions.*

class Equipo {
	var jugadores
	var puntos = 0
	
	constructor (_jugadores ){
		jugadores = _jugadores
		jugadores.map({j=>j.miEquipo(self)})
	}
	
	method jugadores() = jugadores
	method puntos() = puntos
	
	method ganarPuntos(cuantos){
		puntos += cuantos
	}
	
	method habilidadPromedio() = jugadores.sum({unJugador => unJugador.habilidad()}) / jugadores.size()
	
	method jugadoresGrosos() = jugadores.filter({unJugador => unJugador.soyGroso(self)})
	
	method jugadorEstrellaContra(equipoRival) = jugadores.any({j=>j.jugadorEstrellaContra(equipoRival)})
	
	method tieneQuaffle() = jugadores.any({j=>j.tieneQuaffle()})
	
	method jugadoresQueObtienenQuaffle() = jugadores.filter({j=>j.puedeObtenerQuaffle()})
	
	method obtenerQuaffle(){
		if(self.tieneQuaffle()){
			throw new YaTengoQuaffle()
		}
		self.jugadoresQueObtienenQuaffle().max({j=>j.velocidad()}).obtenerQuaffle()
	}
	
	method bloquear(rival){
		self.bloqueadorDe(rival).bloquear()
	}
	
	method jugadoresPuedenBloquearA(rival) = jugadores.filter({j=>j.puedoBloquear(rival)}).sortedBy({j1,j2=>j1.velocidad() > j2.velocidad()})

	method bloqueadorDe(rival) = self.jugadoresPuedenBloquearA(rival).findOrElse({=>true},{throw new NoPudeBloquear()})
}