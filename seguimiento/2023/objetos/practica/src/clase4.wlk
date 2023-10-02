//Tenemos a Dora que, ademas de otra gente, quiere sacar plata del cajero y guardarla en su monedero
//Cuando el cajero no cuenta con el disponible, Dora intenta sacar la mitad de la plata. Si no, me entrego

class Persona {
	var nombre
	const monedero = new Monedero()
	
	method retirar(cantidad) {
		
		var cantidadARetirar = cantidad
		try {
			cajero.retirar(cantidadARetirar)
			const rompe = 1 / 0 
		} catch error: DomainException {
			cantidadARetirar = cantidad / 2
			cajero.retirar(cantidadARetirar)
		} catch error: Exception {
			console.println(error)
		}
		monedero.agregar(cantidadARetirar)
	}
	
	method disponible(){
		return monedero.plata()
	}
}

class Monedero {
	var plata = 0
	
	method agregar(cantidad){
		plata += cantidad
	}
	
	method plata() = plata
}

object cajero {
	var disponible = 100000
	
	method retirar(cantidad) {
		if(disponible >= cantidad) {
			disponible -= cantidad	
		} else {
			//self.error("No es posible retirar esa cantidad")
			throw new DomainException(message = "No es posible retirar esa cantidad")
		}
	}
	
	method disponible() = disponible
}