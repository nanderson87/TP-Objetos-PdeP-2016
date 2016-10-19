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
		jugadores.forEach({jugador=>jugador.miEquipo(self)})
	}
	
	method jugadores() = jugadores
			
	method ganarPuntos(cuantos){
		puntaje += cuantos
	}
	
	method habilidadPromedio() = jugadores.sum({unJugador => unJugador.habilidad()}) / jugadores.size()
	
	method jugadoresGrosos() = jugadores.filter({unJugador => unJugador.soyGroso(self)})
		
	method tieneLaQuaffle() = jugadores.any({jugador=>jugador.tieneLaQuaffle()})
	
	method jugadoresPuedenObtenerQuaffle() = jugadores.filter({jugador=>jugador.puedoObtenerQuaffle()})
	
	method obtenerLaQuaffle(){
		self.jugadoresPuedenObtenerQuaffle().max({jugador=>jugador.velocidad()}).obtenerLaQuaffle()
	}

	method jugadorEstrellaContra(equipoRival) = jugadores.any({j => j.soyJugadorEstrellaContra(equipoRival)})

	method ordenarPorMasVeloz() = jugadores.sortedBy({unJugador, otroJugador => unJugador.velocidad() > otroJugador.velocidad()})
	
<<<<<<< HEAD
	method quienBloqueaACazador(cazador) 
		{
					var lOrdenada = self.ordenarPorMasVeloz()				
				
					lOrdenada = lOrdenada.filter({bloqueador => bloqueador.puedeBloquear(cazador)})		
					return lOrdenada.findOrElse({bloquea => true}, {null})
		}
	
	method equipo() = jugadores.map({unJugador => unJugador.miEquipo(self)})
	
	method bloquear(cazadorEnemigo) 
		{
					var bloqueador = self.quienBloqueaACazador(cazadorEnemigo)	
		 			if (bloqueador != null)
						{
							bloqueador.ganarSkillsPorBloqueo()
							cazadorEnemigo.skills(cazadorEnemigo.skills() - 3)				
						}
					else
						{
							cazadorEnemigo.skills(cazadorEnemigo.skills() + 5)
							cazadorEnemigo.sumarPuntaje(10)					
						}
						cazadorEnemigo.tengoQuaffle(false)						
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
=======
	method	jugadoresQuePuedenBloquearA(cazadorEnemigo){
		return self.ordenarPorMasVeloz().filter({bloqueador => bloqueador.puedeBloquear(cazadorEnemigo)})
	}
	
	method bloqueadorDe(cazadorEnemigo){
		return self.jugadoresQuePuedenBloquearA(cazadorEnemigo).findOrElse({bloquea => true}, {throw new NoPudeBloquear()})
	}
	
	method bloquear(cazadorEnemigo){
		self.bloqueadorDe(cazadorEnemigo).ganarSkillsPorBloqueo()
	}
>>>>>>> refs/remotes/origin/Entrega-2
	
}