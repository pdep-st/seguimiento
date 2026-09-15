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

    method recorrer(cantidadKm, velocidad) {
        kilometraje += cantidadKm
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

    method recorrer(cantidadKm, velocidad) {}
}

object camionCerealero {
    var nivelDeterioro = 0
    const velocidadMaximaBase = 60
    var property peso = 0

    method velocidadMaxima() {
        return velocidadMaximaBase - nivelDeterioro
    }

    method recorrer(cantidadKm, velocidad) {
        nivelDeterioro += (velocidad - 45).max(0)
    }
}

object puestoRutatlantica {
    var precioBase = 7000
    var velocidadMaximaPasar = 75
    const kilometrosARecorrer = 400

    method cobrar(camion) {
        return precioBase + self.calcularAdicional(camion)
    }

    method calcularAdicional(camion) {
        return 100 * (camion.peso() / 1000)
    }

    method dejarPasar(camion) {
        const velocidad = velocidadMaximaPasar.min(camion.velocidadMaxima())

        camion.recorrer(kilometrosARecorrer, velocidad)
    }
}