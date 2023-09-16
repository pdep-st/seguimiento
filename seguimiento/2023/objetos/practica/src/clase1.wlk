object bostero {
	var gorro = pilusoBostero
	
	method sacarGorro() {
		gorro = null
	}
	
	method cambiarGorro() {
		if (gorro == pilusoBostero) {
			gorro = gorraBoca
		} else {
			gorro = pilusoBostero
		}
	}
	
	method nombre() {
		return "Aguante bokita papa"
	}
}

object pilusoBostero {
	
}

object gorraBoca {
	
}

object amigo {
	
	var property plata = 1140
	const dni = dniLautaro
	
	method damePlata() {
		if (plata >= 1000) {
			return self.sacarPlata(500)
		} else {
			return self.sacarPlata(20)
		}
	}
	
	method sacarPlata(cantidad) {
		plata -= cantidad
		return cantidad
	}
	
	method nombre() {
		return dni.nombre()
	}
}

object dniLautaro {
	method nombre() = "Lautaro"
}

object mama {
	var billetera = billeteraDiana
	
	method damePlata() = billetera.damePlata()
	
	method nombre() = "Diana"
	
}

object billeteraDiana {
	method damePlata() = 1000
}

object papa {
	const billetera = billeteraPapa
	method damePlata() = billetera.damePlata()
}

object billeteraPapa {
	method damePlata() = 500 
}