import jugador.*
import exceptions.*
import equipo.*
import suerte.*

class Cazador inherits Jugador {
	var punteria

	constructor( _skills,_peso, _fuerza, _escoba,_punteria ) = super(_skills,_peso,_fuerza,_escoba ) {
		punteria = _punteria
	}

	override method habilidad() = super() + punteria * fuerza

	override method puedoObtenerQuaffle() = true

	method obtenerLaQuaffle(){ tengoQuaffle = true }

	method perderQuaffleContra(equipo){
		if(!tengoQuaffle){ throw new NoTengoQuaffle() }
		tengoQuaffle = false
		equipo.obtenerLaQuaffle()
	}

	override method golpearPorBludger(rival){
		super(rival)
		if(tengoQuaffle){ self.perderQuaffleContra(rival.miEquipo()) }
	}

	override method blancoUtil(equipoRival) = super(equipoRival) || self.tengoQuaffle()

	override method hacerJugada(equipoRival){
		if(!tengoQuaffle){
			self.perderQuaffleContra(equipoRival)
			try{
				equipoRival.bloquear(self)
				self.perderSkillsPorBloqueo()
			}catch e:NoPudeBloquear{
				self.hacerGol()
			}
		}
	}

	method perderSkillsPorBloqueo(){
		skills -= 3
	}

	method hacerGol(){
		skills += 5
		miEquipo.ganarPuntos(10)
	}
}

class Guardian inherits Jugador{

	constructor(_skills,_peso,_fuerza,_escoba) = super(_skills,_peso,_fuerza,_escoba)

	override method reflejo() = super() + 20

	override method habilidad() = super() + self.reflejo() + fuerza

	override method puedoObtenerQuaffle() = true

	method obtenerLaQuaffle(){
		miEquipo.jugadoresPuedenObtenerQuaffle().filter({jugador=>jugador != self}).max({jugador=>jugador.habilidad()})
	}
	override method hacerJugada(equipoRival){}

	override method ganarSkillsPorBloqueo() {
		self.skills((self.skills() + 10))
	}
}

class Golpeador inherits Jugador{
	var punteria

	constructor(_skills,_peso,_fuerza,_escoba,_punteria) = super(_skills,_peso,_fuerza,_escoba){
		punteria = _punteria
	}

	override method habilidad() = super()+ punteria + fuerza

	override method hacerJugada(equipoRival) {
		var miBlanco = equipoRival.filter({j => j.blancoUtil(self.miEquipo())}).max({b => b.habilidad()})
		if (( miBlanco.reflejo() < punteria ) or suerte.tieneSuerte()){
			miBlanco.golpearPorBludger()
			skills += 5
		}
	}

}

/**
* El objetivo de los buscadores a lo largo del partido es encontrar y atrapar la Snitch.
**/
class Buscador  inherits Jugador{
	var vision
	var actividad = busqueda	//  Inicialmente los buscadores arrancan buscando la Snitch
	var estaAturdido = false

	constructor(_skills,_peso,_fuerza,_escoba,_vision) = super(_skills,_peso,_fuerza,_escoba) {
		vision = _vision
	}

	override method habilidad() = super() + self.reflejo() * vision

	override method puedeBloquear(cazadorEnemigo) = false

	override method hacerJugada(equipoRival) {
		if(self.estaAturdido()){
			// ¿throw estaAturdido? Si voy por este camino borrar el else
			self.recuperate()
		} else {
			actividad.hacete(self.velocidad())
			if (actividad.encontroSnitch()){ self.actividad(persecucion)}
			if (actividad.puedeAtraparLaSnitch()){ self.atrapaSnitch() }
		}
	}

	override method blancoUtil(equipoRival) = super(equipoRival) || actividad.cercaDeLaSnitch()

	override method golpearPorBludger(rival) {
		super(rival)
		if(self.soyGroso(self.miEquipo())) {
			self.aturdite();
		} else {
			self.reiniciarBusqueda()
		}
	}

	method atrapaSnitch(){
		//TODO: sumarPuntos (150)
		self.skills(self.skills() + 30)
	}

	method actividad(nuevaActividad){
		actividad = nuevaActividad
	}

	method reiniciarBusqueda(){
		actividad(busqueda)
		actividad.reset()
	}

	method estaAturdido() = estaAturdido
	method recuperate(){ estaAturdido = false }
	method aturdite(){ estaAturdido = true }

}

object busqueda {
	var encontroSnitch = false;
	var turnos = 0

	method hacete(velocidad){
		turnos++
		/* TODO: si su actividad actual es la búsqueda debe chequear tantas
		 veces como turnos lleve buscando + su nivel de visión, para
		saber si tiene suerte y así poder encontrar la Snitch.
		Si al menos una respuesta es positiva se considera que la encontró,
		y su actividad para la siguiente jugada será la persecución. */
	}

	method reset(){
		encontroSnitch = false;
		turnos = 0
	}

	method cercaDeLaSnitch() = false
	method encontroSnitch() = encontroSnitch
	method encontroSnitch(nValor) {
		encontroSnitch = nValor
	}

	method puedeAtraparLaSnitch() = false
}

object persecucion {
	var metrosARecorrer = 5000; // Una vez que la encuentran deben perseguirla 5000 metros hasta atraparla.

	method perseguirSnitch(velocidad){
		metrosARecorrer -= velocidad * 2
	}

	method hacete(velocidad){
		self.perseguirSnitch(velocidad)
		// atrapar snitch delegado a buscador
	}

	method encontroSnitch() = true

	method puedeAtraparLaSnitch() = self.distanciaALaSnitch() <= 0

	method distanciaALaSnitch() = metrosARecorrer;

	method cercaDeLaSnitch() = self.encontroSnitch() && self.distanciaALaSnitch() < 1000
}
