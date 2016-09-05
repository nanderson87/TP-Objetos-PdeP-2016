/**
 * 
 */
 
class Infecciosa {
	var infectado
	var celulasAmenazadas
	
	method afectar(){
		infectado.aumentarTemperatura(celulasAmenazadas/1000);
	}
	
	method esAgresiva() {
		return celulasAmenazadas >= infectado.cantidadDeCelulas() * 0.1
	}
	
	method reproducirse(){
		celulasAmenazadas *= 2 
	}

	method infectar(persona) {
		infectado = persona
	}		
	

	method setCelulasAmenazadas(_celulasAmenazadas){
		celulasAmenazadas = _celulasAmenazadas;
	}
	method getCelulasAmenazadas(){
		return celulasAmenazadas
	}
}

class Autoinmune {
	var celulasAmenazadas
	var diasInfectados
	var infectado
	
	method infectar(persona) {
		infectado = persona
	}
	
	method afectar(){
		infectado.destruirCelulas(celulasAmenazadas)
	}
		
	
	method setCelulasAmenazadas(_celulasAmenazadas){
		celulasAmenazadas = _celulasAmenazadas;
	}
	
	method esAgresiva() = diasInfectados >= 30
}

class Persona {
	var temperatura
	var cantidadDeCelulas
	var nombre
	var enfermedadesContraidas = []
	
	method vivirDia(){
		enfermedadesContraidas.foreach({d => d.afectar(self)})
	}
	
	method destruirCelulas(celulasAmenazadas){
		cantidadDeCelulas -= celulasAmenazadas
	}
	
	method aumentarTemperatura(temperaturaAAumentar){ 
		temperatura = (temperatura + temperaturaAAumentar).min(45)
	}
	
	method enComa(_temperatura){
		return temperatura == 45
	}
	
	method contraerEnfermedad(enfermedad){
		enfermedadesContraidas.add(enfermedad.getNombreDeEnfermedad())
	}
		
}