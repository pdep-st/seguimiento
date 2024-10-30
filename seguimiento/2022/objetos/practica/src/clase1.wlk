object luciano {
	var billetera = billeteraDeCuero
	
	method damePlata() {
		return billetera.damePlata()
	}
	
	method billetera(unaBilletera) {
		billetera = unaBilletera
	}
}

object billeteraDeCuero {
	method damePlata() {
		return 100
	}
}

object juanpi {
	var plata = 105
	
	method damePlata() {
		if (plata > 100) {
			plata -= 10
			return 10
		} else {
			plata -= 3
			return 3
		}
	}
	
	method plata() {
		return plata
	}
	
	method plata(cantidad) {
		plata = cantidad
	}
}

object juancruz {
	
	var gorro = null
	
	method nombre() = "Aguante bokita papá!"
	
	method sacarGorro() {
		gorro = null
	}
	
	method cambiarGorro() {
		if (gorro === gorraKeepcon) {
			gorro = pilusoBostero
		} else if (pilusoBostero.equals(gorro)) {
			gorro = gorraKeepcon
		}
	}
	
	method poneGorro(unGorro) {
		gorro = unGorro
	}
}

object gorraKeepcon {
	
}

object pilusoBostero {
	
}