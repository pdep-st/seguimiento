import enfermedad.*

class EnfermedadAutoinmune inherits EnfermedadCelular {

	var recuentoDias = 0

	override method afectar(persona) {
		recuentoDias += 1
		persona.destruirCelulas(celulasAfectadas)
	}

	override method esAgresiva(persona) = recuentoDias > 30

}

