import medico.*

class MedicoDePlanta inherits Medico {
	const dosis
	
	override method atender(paciente) {
		paciente.curar(dosis)
	}
	
	override method toString() {
		return super() + " Funciona!"
	}
}
