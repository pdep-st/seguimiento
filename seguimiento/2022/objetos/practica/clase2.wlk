object camionCerealero {
	var nivelDeterioro= 0
		
	method velocidadMaxima() {
		return (60 - nivelDeterioro).max(0)
	}
	
	method nivelDeterioro(_nivel){
		nivelDeterioro = _nivel
	}
}

object scanion5000 {
	method velocidadMaxima() { return 140 }
}

object camionVerduras {
	
	var cajones = 0
	
	method transportarCajones(_cajones) {
		cajones = _cajones
	}
	
	method velocidadMaxima(){
		const carga = self.carga()
		return 80 - carga.div(500)
	}
	
	method carga() = cajones * 50
	
}