object camionVerduras {
    var cajonesVerdura = 0
    var kilometraje = 700000
    const velocidadMaximaBase = 80
    const pesoCajon = 50

    method peso() {
        return pesoCajon * cajonesVerdura
    }

    method velocidadMaxima() {
        return velocidadMaximaBase - self.peso().div(500)
    }

    method cargarCajones(cantidad) {
        cajonesVerdura += cantidad
    }

    method descargarCajones(cantidad) {
        cajonesVerdura -= cantidad
    }
}

object agua {
    const property densidad = 1
}

object aceite {
    const property densidad = 1.5
}

object camionScanion5000 {
    const capacidad = 5000
    const property velocidadMaxima = 140
    var property liquido = agua

    method peso() {
        return capacidad * liquido.densidad()
    }
}

object camionCerealero {
    var nivelDeterioro = 0
    const velocidadMaximaBase = 60

    method velocidadMaxima() {
        return velocidadMaximaBase - nivelDeterioro
    }
}