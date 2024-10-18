import enfermedad.*

class EnfermedadInfecciosa inherits Enfermedad {
    override method causarEfecto(paciente) {
        paciente.aumentarTemperatura(celulasAmenazadas / 1000)
    }

    method reproducirse() {
        celulasAmenazadas *= 2
    }

    override method esAgresiva(paciente) = celulasAmenazadas > paciente.celulas() * 0.1

}   