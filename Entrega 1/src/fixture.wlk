import jugador.*
import escobas.*
import equipo.*
import posicionJugador.*
import mercadoDeEscobas.*

object fixture {
	var angelinaJohnson  = new Cazador(40, 55, 40, saetaDeFuego, null, false, 3)
	var fredWeasley = new Golpeador( 80, 80, 90, new Nimbus(2001, 80), null, false, 18)
	var katieBell = new Cazador( 45, 60, 30, saetaDeFuego, null, false, 4)
	var georgeWeasley = new Golpeador( 70, 80, 70, new Nimbus(2001, 50), null, false, 17)
	var ginnyWeasley = new Cazador( 50, 50, 40, new Nimbus(2000, 50), null, false, 5)
	var ronWeasley = new Guardian( 30, 60, 50, new Nimbus(2000, 50), null, false)
	var harryPotter = new Buscador( 30, 60, 50, saetaDeFuego, null, false, 2, 0)
	
	var adrianPucey  = new Cazador( 30, 80, 70, new Nimbus(2000, 70), null, false, 4)
	var vincentCrabbe = new Golpeador( 80, 75, 80, saetaDeFuego, null, false, 8)
	var grahamMontague = new Cazador( 35, 65, 85, saetaDeFuego, null, false, 6)
	var gregoryGoyle = new Golpeador( 70, 65, 90, saetaDeFuego, null, false, 15)
	var warrington = new Cazador( 32, 50, 70, saetaDeFuego, null, false, 5)
	var milesBletchley = new Guardian( 20, 80, 50, saetaDeFuego, null, false)
	var dracoMalfoy = new Buscador( 27, 50, 30, new Nimbus(2001, 100), null, false, 7, 0)
	
	
	var slytherin = new Equipo( [adrianPucey, vincentCrabbe, grahamMontague, gregoryGoyle, warrington, milesBletchley,dracoMalfoy])
	
	var gryffindor = new Equipo( [angelinaJohnson, fredWeasley, katieBell, georgeWeasley, ginnyWeasley, ronWeasley,harryPotter])
	
	method gryffindor() = gryffindor
	
	method slytherin() = slytherin
	
	method angelinaJohnson() = angelinaJohnson
	
	method fredWeasley() = fredWeasley
	
	method katieBell() = katieBell
	
	method georgeWeasley() = georgeWeasley
	
	method ginnyWeasley() = ginnyWeasley
	
	method ronWeasley() = ronWeasley
	
	method harryPotter() = harryPotter
	
	method adrianPucey() = adrianPucey
	
	method vincentCrabbe() = vincentCrabbe
	
	method grahamMontague() = grahamMontague
	
	method gregoryGoyle() = gregoryGoyle
	
	method warrington() = warrington
	
	method milesBletchley() = milesBletchley
	
	method dracoMalfoy() = dracoMalfoy
	
	
}
