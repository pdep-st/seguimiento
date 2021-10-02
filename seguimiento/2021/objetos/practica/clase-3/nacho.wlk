object nacho {
	
	var property mascotas = #{}

	/* Metodos */
	method jugar() {
		mascotas.forEach({ mascota => mascota.jugar() })
	}
	
	method agregarMascota(mascota) {
		mascotas.add(mascota)
	}
	

}