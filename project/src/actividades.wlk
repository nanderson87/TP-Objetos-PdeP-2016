import suerte.*

class Busqueda{
	var turnos = 0
	
	method turnos() = turnos
	
	method aumentarTurno(){
		turnos += 1
	}
	
	method hacete(jugador){
		self.aumentarTurno()
		if((1..(turnos - jugador.vision())).any({=>suerte.tieneSuerte()})){
			jugador.actividad(new Persecucion())
		}
	}
	
	method encontroSnitch() = false
}

class Persecucion{
	var distanciaARecorrer = 5000
	
	method distancia() = distanciaARecorrer
	
	method distancia(cual){
		distanciaARecorrer = cual
	}
	
	method hacete(jugador){
		distanciaARecorrer = (distanciaARecorrer - jugador.velocidad() * 2).max(0)
		self.atraparSnitch(jugador)
	}
	
	method atraparSnitch(jugador){
		if (distanciaARecorrer == 0){
			jugador.atraparSnitch()
		}
	}
	
	method encontroSnitch() = true
}

class Aturdido{
	var actividadAnterior
	
	constructor(_actividadAnterior){
		actividadAnterior = _actividadAnterior
	}
	
	method hacete(jugador){
		jugador.actividad(actividadAnterior)
	}
	
	method encontroSnitch() = actividadAnterior.encontroSnitch()
}