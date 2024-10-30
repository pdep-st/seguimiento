class Persona {

	var temperatura
	var property celulas
	const enfermedades = []
	var property vecesEnfermado = 0

	method contraer(enfermedad) {
		vecesEnfermado += 1
		enfermedades.add(enfermedad)
	}

	method aumentarTemperatura(aumento) {
		temperatura += aumento
	}
	
	method congelar() {
		temperatura = 0
	}

	method destruirCelulas(celulasAfectadas) {
		celulas -= celulasAfectadas
	}

	method vivir() {
		enfermedades.forEach{ enfermedad => enfermedad.afectar(self)}
	}

	method recibirMedicamento(dosis) {
		enfermedades.forEach{ enfermedad => enfermedad.atenuarse(dosis * 15)}
	}

	method enfermedadesActivas() {
		return enfermedades.reject({ enfermedad => enfermedad.estaCurada() })
	}

}


class Medico inherits Persona{
	
	override method contraer(enfermedad) {
		super(enfermedad) // self.contraer(enfermedad) pero ignorá a Medico en el method lookup
		self.atender(self)
	}
	
	method atender(persona)
}
