class Persona {

	const enfermedades = []
	var temperatura = 36
	var property celulas = 30000000

	method adquirir(enfermedad) {
		enfermedades.add(enfermedad)
	}

	method aumentarTemperatura(aumento) {
		temperatura += aumento
	}

	method destruirCelulas(celulasADestruir) {
		celulas = 0.max(celulas - celulasADestruir)
	}

	method vivirDia() {
		enfermedades.forEach({ enfermedad => enfermedad.afectar(self)})
	}

	method tomarMedicamento(dosis) {
		enfermedades.forEach({ enfermedad => enfermedad.atenuar(dosis)})
	}

	method enfermedadesSinCurar() {
		enfermedades.filter({ enfermedad => not enfermedad.estaCurada()})
	}

	method congelar() {
		temperatura = 0
	}

}

class EnfermedadCelular {

	var celulasAfectadas

	method atenuar(dosis) {
		if (not self.estaCurada()) {
			celulasAfectadas = 0.max(celulasAfectadas - dosis * 15)
		}
	}

	method estaCurada() = celulasAfectadas == 0

	method afectar(persona)

	method esAgresiva(persona)

}

class EnfermedadInfecciosa inherits EnfermedadCelular {

	override method afectar(persona) {
		persona.aumentarTemperatura(celulasAfectadas / 1000)
	}

	method reproducir() {
		celulasAfectadas *= 2
	}

	override method esAgresiva(persona) = celulasAfectadas > persona.celulas() * 0.1

}

class EnfermedadAutoInmune inherits EnfermedadCelular {

	var cantidadDiasContraida = 0

	override method afectar(persona) {
		persona.destruirCelulas(celulasAfectadas)
		cantidadDiasContraida += 1
	}

	override method esAgresiva(persona) = cantidadDiasContraida > 30

}

class Medico inherits Persona {

	var property dosis = 10

	method atender(paciente) {
		paciente.tomarMedicamento(dosis)
	}

	override method adquirir(enfermedad) {
		super(enfermedad)
		self.atender(self)
	}

}

class JefeDeDepartamento inherits Medico {

	const colegas = []

	method agregarColaborador(colaborador) {
		colegas.add(colaborador)
	}

	override method atender(paciente) {
		colegas.anyOne().atender(paciente)
	}

}

object laMuerte {

	method afectar(persona) {
		persona.congelar()
	}

	method atenuar(dosis) {
	// No tiene que hacer nada
	}

	method esAgresiva() = true

	method estaCurada() = false

}
