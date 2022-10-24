class EnfermedadCelular {

	var property celulasAfectadas

	method atenuarse(cantidadDeCelulas) {
		celulasAfectadas = (celulasAfectadas - cantidadDeCelulas).max(0)
	}

	method estaCurada() = celulasAfectadas == 0

	method afectar(persona)

	method esAgresiva(persona)

}

