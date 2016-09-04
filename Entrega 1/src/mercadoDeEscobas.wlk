
object mercadoDeEscobas {
	
	var velocidadMinimaEstablecida = 50

	method velocidadEstablecida() = velocidadMinimaEstablecida
	
	method velocidadEstablecida( velocidad ){
		velocidadMinimaEstablecida = velocidad
	}

}