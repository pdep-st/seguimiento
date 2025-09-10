object camionDeVerduras {
    var cantidadCajones = 0
    const velocidadMaximaLimite = 80
    var kilometraje = 700000

    method cargarCajones(cantidad) {
        cantidadCajones += cantidad
    }

    method bajarCajones(cantidad) {
        cantidadCajones -= cantidad
    }
    
    method peso() = cantidadCajones * 50
    method velocidadMaxima() = velocidadMaximaLimite - self.peso() / 500
}

object agua {
    const property densidad = 1
}

object miel {
    const property densidad = 2.3
}
object camionScanion5000 {
    const capacidad = 5000
    var densidadCarga = 1
    const property velocidadMaxima = 140

    method peso() = densidadCarga * capacidad

    method cargarLiquido(liquido) {
        densidadCarga = liquido.densidad()
    }
}

object camionCerealero {
    const velocidadMaximaLimite = 60
    var nivelDeterioro = 0
    var property peso = 0

    method velocidadMaxima() = velocidadMaximaLimite - nivelDeterioro
}