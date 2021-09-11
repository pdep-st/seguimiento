object nacho {
	
	const mascota = chila

	/* Metodos */
	method jugar() {
		mascota.jugar()
		mascota.jugar()
	}

}

object firulais {
	
	method jugar() {
		
	}
	
	method ladrar() {
		return "WROF WROF"
	}
}

object chili {
	
	/*Atributos*/
	var edad = 9
	var energia = 100
	
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

object chila {
	
	/*Atributos*/
	var edad = 9
	var energia = 100
	
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
