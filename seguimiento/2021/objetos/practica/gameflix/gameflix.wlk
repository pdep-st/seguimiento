class Juego {
	var property nombre
	var property categoria
	var property precio
	
	method esDeNombre(_nombre) = _nombre == nombre
	method esDeCategoria(_categoria) = _categoria == categoria
	method barato() = precio < 30
}

class JuegoViolento inherits Juego {	
	method serJugado(jugador, horas) {
		jugador.reducirHumor(10 * horas)
	}
}

class JuegoMOBA inherits Juego {
	method serJugado(jugador, horas) {
		jugador.gastarDinero(30)
	}
}

class JuegoTerror inherits Juego {
	method serJugado(jugador, horas) {
		jugador.pasarAInfantil()
	}
}

class JuegoEstrategico inherits Juego  {
	method serJugado(jugador, horas) {
		jugador.incrementarHumor(5 * horas)
	}
}

object suscripcionPremium  {
	method puedeJugar(juego) = true
	method costoMensual() = 50
}

object suscripcionBase  {
	method puedeJugar(juego) = juego.barato()
	method costoMensual() = 25
}

class SuscripcionCategoria {
	const categoria
	const costo
	method puedeJugar(juego) = juego.esDeCategoria(categoria)
	method costoMensual() = costo
}

object suscripcionPrueba inherits SuscripcionCategoria(categoria = "Demo", costo = 0) {}
object suscripcionInfantil inherits SuscripcionCategoria(categoria = "Infantil", costo = 10) {}


class Jugador {
	var humor
	var dinero
	var property suscripcion
	
	method jugar(juego, horas) {
	   if (!self.puedeJugar(juego)) {
			throw new DomainException(message = "con esta suscripcion no se puede jugar")
	   }
	   juego.serJugado(self, horas)
	}
	
	method pagarSuscripcion() {
		if (self.puedoPagarSuscripcion()) {
			self.gastarDinero(suscripcion.costoMensual())
		} else {
			self.pasarAPrueba()
		}
	}
	
	method puedoPagarSuscripcion() = dinero >= suscripcion.costoMensual()
	
	method pasarAPrueba() {
		suscripcion = suscripcionPrueba
	}
	
	method puedeJugar(juego) = suscripcion.puedeJugar(juego)
	
	method gastarDinero(_dinero) {
		dinero -= _dinero
	}
	
	method reducirHumor(_humor) {
		humor -= _humor
	}
	
	method incrementarHumor(_humor) {
		humor += _humor
	}
	
	method pasarAInfantil() {
		suscripcion = suscripcionInfantil
	}
	
}


object gameflix {
    const juegos = #{}
    const usuarios = #{}
    
    method cobrar() {
    	usuarios.forEach({ usuario => usuario.pagarSuscripcion() })
    }
        
    method juegosDeCategoria(categoria) {
    	return juegos.filter({ juego => juego.esDeCategoria(categoria)})
    }
    
    method juegoDeNombre(nombre) {
    	return juegos.findOrElse({ juego => juego.esDeNombre(nombre) }, {
    		throw new DomainException(message = "no se encontro el juego de nombre " + nombre)
    	})
    }
    
    method juegoAlAzar() {
    	return juegos.anyOne()
    }
    
}

class DomainException inherits Exception {}
