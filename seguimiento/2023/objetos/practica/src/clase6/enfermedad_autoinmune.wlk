import enfermedad.*

class EnfermedadAutoinmune inherits enfermedad.EnfermedadCelular {
	var diasAfectando = 0
	
	override method afectar(paciente) {
		paciente.destruirCelulas(celulasAmenazadas)
		diasAfectando += 1
	}
	
	method esAgresiva(paciente) {
		return diasAfectando > 30
	}
}