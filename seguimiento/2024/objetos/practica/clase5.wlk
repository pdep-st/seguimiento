class Paciente {
    const enfermedades = #{}
    var celulas = 8000000
    var property temperatura = 36

    method celulas() = celulas

    method destruirCelulas(cantidad) {
        celulas -= cantidad
    }

    method enfermarse(enfermedad) {
        enfermedades.add(enfermedad)
    }

    method pasarDias(cantidad) {
        cantidad.times { index =>
            enfermedades.forEach{enfermedad => enfermedad.causarEfecto(self)}
        }
    }

    method aumentarTemperatura(cantidad) {
        temperatura += cantidad
    }
}

class EnfermedadInfecciosa inherits Enfermedad {
    method causarEfecto(paciente) {
        paciente.aumentarTemperatura(celulasAmenazadas / 1000)
    }

    method reproducirse() {
        celulasAmenazadas *= 2
    }

    method esAgresiva(paciente) = celulasAmenazadas > paciente.celulas() * 0.1

}   


class EnfermedadAutoinmune inherits Enfermedad {
    var vecesAfectado = 0

    method causarEfecto(paciente) {
        paciente.destruirCelulas(celulasAmenazadas)
        vecesAfectado += 1
    }

    method esAgresiva(paciente) = vecesAfectado > 30
}

class Enfermedad {
    var celulasAmenazadas

    method tratar(dosis) {
        celulasAmenazadas = (celulasAmenazadas - dosis * 15).max(0)
    }

    method estaCurada() = celulasAmenazadas == 0

    method causarEfecto(paciente)

    method esAgresiva(paciente)
}
