import enfermedad.*

class EnfermedadInfecciosa inherits enfermedad.EnfermedadCelular {
	
	override method afectar(paciente) {
		paciente.aumentarTemperatura(celulasAmenazadas / 1000)
	}
	
	method reproducirse() {
		celulasAmenazadas *= 2
	}
	
	method esAgresiva(paciente){
		return celulasAmenazadas >= 0.1 * paciente.celulas()
	}
	
}
