import medico.*

class MedicoDePlanta inherits Medico {

	var property dosis

	override method atender(persona) {
		persona.recibirMedicamento(dosis)
	}

}

