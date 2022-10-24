class Persona {
	var temperatura
	var property celulas
	var enfermedades = []
	
	method contraerEnfermedad(enfermedad){
		enfermedades.add(enfermedad)
	}
	
	method aumentarTemperatura(aumento){
		temperatura += aumento
	}
	
	method destruirCelulas(celulasAfectadas){
		celulas -= celulasAfectadas
	}
	
	method vivir(){
		enfermedades.forEach{enfermedad => 
			enfermedad.afectar(self)
		}
	}
	
	method recibirMedicamento(dosis){
		enfermedades.forEach{enfermedad =>
			enfermedad.atenuarse(dosis)
		}
	}
	
	method enfermedadesActivas(){
		return enfermedades.reject({enfermedad =>
			enfermedad.estaCurada()
		})
	}
}

class Enfermedad {
	var celulasAfectadas
	
	method atenuarse(dosis) {
		celulasAfectadas = (celulasAfectadas - dosis * 15).max(0)
	}
	
	method estaCurada() = celulasAfectadas == 0
}

class EnfermedadInfecciosa inherits Enfermedad {
	method afectar(persona){
		persona.aumentarTemperatura(
			celulasAfectadas / 1000
		)
	}
	
	method reproducirse(){
		celulasAfectadas *= 2
	}
	
	method esAgresiva(persona) {
		return celulasAfectadas > persona.celulas() * 0.1
	}
}

class EnfermedadAutoinmune inherits Enfermedad {
	var recuentoDias = 0
	
	method afectar(persona){
		recuentoDias += 1
		persona.destruirCelulas(celulasAfectadas)
	}
	
	method esAgresiva(persona) = recuentoDias > 30
}
