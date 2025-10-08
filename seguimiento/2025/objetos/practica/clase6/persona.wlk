class Persona {
    const enfermedades = #{}
    var temperatura = 36.5
    var cantidadCelulas = 10000000

    method contraer(enfermedad) {
        enfermedades.add(enfermedad)
    }

    method vivir(cantidadDias) {
        cantidadDias.times { indice =>
            enfermedades.forEach {enfermedad => enfermedad.afectar(self)}
        }
    }

    method vivir() {
        self.vivir(1)
    }

    method aumentarTemperatura(cantidad) {
        temperatura += cantidad
    }

    method disminuirTodaLaTemperatura() {
        temperatura = 0
    }

    method perderCelulas(cantidad) {
        cantidadCelulas -= cantidad
    }

    method cantidadCelulas() = cantidadCelulas

    method curar(dosis) {
        enfermedades.forEach{enfermedad => enfermedad.darMedicamento(dosis)}
    }
}