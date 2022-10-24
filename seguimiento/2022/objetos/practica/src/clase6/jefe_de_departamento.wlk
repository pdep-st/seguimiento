import medico.*
import persona.*

class JefeDeDepartamento inherits Medico {

	const subordinados = #{}

	override method atender(persona) {
		subordinados.anyOne().atender(persona)
	}
	
	method agregarSubordinado(medico) {
		subordinados.add(medico)
	}

}

