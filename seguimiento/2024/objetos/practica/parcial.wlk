// https://docs.google.com/document/d/1zlGa5a10iqK8uANszIxCDn1dJfszFyATR5XCqHGqP88/edit?tab=t.0

class Jugador {
    var property personalidad = estandar
    var property vida = 100
    var property arma
    var property skin
    const items = []

    method modificarVida(cantidad) {
        vida = (vida + cantidad).max(0).min(100)
    }

    method curarse(cantidad) {
        self.modificarVida(cantidad)
    }

    method recibirDanio(cantidad) {
        self.modificarVida(-cantidad)
    }

    method vidaMenorA(cantidad) = vida < cantidad

    method murio() = vida == 0

    // Items
    method agregarItem(item) {
        items.add(item)
    }

    method potenciarArma(potenciador) {
        arma.potenciar(potenciador)
    }

    method tieneItemDeCura() = items.any {item => item.esDeCura()}
    method tieneItemDeDanio() = items.any {item => not item.esDeCura()}

    method unItemDeCura() = items.find {item => item.esDeCura()}
    method unItemDeDanio() = items.find {item => not item.esDeCura()}

    method consumir(item, rival) {
        item.usar(self, rival)
    }

    method consumirItem(rival) {
        if (self.vidaMenorA(50) && self.tieneItemDeCura()) {
            self.consumir(self.unItemDeCura(), rival)
        } else if (self.tieneItemDeDanio()) {
            self.consumir(self.unItemDeDanio(), rival)
        }
    }

    // Daño
    method danio() = personalidad.danio(self)

    method danioArma() = arma.danio()

    method atacar(rival) {
        rival.recibirDanio(self.danio())
    }

    // Eventos
    method zonasAAvanzar() = personalidad.zonasAAvanzar()
}
const escopetaAlfonso = new Escopeta()
const alfonso = new Jugador(personalidad=estandar, arma=escopetaAlfonso, skin="Spider Man")
const rifleBrisa = new Rifle(potenciador=silenciador)
const brisa = new Jugador(personalidad=camper, arma=rifleBrisa, skin="Lara Croft", items=[mini, mini, botiquin])
const changuito = new Jugador(personalidad=ninioRata, arma=cuchillo, skin="Maradona", items=[granada, granada, granada])
const pistolaDeLaCruyff = new Pistola(potenciador=balasDeFuego)
const deLaCruyff = new Jugador(personalidad=arriesgado, arma=pistolaDeLaCruyff, skin="Rubius", items=[silenciador, balasDeFuego, botiquin])

// Personalidades
class Estandar {
    method danio(jugador) = jugador.danioArma() * self.modificadorDanio(jugador)

    method modificadorDanio(jugador) = 1

    method zonasAAvanzar() = 1
}

const estandar = new Estandar()

object arriesgado inherits Estandar {
    override method modificadorDanio(jugador) {
        if (jugador.vidaMenorA(10))
            return 2
        if (jugador.vidaMenorA(50))
            return 1.25
        return super(jugador)
    }

    override method zonasAAvanzar() = 2
}

object camper inherits Estandar {
   override method zonasAAvanzar() = 0
}

object ninioRata inherits Estandar {
    override method modificadorDanio(jugador) = 0.8
}


// Armas
class Arma {
    var potenciador = sinPotenciador

    method danioBase()

    method danio() = self.danioBase() + potenciador.danio()
    
    method potenciar(nuevoPotenciador) {
        potenciador = nuevoPotenciador
    }
}

class Pistola inherits Arma {
    override method danioBase() = 5
}

class Escopeta inherits Arma {
    override method danioBase() = 20
}

class Rifle inherits Arma {
    override method danioBase() = 22
}

object cuchillo {
    method danio() = 10
    method cambiarPotenciador(nuevoPotenciador) {
        // No hace nada, no puede tener potenciador
    }
}


// Items

class ItemDeDanio {
    method esDeCura() = false
}

class Potenciador inherits ItemDeDanio {
    const property danioExtra

    method usar(jugador, rival) {
        jugador.potenciarArma(self)
    }
}

const sinPotenciador = new Potenciador(danioExtra=0)
const balasDeFuego = new Potenciador(danioExtra=5)
const silenciador = new Potenciador(danioExtra=3)

object granada inherits ItemDeDanio {
    method usar(jugador, rival) {
        rival.recibirDanio(30)
    }
}

class ItemDeCura {
    const cantidadACurar

    method esDeCura() = true

    method usar(jugador, rival) {
        jugador.curarse(cantidadACurar)
    }
}

const botiquin = new ItemDeCura(cantidadACurar=100)
const mini = new ItemDeCura(cantidadACurar=30)

// Partida
class Partida {
    const mapa = []

    // Turno
    method pasarTurno() {
        mapa.forEach {zona => zona.enfrentarse()}
    }

    // Eventos
    method cerrarMapa() {
        const zona = self.zonaACerrar()
        zona.enfrentarse()
        self.cerrarZona(zona)
    }

    method zonaACerrar() = mapa.find {zona => not zona.estaCerrada()} // Si no hay ninguna abierta, falla
    method zonasAbiertas() = mapa.filter {zona => not zona.estaCerrada()}

    method cerrarZona(zona) {
        zona.jugadores().forEach {jugador => self.avanzarJugador(jugador)}
        zona.cerrar()
    }

    method avanzarJugador(jugador) {
        self.zonaDestino(jugador).agregar(jugador)
    }

    method zonaDestino(jugador) {
        // 0 es la zona que se está cerrando
        // 1 es la zona que sigue a la que se cierra
        // 2 es dos zonas luego de la que se cierra
        return self.zonasAbiertas().get(jugador.zonasAAvanzar())
    }

    method jugadores() = mapa.flatMap {zona => zona.jugadores()}

    method laManoDeDios() {
        self.jugadores().filter {jugador => jugador.tieneSkin("Maradona")}.forEach {jugador => jugador.agregarItem(botiquin)}
    }

    // Consultas
    method recienArranca() = self.zonasAbiertas() == mapa

    method cantidadJugadores() = self.jugadores().size()
    method hayGanador() = self.cantidadJugadores() == 1

    method losVivos() = self.jugadores() // Esto puede variar según cómo implementan quién murió

    method seBuggeo() = self.cantidadJugadores() == 0
}

object profe {
    method pares(lista) {
        const listaMezclada = lista.randomized()
        console.println(listaMezclada)
        const resultado = []
        (0..listaMezclada.size().div(2) - 1).forEach{ i =>
            const indice = i * 2
            resultado.add([listaMezclada.get(indice), listaMezclada.get(indice+1)])
        }
        return resultado
    }
}

class Zona {
    const property jugadores = #{}
    var estaCerrada = false

    method agregar(jugador) {
        jugadores.add(jugador)
    }

    method enfrentarse() {
        self.duelos().forEach {duelo => self.ejecutarDuelo(duelo)}
        self.eliminarMuertos()
    }

    method duelos() = profe.pares(jugadores)

    method ejecutarDuelo(duelo) {
        duelo.forEach {jugador => jugador.consumirItem()}
        const jugador1 = duelo.first()
        const jugador2 = duelo.last()
        jugador1.atacar(jugador2)
        jugador2.atacar(jugador1)
    }

    method eliminarMuertos() {
        jugadores.removeAllSuchThat {jugador => jugador.murio()}
    }

    // Eventos
    method cerrar() {
        estaCerrada = true
        jugadores.clear() // Eliminar todo jugador vivo que no avanzó (campers)
    }
}