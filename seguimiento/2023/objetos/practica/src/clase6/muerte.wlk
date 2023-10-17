object muerte {
	
	method afectar(paciente) {
		paciente.congelar()
	}
	
	method atenuar(celulas) {
		// No se puede atenuar la muerte
	}
	
	method esAgresiva(paciente) = true
	
	method estaCurada() = false
}
