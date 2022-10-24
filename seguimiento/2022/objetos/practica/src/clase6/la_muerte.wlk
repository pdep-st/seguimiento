object laMuerte {

	method afectar(persona) {
		persona.congelar()
	}

	method esAgresiva(persona) = true

	method atenuarse(cantidadDeCelulas) {
	// No hacer nada! No se atenúa
	}

	method estaCurada() = false

}

