import jugador.*
import mercadoDeEscobas.*
import escobas.*
import posicionJugador.*
import exceptions.*

class Equipo {
	var jugadores
	var puntaje = 0
	
	constructor (_jugadores ){
		jugadores = _jugadores
		jugadores.forEach({ jugador=>jugador.miEquipo(self) })
	}
	
	method jugadores() = jugadores
	
	method puntaje() = puntaje
	
	method habilidadPromedio() = jugadores.sum({ unJugador => unJugador.habilidad() }) / jugadores.size()
	
	method jugadoresGrosos() = jugadores.filter({ unJugador => unJugador.soyGroso(self) })
		
	method tieneLaQuaffle() = jugadores.any({ jugador => jugador.tieneLaQuaffle() })
	
	method jugadoresPuedenObtenerQuaffle() = jugadores.filter({ jugador => jugador.puedoObtenerQuaffle() })
	
	method obtenerLaQuaffle(){
		self.jugadoresPuedenObtenerQuaffle().max({ jugador => jugador.velocidad() }).obtenerLaQuaffle()
	}

	method jugadorEstrellaContra(equipoRival) = jugadores.any({
		j => j.soyJugadorEstrellaContra(equipoRival)
	})

	method ordenarPorMasVeloz() = jugadores.sortedBy({
		unJugador, otroJugador => unJugador.velocidad() > otroJugador.velocidad()
	})
	
	method	jugadoresQuePuedenBloquearA(cazadorEnemigo){
		return self.ordenarPorMasVeloz().filter({ bloqueador => bloqueador.puedeBloquear(cazadorEnemigo) })
	}
	
	method bloqueadorDe(cazadorEnemigo) {
		return self.jugadoresQuePuedenBloquearA(cazadorEnemigo).findOrElse(
			{ bloquea => true }, { throw new NoPudeBloquear() }
		)
	}
	
	method bloquear(cazadorEnemigo) {
		self.bloqueadorDe(cazadorEnemigo).ganarSkillsPorBloqueo()
	}
		
	method ganarPuntos(cuantos) {
		puntaje += cuantos
	}
	
	method suerte(cual){
		jugadores.map({d=>d.suerte(cual)})
	}
 }