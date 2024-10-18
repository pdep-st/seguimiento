import enfermedad.*

class EnfermedadAutoinmune inherits Enfermedad {
    var vecesAfectado = 0

    override method causarEfecto(paciente) {
        paciente.destruirCelulas(celulasAmenazadas)
        vecesAfectado += 1
    }

    override method esAgresiva(paciente) = vecesAfectado > 30
}
