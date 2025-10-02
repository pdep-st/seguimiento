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

    method perderCelulas(cantidad) {
        cantidadCelulas -= cantidad
    }

    method cantidadCelulas() = cantidadCelulas
}

class EnfermedadInfecciosa inherits Enfermedad {
    method afectar(persona) {
        persona.aumentarTemperatura(celulasAmenazadas / 1000)
    }

    method reproducirse() {
        celulasAmenazadas *= 2
    }

    method esAgresiva(personaAfectada) = celulasAmenazadas > 0.1 * personaAfectada.cantidadCelulas()
}

class EnfermedadAutoinmune inherits Enfermedad {
    var diasAfectado = 0

    method afectar(persona) {
        persona.perderCelulas(celulasAmenazadas)
        diasAfectado += 1
    }

    method esAgresiva(persona) = diasAfectado > 30
}

class Enfermedad {
    var celulasAmenazadas

    method darMedicamento(dosis) {
        celulasAmenazadas = (celulasAmenazadas - dosis * 15).max(0)
    }

    method estaCurada() = celulasAmenazadas == 0

    method afectar(persona)

    method esAgresiva(persona)
}