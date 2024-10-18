class Enfermedad {
    var property celulasAmenazadas

    method atenuar(cantidadCelulas) {
        celulasAmenazadas = (celulasAmenazadas - cantidadCelulas).max(0)
    }

    method estaCurada() = celulasAmenazadas == 0

    method causarEfecto(paciente)

    method esAgresiva(paciente)
}