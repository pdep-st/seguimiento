class Paciente {
	var temperatura = 36
	var celulas = 100000
	const enfermedades = #{}
	
	method celulas() = celulas
	
	method aumentarTemperatura(cantidad) {
		temperatura += cantidad
	}
	
	method congelar() {
		temperatura = 0
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
		enfermedades.forEach {enfermedad => enfermedad.atenuar(self.celulasAAtenuar(dosis))}
	}
	
	method celulasAAtenuar(dosis) = 15 * dosis
}