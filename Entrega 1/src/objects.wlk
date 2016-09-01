class Nimbus {
	var modelo
	var salud
	
	constructor(c_modelo,c_salud) {
		modelo = c_modelo
		salud = c_salud
	}
	
	method velocidad() {
		return (80 - (new Date().year() - modelo)) * ((1.0* salud)/100)
	}
	
	method golpear() {
		salud -= 10
	}
}

object saetaDeFuego {
	
	method velocidad() = 100
	
	method golpear() {}
	
}