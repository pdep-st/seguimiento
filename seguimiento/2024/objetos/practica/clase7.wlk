class Golondrina {
    var energia = 0
    const nombre

    method comer(gramos) {
        energia += gramos
    }

    method volar(kms) {
        energia -= kms * 3
    }

    method energia() = energia
}

object pepota inherits Golondrina(energia=80, nombre="pepota") {
    override method comer(gramos) {
        super(gramos * 2)
    }

    override method volar(kms) {
        super(kms * 2)
    }
}

const pepita = new Golondrina(energia=100, nombre="pepita")



// Gameflix

class Juego {
    const property nombre
    var precio
    const categoria

    method esDeCategoria(unaCategoria) = categoria == unaCategoria

    method tieneNombre(unNombre) = nombre.toLowerCase() == unNombre.toLowerCase()

    method esBarato() = precio < 30
}

class JuegoMultiCategoria {
    const categorias

    method esDeCategoria(unaCategoria) = categorias.contains(unaCategoria)
}

const crashBash = new Juego(nombre="Crash Bash", categoria="Aventura", precio=20)
class NoExisteJuego inherits Exception {

}

object gameflix {
    const juegos = #{crashBash}

    method filtrar(categoria) {
        juegos.filter {juego => juego.esDeCategoria(categoria)}
    }

    method buscar(nombre) {
       try {
        return juegos.find {juego => juego.tieneNombre(nombre)}
       } catch ElementNotFoundException {
        throw new NoExisteJuego(message="No existe el juego con nombre: " + nombre)
       }
       
    }
}

class Usuario {
    var property suscripcion = prueba
    var plata = 100
    method puedeJugar(juego) = suscripcion.puedeJugar(juego)
}


object premium {
    method puedeJugar(juego) = true
    method costo() = 50
}

object base {
    method puedeJugar(juego) = juego.esBarato()
    method costo() = 25
}

class ConCategoria {
    method puedeJugar(juego) = juego.esDeCategoria(self.categoria())

    method categoria()
}

const categoriaInfantil = "Infantil"
object infantil inherits ConCategoria {
    override method categoria() = categoriaInfantil
    method costo() = 10
}

object prueba inherits ConCategoria {
    override method categoria() = "Demo"
    method costo() = 0
}