import jugador.*
import suerte.*

class Busqueda {
	var turnos = 0
	
	method aumentarTurno(){
		turnos += 1
	}
	
	method pudoEncontrarSnitch(jugador) = (1..turnos + jugador.vision()).map(suerte.tieneSuerte()).any()   

	
	method hacete(jugador){
		self.aumentarTurno()
		if(self.pudoEncontrarSnitch(jugador)){
			jugador.actividad(new Persecucion())
		}
	}
	
	method cercaDeLaSnitch() = false
}


class Persecucion {
	var metrosARecorrer = 5000
	
	method intentarAtraparSnitch(jugador){
		if(metrosARecorrer == 0){
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
}
