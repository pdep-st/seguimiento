class Alumno {
    const property legajo
    const nombre
    const edad=18

    override method ==(otroObjeto) {
        return otroObjeto.className() == self.className() and otroObjeto.legajo() == legajo
    }

}

const pedro = new Alumno(legajo=1411526, nombre="Pedro", edad=21)
const pablo = new Alumno(legajo=1411527, nombre="Pablo")
const pedro2 = new Alumno(legajo=1411526, nombre="Pedro", edad=21)


// Gameflix

// Juego - Usuario - gameflix

class Usuario {
    const property nombre
    var dinero = 100
    const amigos = #{}
    var property suscripcion = prueba
    var humor = 100

    method puedeJugar(juego) = suscripcion.puedeJugar(juego)

    method pagarSuscripcion() {
        if (dinero < suscripcion.costo()) {
            suscripcion = prueba
        } else {
            dinero -= suscripcion.costo()
        }
    }

    method reducirHumor(cantidad) {
        humor -= cantidad
    }

    method incrementarHumor(cantidad) {
        humor += cantidad
    }

    method gastar(plata) {
        dinero -= plata
    }
}

object premium {
    method puedeJugar(juego) = true
    method costo() = 50
}
object infantil  {
    method puedeJugar(juego) = juego.esCategoria("Infantil")
    method costo() = 10
}
object base {
    method puedeJugar(juego) = juego.barato()
    method costo() = 25
}
object prueba {
    method puedeJugar(juego) = juego.esCategoria("Demo")
    method costo() = 0
}

class Juego {
    const property nombre
    const categoria
    const valor

    method barato() = valor < 30

    method esCategoria(unaCategoria) = categoria == unaCategoria

    method jugar(usuario, horas)
}

class JuegoMultiCategoria inherits Juego {
    const categorias = #{}

    override method esCategoria(unaCategoria) = categorias.contains(unaCategoria)
}

class JuegoViolento inherits Juego {
    override method jugar(usuario, horas) {
        usuario.reducirHumor(10 * horas)
    }
}

class JuegoMOBA inherits Juego {
    override method jugar(usuario, horas) {
        usuario.gastar(30)
    }
}
class JuegoTerror inherits Juego {
    override method jugar(usuario, horas) {
        usuario.suscripcion(infantil)
    }
}

class JuegoEstrategia inherits Juego {
    override method jugar(usuario, horas) {
        usuario.incrementarHumor(5 * horas)
    }
}

const martina = new Usuario(nombre="Martu", dinero=20, suscripcion=infantil)
const bauti = new Usuario(nombre="Bauti", dinero=9999, amigos=#{martina}, suscripcion=premium)

object gameflix {
    const usuarios = #{bauti, martina}
    const juegos = #{}

    method agregarJuego(juego) {
        juegos.add(juego)
    }

    method darDeAlta(usuario){
        usuarios.add(usuario)
    }

    method cobrarSuscripcion() {
        usuarios.forEach{usuario => usuario.pagarSuscripcion()}
    }
}