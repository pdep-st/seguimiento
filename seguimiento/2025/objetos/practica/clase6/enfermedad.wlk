class Enfermedad {
    var celulasAmenazadas

    method celulasAmenazadas() = celulasAmenazadas

    method darMedicamento(dosis) {
        celulasAmenazadas = (celulasAmenazadas - dosis * 15).max(0)
    }

    method estaCurada() = celulasAmenazadas == 0

    method afectar(persona)

    method esAgresiva(persona)
}