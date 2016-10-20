import jugador.*
import suerte.*

class Busqueda {
	var turnos = 0
	
	method turnos() = turnos
	
	method aumentarTurno(){
		turnos += 1
	}
	
	method pudoEncontrarSnitch(jugador) = (1..(turnos + jugador.vision())).any({t => jugador.suerte().tieneSuerte()})  

	method hacete(jugador){
		self.aumentarTurno()
		if(self.pudoEncontrarSnitch(jugador)){
			jugador.actividad(new Persecucion())
		}
	}
	
	method cercaDeLaSnitch() = false
	
	method distancia() = 5000
}


class Persecucion {
	var metrosARecorrer = 5000

	method metrosARecorrer() = metrosARecorrer
	
	method intentarAtraparSnitch(jugador){
		if(metrosARecorrer <= 0){
			jugador.atraparSnitch()
		}
	}
	
	method pudoEncontrarSnitch(jugador) = true
	
	method hacete(jugador){
		self.perseguirSnitch(jugador.velocidad()* 2)
		self.intentarAtraparSnitch(jugador)
	}

	method perseguirSnitch(metros){
		metrosARecorrer = (metrosARecorrer - metros).max(0)
	}

	method cercaDeLaSnitch() =  metrosARecorrer < 1000
	
	method distancia() = metrosARecorrer
	
	method distancia(cuanto){
		metrosARecorrer = cuanto
	}
}
