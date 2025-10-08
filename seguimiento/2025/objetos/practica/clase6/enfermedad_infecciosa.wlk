import enfermedad.*

class EnfermedadInfecciosa inherits Enfermedad {
    override method afectar(persona) {
        persona.aumentarTemperatura(celulasAmenazadas / 1000)
    }

    method reproducirse() {
        celulasAmenazadas *= 2
    }

    override method esAgresiva(personaAfectada) = celulasAmenazadas > 0.1 * personaAfectada.cantidadCelulas()
}