class MascotaJuguetona {
	var cantidadVecesJugadas = 0
	
	method jugar() {
		cantidadVecesJugadas += 1
	}
}

class MascotaConEnergia {
	
	/*Atributos*/
	var property edad = 0
	var energia = 1000
	
	/* Metodos */
	method jugar() {
		if (not self.viejo()) {
			energia = energia - 20
		}
	}
	
	// Getter
	method energia() { return energia }
	
	method ladrar() {
		return "WOFF WOFF WOFF"
	}
	
	method viejo() {
		return edad > 10
	}
	
	method cumplirAnios() {
		edad = edad + 1
	}
}


//object chili {
//	
//	/*Atributos*/
//	var edad = 9
//	var energia = 100
//	
//	/* Metodos */
//	method jugar() {
//		if (not self.viejo()) {
//			energia = energia - 20
//		}
//	}
//	
//	// Getter
//	method energia() { return energia }
//	
//	method ladrar() {
//		return "WOFF WOFF WOFF"
//	}
//	
//	method viejo() {
//		return edad > 10
//	}
//	
//	method cumplirAnios() {
//		edad = edad + 1
//	}
//}

//object chila {
//	
//	/*Atributos*/
//	var edad = 9
//	var energia = 100
//	
//	/* Metodos */
//	method jugar() {
//		if (not self.viejo()) {
//			energia = energia - 20
//		}
//	}
//	
//	// Getter
//	method energia() { return energia }
//	
//	method ladrar() {
//		return "WOFF WOFF WOFF"
//	}
//	
//	method viejo() {
//		return edad > 10
//	}
//	
//	method cumplirAnios() {
//		edad = edad + 1
//	}
//}
