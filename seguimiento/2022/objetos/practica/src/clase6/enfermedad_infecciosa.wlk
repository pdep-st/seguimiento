import enfermedad.*

class EnfermedadInfecciosa inherits EnfermedadCelular {

	override method afectar(persona) {
		persona.aumentarTemperatura(celulasAfectadas / 1000)
	}

	method reproducirse() {
		celulasAfectadas *= 2
	}

	override method esAgresiva(persona) {
		return celulasAfectadas > persona.celulas() * 0.1
	}

}

