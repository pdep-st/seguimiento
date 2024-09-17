object camionVerduras {
    var property cantidadCajones = 0
    var kilometraje = 700000
    const pesoPorCajon = 50
    const velocidadMaximaBase = 80

    method carga() = (cantidadCajones * pesoPorCajon).max(0)

    method velocidadMaxima() = (velocidadMaximaBase - self.carga() / 500).max(0)
}

object camionScanion {
    var property densidadCombustible = 1
    const capacidadMaxima = 5000
    const property velocidadMaxima = 140

    method carga() = (densidadCombustible * capacidadMaxima).max(0)
}

object camionCerealero {
    var property nivelDeterioro = 0
    var property carga = 0
    const velocidadMaximaBase = 60

    method velocidadMaxima() = (velocidadMaximaBase - nivelDeterioro.max(0)).max(0)
}