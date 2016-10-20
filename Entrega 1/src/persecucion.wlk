object persecucion { 
	
	method realizate(unJugador) {		
		
		metros = unJugador.aumentaTuRecorrido()
		if (metros >= 5000) {
			unJugador.haceGanarATuEquipo() && unJugador.aumentaTusSkills()
		}	 
	}
	
	method encontreLaSnitch() = true
}
