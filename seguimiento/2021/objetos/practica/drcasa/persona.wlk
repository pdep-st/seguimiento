// persona
// enfermedades

class Persona {
	const enfermedades = []
	var property celulas = 30000000
	var temperatura = 36

	method adquirir(enfermedad) {
		enfermedades.add(enfermedad)
	}
	
	method aumentarTemperatura(aumento) {
		temperatura += aumento
	}
	
	method destruirCelulas(celulasADestruir) {
		celulas -= celulasADestruir
	}
	
	method tomarDosis(dosis) {
		enfermedades.forEach({ enfermedad => 
			enfermedad.tomarDosis(dosis)
		})
	}
	
	method vivirDia() {
		self.enfermedadesNoCuradas().forEach({ enfermedad =>
			enfermedad.afectar(self)
		})
	}
	
	method enfermedadesNoCuradas() =
		enfermedades.filter({ enfermedad => enfermedad.curada().negate() })
}

