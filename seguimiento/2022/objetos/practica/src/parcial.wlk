class Jugador {

	const property nombre
	var edad
	var property posicion
	var peso
	var property altura

	method esEstrella() = posicion.esEstrella(self)

	method habilidad() = posicion.habilidad()

	method jugar() {
		posicion.jugar()
	}

	method mideMasDe(metros) = altura > metros

}

class Posicion {

	var partidos = 0
	var goles = 0

	method jugoMasDe(cantidadPartidos) = partidos > cantidadPartidos

	method jugar() {
		partidos += 1
	}

	method esEstrella(jugador)

	method habilidad()

}

class Arquero inherits Posicion {

	var golesRecibidos = 0

	override method esEstrella(jugador) {
		return (self.jugoMasDe(100) && self.promedioRecibidosBajo()) || jugador.mideMasDe(1.9)
	}

	method promedioRecibidosBajo() = golesRecibidos / partidos < 0.8

	override method habilidad() = partidos * 2 + goles * 500 - golesRecibidos

}

class Defensor inherits Posicion {

	var amarillas = 0
	var rojas = 0

	override method esEstrella(jugador) {
		return self.jugoMasDe(149) && self.promedioAmarillasBajo() && self.tieneMinimoDeRojas()
	}

	method promedioAmarillasBajo() = amarillas / partidos < 0.5

	method tieneMinimoDeRojas() = rojas >= 5

	override method habilidad() = partidos * 3 + goles * 5 + amarillas - rojas * 10

}

class Mediocampista inherits Posicion {

	var asistencias = 0
	var jugoConSeleccion = false

	override method esEstrella(jugador) {
		return (self.jugoMasDe(250) && self.tieneMinimoDeGoles() && self.tieneMinimoDeAsistencias() && jugoConSeleccion) || self.nombreTerminaEnInho(jugador)
	}

	method tieneMinimoDeGoles() = goles >= 20

	method tieneMinimoDeAsistencias() = asistencias >= 80

	method nombreTerminaEnInho(jugador) = jugador.nombre().endsWith("inho")

	override method habilidad() = partidos + goles * 2 + asistencias * 3 + self.puntosSeleccion()

	method puntosSeleccion() {
		if (jugoConSeleccion) {
			return 100
		} else {
			return 0
		}
	}

	override method jugar() {
		super()
		jugoConSeleccion = true
	}

}

object delantero {

	method esEstrella(jugador) = true

	method habilidad() = 1500

}

class Equipo {

	const jugadores = #{}
	var property victorias = 0
	var property derrotas = 0
	var property empates = 0

	method cantidadPermitidaDeEstrellas()

	method agregarJugador(jugador) {
		self.chequearQueSePuedeAgregar(jugador)
		jugadores.add(jugador)
	}

	method chequearQueSePuedeAgregar(jugador) {
		if (self.estaCompleto()) {
			self.error("¡El equipo está completo, ya son 11!")
		}
		if (jugador.esEstrella() && self.completoDeEstrellas()) {
			self.error("Ya hay muchas estrellas, no se puede agregar otra")
		}
	}

	method estaCompleto() = jugadores.size() == 11

	method completoDeEstrellas() = self.cantidadEstrellas() >= self.cantidadPermitidaDeEstrellas()

	method cantidadEstrellas() = jugadores.filter{ jugador => jugador.esEstrella() }.size()

	method habilidad() = jugadores.sum{ jugador => jugador.habilidad() }

	method jugar() {
		jugadores.each{ jugador => jugador.jugar()}
	}

	method ganar() {
		victorias += 1
	}

	method perder() {
		derrotas += 1
	}

	method empatar() {
		empates += 1
	}

	method puntos() = victorias * 3 + empates

	method cumplioSuMinimo() = self.puntos() >= self.puntosEsperados()

	method puntosEsperados()

}

class EquipoPro inherits Equipo {

	override method cantidadPermitidaDeEstrellas() = 9

	override method puntosEsperados() {
		if (self.tieneAMessi()) {
			return 18
		} else {
			return 12
		}
	}

	method tieneAMessi() = jugadores.any{ jugador => jugador.nombre() == "Messi" }

}

class EquipoMedioPelo inherits Equipo {

	override method cantidadPermitidaDeEstrellas() = 3

	override method puntosEsperados() = self.cantidadEstrellas()

}

object brasil inherits Equipo {

	override method cantidadPermitidaDeEstrellas() = 11

	override method puntosEsperados() = 21

}

class Partido {

	const local
	const visitante

	method jugar() {
		self.chequearEstanCompletos()
		if (self.ganaLocal()) {
			self.gano(local, visitante)
		} else if (self.empatan()) {
			self.empataron()
		} else {
			self.gano(visitante, local)
		}
		local.jugar()
		visitante.jugar()
	}

	method chequearEstanCompletos() {
		if (not (local.estaCompleto() && visitante.estaCompleto())) {
			self.error('Los equipos no están completos, ambos tienen que tener 11 jugadores')
		}
	}

	method gano(ganador, perdedor) {
		ganador.ganar()
		perdedor.perder()
	}

	method empataron() {
		local.empatar()
		visitante.empatar()
	}

	method ganaLocal() = self.puntosLocal() >= self.puntosVisitante()

	method empatan() = self.puntosLocal() == self.puntosVisitante()

	method puntosLocal() {
		return self.puntos(local, visitante) + self.puntosPorLocalia()
	}

	method puntosVisitante() {
		return self.puntos(visitante, local)
	}

	method puntos(equipo, rival) {
		return self.puntosPorEstrellas(equipo) + self.puntosSiEsMejor(equipo, rival)
	}

	method puntosPorEstrellas(equipo) = equipo.cantidadEstrellas()

	method puntosSiEsMejor(equipo, rival) {
		if (equipo.habilidad() > rival.habilidad()) {
			return 5
		} else {
			return 0
		}
	}

	method puntosPorLocalia() = 1

}

object mundial {

	const equipos = #{}

	method agregarEquipo(equipo) {
		equipos.add(equipo)
	}

	method huboBatacazo() = equipos.any{ equipo => equipo.cantidadEstrellas() < 2 && equipo.puntos() > 0 }

	method estamosBien() = equipos.all{ equipo => equipo.cumplioSuMinimo() }

}

