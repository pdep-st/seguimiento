object muerte {
    method darMedicamento(dosis) {
        // No se puede atenuar a la muerte
    }

    method estaCurada() = false

    method afectar(persona) {
        persona.disminuirTodaLaTemperatura()
    }

    method esAgresiva(persona) = true
}