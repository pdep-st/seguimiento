object camionCerealero {
	var property nivelDeterioro = 0
	
	method velocidadMaxima() {
		return (60 - nivelDeterioro).max(0)
	}
}

object camionVerduras {
	var property cajones = 0
	
	method velocidadMaxima() {
		return (80 - self.carga() / 500).max(0)
	}
	
	method carga() = cajones * 50
}

/*
 * 1. velocidad máxima inicial (sin carga) -> v == 80
 * 2. velocidad máxima con carga > 0, carga < 80 * 500 -> v < 80, v > 0
 * 3. velocidad máxima con carga >= 80 * 500 -> v == 0
 * 4. carga con 0 cajones (inicial) -> c == 0
 * 5. carga con >0 cajones -> c > 0 
 */