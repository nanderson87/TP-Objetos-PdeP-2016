import jugador.*
import escobas.*
import equipo.*
import posicionJugador.*
import mercadoDeEscobas.*

object fixture {
	var angelinaJohnson  = new Jugador(cazador, 40, 55, 40, saetaDeFuego, 3)
	var fredWeasley = new Jugador(golpeador, 80, 80, 90, new Nimbus(2001, 80), 18)
	var katieBell = new Jugador(cazador, 45, 60, 30, saetaDeFuego, 4)
	var georgeWeasley = new Jugador(golpeador, 70, 80, 70, new Nimbus(2001, 50), 17)
	var ginnyWeasley = new Jugador(cazador, 50, 50, 40, new Nimbus(2000, 50), 5)
	var ronWeasley = new Jugador(guardian, 30, 60, 50, new Nimbus(2000, 50), 0)
	var harryPotter = new Jugador(buscador, 30, 60, 50, saetaDeFuego, 2)
	
	var adrianPucey  = new Jugador(cazador, 30, 80, 70, new Nimbus(2000, 70), 4)
	var vincentCrabbe = new Jugador(golpeador, 80, 75, 80, saetaDeFuego, 8)
	var grahamMontague = new Jugador(cazador, 35, 65, 85, saetaDeFuego, 6)
	var gregoryGoyle = new Jugador(golpeador, 70, 65, 90, saetaDeFuego, 15)
	var warrington = new Jugador(cazador, 32, 50, 70, saetaDeFuego, 5)
	var milesBletchley = new Jugador(guardian, 20, 80, 50, saetaDeFuego, 0)
	var dracoMalfoy = new Jugador(buscador, 27, 50, 30, new Nimbus(2001, 100), 7)
	
	
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
