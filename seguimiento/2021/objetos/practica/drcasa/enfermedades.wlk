class Enfermedad {

	var celulasAfectadas
	
	method tomarDosis(dosis) {
		celulasAfectadas =
			0.max(celulasAfectadas - dosis * 15)
	}
	
	method curada() {
		return celulasAfectadas == 0
	}

}


class EnfermedadInfecciosa inherits Enfermedad {
	
	method afectar(persona) {
		persona.aumentarTemperatura(
			celulasAfectadas / 1000
		)
	}
	
	method agresiva(persona) = celulasAfectadas > persona.celulas() * 0.1 
	
	method reproducir() {
		celulasAfectadas *= 2
	}
	
}

class EnfermedadAutoInmune inherits Enfermedad {

	var cantidadDiasAfectacion = 0
	
	method agresiva(persona) = cantidadDiasAfectacion > 30
	
	method afectar(persona) {
		cantidadDiasAfectacion += 1
		persona.destruirCelulas(celulasAfectadas)
	}
	
}