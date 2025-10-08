import enfermedad.*

class EnfermedadAutoinmune inherits Enfermedad {
    var diasAfectado = 0

    override method afectar(persona) {
        persona.perderCelulas(celulasAmenazadas)
        diasAfectado += 1
    }

    override method esAgresiva(persona) = diasAfectado > 30
}