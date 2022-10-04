object socio {

	var cuotasImpagas
	var bonos

	method pagarDeudas() {
		self.deudas().forEach({ deuda => deuda.pagar(self)})
	}

	method deudas() {
		return cuotasImpagas + bonos.filter({ bono => bono.vencio() })
	}

}

// Tenemos a Dora que quiere sacar plata del cajero y guardarla en su monedero
// Si el cajero no tiene suficiente plata, trato de sacar la mitad
class Persona {

	var nombre
	const monedero = new Monedero()

	method extraer(cantidad) {
		var cantidadAGuardar = cantidad
		
		try {
			cajero.extraer(cantidad)
		} catch error : Exception {
			cajero.extraer(cantidad / 2)
			cantidadAGuardar = cantidad / 2
		}
		
		monedero.guardar(cantidadAGuardar)
	}

}

class Monedero {

	var plata = 0

	method guardar(cantidad) {
		plata += cantidad
	}

	method plata() = plata

}

object cajero {

	var disponible = 100000

	method disponible() = disponible

	method extraer(cantidad) {
		if (disponible < cantidad) {
			self.error("No podés extraer más de lo que tengo disponible!")
			// throw new DomainException(message = "No podés extraer más de lo que tengo disponible!")
			// throw new Exception(message = "No podés extraer más de lo que tengo disponible!")
			// throw new NoHayPlata(message = "No hay plata", disponible=disponible)
		}
		disponible -= cantidad
	}

}


object ejemplo {
	
	var contador = 0
	
	method hola() {
		try {
			self.chau()
		} catch error {
			contador += 1
			throw new Exception(message = error.message())
		}
	}
	
	method chau() {
		self.error("Rompí :(")
	}
	
}
