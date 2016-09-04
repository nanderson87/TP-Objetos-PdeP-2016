import jugador.*

object cazador {
	
	method suReflejoEs(jugador) = jugador.velocidad() * jugador.skills() / 100
		
	method suHabilidadEs(jugador) = jugador.velocidad() + jugador.skills() + jugador.otrasHabilidades() * jugador.fuerza()

}

object guardian {
	
	method suReflejoEs(jugador)= ( jugador.velocidad() * jugador.skills() / 100 ) + 20
	
	method suHabilidadEs(jugador) = jugador.velocidad() + jugador.skills() + jugador.reflejo() + jugador.fuerza() 
	
}

object golpeador {
	
	method suReflejoEs(jugador)=  jugador.velocidad() * jugador.skills() / 100
	
	method suHabilidadEs(jugador) = jugador.velocidad() + jugador.skills() + jugador.otrasHabilidades() + jugador.fuerza() 
	
	
}

object buscador {
	
	method suReflejoEs(jugador) = jugador.velocidad() * jugador.skills() / 100 
	
	method suHabilidadEs(jugador) = jugador.velocidad() + jugador.skills() + jugador.reflejo() * jugador.otrasHabilidades() 

}
