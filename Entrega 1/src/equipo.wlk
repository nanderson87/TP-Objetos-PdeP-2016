import jugador.*
import mercadoDeEscobas.*
import escobas.*
import posicionJugador.*

class Equipo {
	var jugadores
	var puntaje = 0
	
	constructor (_jugadores ){
		jugadores = _jugadores
		self.equipo()
	}
	
	method jugadores() = jugadores
	
	method habilidadPromedio() = jugadores.sum({unJugador => unJugador.habilidad()}) / jugadores.size()
	
	method jugadoresGrosos() = jugadores.filter({unJugador => unJugador.soyGroso(self)})
	
	method jugadorEstrellaContra(equipoRival) = jugadores.any({d => equipoRival.jugadores().all({e => d.lePasaElTrapo(e)})})
	
	method ordenarPorMasVeloz() = jugadores.sortedBy({unJugador, otroJugador => unJugador.velocidad() > otroJugador.velocidad()})
	
	method equipo() = jugadores.map({unJugador => unJugador.miEquipo(self)})
	
	method bloquear(cazadorEnemigo) 
		{
			var lOrdenada = new List()
			var bloqueador 
			lOrdenada = self.ordenarPorMasVeloz()	
		
			lOrdenada = lOrdenada.filter({bloqueador => bloqueador.puedeBloquear(cazadorEnemigo)})		
			bloqueador = lOrdenada.findOrElse({bloquea => true}, {null})
		
 			if (bloqueador != null)
				{
					bloqueador.ganarSkillsPorBloqueo()
					cazadorEnemigo.skills(cazadorEnemigo.skills() - 3)
					cazadorEnemigo.tengoQuaffle(false)
				}
			else
				{
					cazadorEnemigo.skills(cazadorEnemigo.skills() + 5)
					cazadorEnemigo.tengoQuaffle(false)
				}
		}
	//OJO!!! SOLO PARA DEBUGEAR SI SE SUMAN SKILLS!!!!!!!!
	//LEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
	//LEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
	//LEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
	//LEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
	method __bloquear(sbloqueador,cazadorEnemigo) 
		{
					sbloqueador.ganarSkillsPorBloqueo()
					cazadorEnemigo.skills(cazadorEnemigo.skills() - 3)
					cazadorEnemigo.tengoQuaffle(false)
		}	
	//LEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
	//OJO!!! SOLO PARA DEBUGEAR SI SE SUMAN SKILLS!!!!!!!!
	
}