class Enfermedad {
	var property celulasAmenazadas = 1000
	
	method tratar(dosis){
		celulasAmenazadas = (celulasAmenazadas - dosis * 15).max(0)
	}
	
	method estaCurada() = celulasAmenazadas == 0
	
	method afectar(paciente)
}

class EnfermedadInfecciosa inherits Enfermedad {
	
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

class EnfermedadAutoinmune inherits Enfermedad {
	var diasAfectando = 0
	
	override method afectar(paciente) {
		paciente.destruirCelulas(celulasAmenazadas)
		diasAfectando += 1
	}
	
	method esAgresiva(paciente) {
		return diasAfectando > 30
	}
}

class Paciente {
	var temperatura = 36
	var celulas = 100000
	const enfermedades = #{}
	
	method celulas() = celulas
	
	method aumentarTemperatura(cantidad) {
		temperatura += cantidad
	}
	
	method destruirCelulas(cantidad) {
		celulas -= cantidad
	}
	
	method contraerEnfermedad(enfermedad) {
		enfermedades.add(enfermedad)
	}
	
	method vivir() {
		enfermedades.forEach {enfermedad => enfermedad.afectar(self)}
	}
	
	method curar(dosis) {
		enfermedades.forEach {enfermedad => enfermedad.tratar(dosis)}
	}
}