class EnfermedadCelular {
	var property celulasAmenazadas = 1000
	
	method atenuar(celulas){
		celulasAmenazadas = (celulasAmenazadas - celulas).max(0)
	}
	
	method estaCurada() = celulasAmenazadas == 0
	
	method afectar(paciente)
}
