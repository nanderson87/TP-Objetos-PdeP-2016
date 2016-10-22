class Nimbus{
	var modelo
	var salud
	
	constructor(c_modelo,c_salud) {
		modelo = c_modelo
		salud = c_salud
	}
	
	method salud()= salud
	
	method velocidad(){
		return (80 - (new Date().year() - modelo)) * (salud/100)
	}
	
	method golpearPorBludger(){
		salud -= 10
	}
}

object saetaDeFuego{
	var velocidad = 100
	
	method velocidad() = velocidad
	
	method golpearPorBludger() {}
	
}