object gameflix {

	const juegos = #{}
	const jugadores = #{}
	
	method agregarJugador(jugador) {
		jugadores.add(jugador)
	}

	method filtrar(categoria) = juegos.filter{ juego => juego.esCategoria(categoria) }

	method buscar(nombre) {
		juegos.findOrElse(
			{juego => juego.nombre() == nombre},
			{self.error("No existe el juego con nombre " + nombre)}
		)
	}

	method unoAlAzar() = juegos.anyOne()
	
	method cobrarSuscripciones() {
		jugadores.forEach {jugador => self.cobrarSuscripcion(jugador)}
	}
	
	method cobrarSuscripcion(jugador) {
		try {
			jugador.pagarSuscripcion()	
		} catch e : FaltaPlataError {
			jugador.suscripcion(suscripcionPrueba)	
		}
	}

}

class Juego {
	var property nombre
	var property categoria
	var property precio
	
	method esBarato() = precio < 30
	
	method esCategoria(unaCategoria) = categoria == unaCategoria
	
	method serJugado(jugador, horas)
}

class JuegoViolento inherits Juego {
	override method serJugado(jugador, horas) {
		jugador.reducirHumor(10 * horas)
	}
}

class JuegoMOBA inherits Juego {
	override method serJugado(jugador, horas) {
		jugador.pagar(30)
	}
}

class JuegoTerrorifico inherits Juego {
	override method serJugado(jugador, horas) {
		jugador.suscripcion(suscripcionInfantil)
	}
}

class JuegoEstrategico inherits Juego {
	override method serJugado(jugador, horas) {
		jugador.aumentarHumor(5 * horas)
	}
}


class Jugador {
	var property humor = 1000
	var property plata = 0
	var property suscripcion
	
	method reducirHumor(cantidad) {
		humor -= cantidad
	}
	
	method aumentarHumor(cantidad) {
		humor += cantidad
	}
	
	method pagar(cantidad) {
		if (self.puedePagar(cantidad)) {
			plata -= cantidad	
		} else {
			throw new FaltaPlataError(message = "No te alcanza la plata!!!!")
		}
	}
	
	method puedePagar(cantidad) {
		return plata >= cantidad
	}
	
	method puedeJugar(juego) {
		return suscripcion.puedeJugar(juego)
	}
	
	method jugar(juego, horas) {
		if (self.puedeJugar(juego)) {
			juego.serJugado(self, horas)
		} else {
			throw new NecesitaMejorSuscripcionError(suscripcionActual = suscripcion, juego = juego)
		}
	}
	
	method pagarSuscripcion() {
		self.pagar(suscripcion.costoMensual())
	}
}

class NecesitaMejorSuscripcionError inherits Exception {
	const suscripcionActual
	const juego
	
	override method message() = "No se puede jugar este juego (" + juego + ") con una " + suscripcionActual 
}

class FaltaPlataError inherits Exception {}

object suscripcionPremium {
	const property costoMensual = 50
	
	method puedeJugar(juego) {
		return true
	}
}

object suscripcionBase {
	const property costoMensual = 25
	
	method puedeJugar(juego) {
		return juego.esBarato()
	}
}

object suscripcionPrueba {
	const property costoMensual = 0
	
	method puedeJugar(juego) {
		return juego.esCategoria("Demo")
	}
}

object suscripcionInfantil {
	const property costoMensual = 10
	
	method puedeJugar(juego) {
		return juego.esCategoria("Infantil")
	}
}