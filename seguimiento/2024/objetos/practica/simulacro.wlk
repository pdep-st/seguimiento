class Alumno {
    const property legajo
    const nombre
    const edad

    override method ==(otro) {
        return otro.className() == self.className() && legajo == otro.legajo()
    }
}

// Groupies

class Artista {
    var groupies = 0

    method sumarAllegados(cantidad) {
        groupies += cantidad
    }

    method calidadPorEstilos() = self.estilos().size() * 5

    method calidad() {
        return self.calidadPorEstilos() + self.calidadArtista()
    }

    method estaPegado() {
        return groupies > 20000
    }

    method calidadArtista()
    method estilos()
}

class Musico inherits Artista {
    var instrumento
    const property estilos = #{}

    method tieneEstilo(estilo) = estilos.contains(estilo)

    override method calidadArtista() = instrumento.calidad(self)

    method esVocalista() = instrumento == voz
}

class GuitarraCriolla {
    var property cuerdasSanas = 6

    method calidad(musico) {
        return 10 + cuerdasSanas
    }
}

class GuitarraElectrica {
    var property amplificador

    method calidad(musico) {
        return 15 + amplificador.potencia()
    }
}

object amplificadorMarshall {
    method potencia() {
        return 7
    }
}

class InstrumentoDeEstilo {
    method extraPorMusico(musico) {
        if (musico.tieneEstilo(self.estiloNecesario())) {
            return self.valorExtra()
        }
        return 0
    }

    method calidad(musico) {
        self.valorBase() + self.extraPorMusico(musico)
    }

    method estiloNecesario()
    method valorExtra()
    method valorBase()
}

class Bajo inherits InstrumentoDeEstilo {
    var property color

    override method estiloNecesario() = "metal"
    override method valorBase() = 5

    override method valorExtra() {
        if (color == "rojo") {
            return 7
        }
        return 2
    }
}

object bateria inherits InstrumentoDeEstilo{
    override method estiloNecesario() = "rock"
    override method valorBase() = 10
    override method valorExtra() = 10
}

object voz {
    var property calidadBase = 16

    method calidad(musico) {
        return calidadBase
    }
}

const taylor = new Musico(instrumento=voz, estilos=#{"pop", "rock", "country"})
const maikel = new Musico(instrumento=voz, estilos=#{"pop", "soul"})
const guitarraRiorio = new GuitarraElectrica(amplificador=amplificadorMarshall)
const riorio = new Musico(instrumento=guitarraRiorio, estilos=#{"metal", "heavy metal"})
const hellMusic = new Musico(instrumento=voz, estilos=#{"metal", "death metal"})
const truquillo = new Musico(instrumento=new Bajo(color="rojo"), estilos=#{"rock", "metal"})
const emiliaViernes = new Musico(instrumento=voz, estilos=#{"cumbia uruguaya", "pop"})
const rengoEstar = new Musico(instrumento=bateria, estilos=#{"rock", "pop"})

class Banda inherits Artista {
    const integrantes = #{}

    override method estilos() {
        return integrantes.fold(integrantes.anyOne().estilos(), {estilos, integrante => estilos.intersection(integrante.estilos())})
    }

    override method calidadArtista() = integrantes.size() * 2 + self.mejorIntegrante().calidad()

    method mejorIntegrante() = integrantes.max {musico => musico.calidad()}

    method sumarIntegrante(musico) {
        self.chequearSiHayVocalista(musico)
        self.chequearEstilosCompartidos(musico)
        self.chequearCantidadIntegrantes()
        integrantes.add(musico)
    }

    method chequearCantidadIntegrantes() {
        if (integrantes.size() >= 4)
            self.error("La banda está llena, sólo entran 4")
    }

    method chequearSiHayVocalista(musico) {
        if (musico.esVocalista() && self.tieneVocalista()) {
            self.error("Ya hay un vocalista en la banda")
        }
    }

    method chequearEstilosCompartidos(musico) {
        if (not musico.estilos().any {estilo => self.estilos().contains(estilo)})
            self.error("El integrante no comparte estilos con la banda")
    }

    method tieneVocalista() {
        return integrantes.any {musico => musico.esVocalista()}
    }

    override method sumarAllegados(cantidad) {
        super(cantidad)
        self.mejorIntegrante().sumarAllegados(cantidad.div(2))
    }
}

const metaleros = new Banda(integrantes=#{hellMusic, riorio})


class Recital {
    const artista
    const duracion
    const participantes

    method llevarseACabo() {
        artista.sumarAllegados(participantes * self.porcentajeConversion())
    }

    method porcentajeConversion() {
        return (artista.calidad() - self.punitorioPorDuracion()).max(0).min(100) / 100
    }

    method punitorioPorDuracion() {
        if (duracion < 1)
            return 3
        return 0
    }
}