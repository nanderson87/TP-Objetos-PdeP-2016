// Enfermedad

class Autoinmune {
	var vecesAfectadas
	
	method esAgresiva(persona){
		return vecesAfectadas >= 30
	}
	
}

class Infecciosa {
	var celulasAmenazadas
	
	method reproducite(){
		celulasAmenazadas *= 2
	}
	
}

class Persona {
	var enfermedades = []
	var celulas
	
	method contrae(enfermedad) {
		enfermedades.add(enfermedad)
	}
	
	method viviUnDia(){
		enfermedades.foreach({enfermedad => enfermedad.afecta(self)})
	}
}

