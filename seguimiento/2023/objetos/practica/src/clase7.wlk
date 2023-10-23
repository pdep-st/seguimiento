class Golondrina {
	var energia = 0
	
	method comer(gramos) {
		energia += gramos
	}
}


object pepita inherits Golondrina(energia = 90) {
	override method comer(gramos) {
		super(gramos * 2)
	}
}

class Juego {
	const nombre
	var property precio
	const categoria
	
	method esDeCategoria(unaCategoria) = categoria == unaCategoria
	
	method tieneNombre(unNombre) = nombre == unNombre
	
	method esBarato() = precio < 30
}

class NoExisteElJuegoError inherits Exception {
	
}

object gameflix {
	const juegos = #{}
	const usuarios = #{}
	
	method agregarJuego(juego) {
		juegos.add(juego)
	}
	
	method agregarUsuario(usuario) {
		usuarios.add(usuario)
	}
	
	method filtrarPorCategoria(categoria) {
		return juegos.filter {juego => juego.esDeCategoria(categoria)}
	}
	
	method buscarPorNombre(nombre) {
		try {
			return juegos.find {juego => juego.tieneNombre(nombre)}	
		} catch e: ElementNotFoundException {
			throw new NoExisteElJuegoError(message = "No hay juego con nombre: " + nombre)	
		}
	}
	
	method recomendarJuego() = juegos.anyOne()
	
	method cobrar() {
		usuarios.forEach {usuario => self.tratarDeCobrar(usuario)}
	}
	
	method tratarDeCobrar(usuario) {
		try {
			usuario.pagarSuscripcion()
		} catch e {
			usuario.actualizarSuscripcion(prueba)
		}
	}
}

class UsuarioPremium {
	method puedeJugar(juego) = true
	
	method costo() = 50
}

class UsuarioBase {
	method puedeJugar(juego) = juego.esBarato()
	
	method costo() = 25
}

class UsuarioSegunCategoria {
	method puedeJugar(juego) {
		return juego.esDeCategoria(self.categoriaDeseada())
	}
	
	method categoriaDeseada()
}

class UsuarioInfantil inherits UsuarioSegunCategoria {
	override method categoriaDeseada() = "Infantil"
	
	method costo() = 10
}

class UsuarioPrueba inherits UsuarioSegunCategoria {
	override method categoriaDeseada() = "Demo"
	
	method costo() = 0
}

class Usuario {
	var suscripcion
	var plata = 200
	
	method actualizarSuscripcion(unaSuscripcion) {
		suscripcion = unaSuscripcion
	}
	
	method puedeJugar(juego) = suscripcion.puedeJugar(juego)
	
	method costoSuscripcion() = suscripcion.costo()
	
	method pagarSuscripcion() {
		if (self.puedePagarSuscripcion()){
			plata -= self.costoSuscripcion()	
		} else {
			self.error("No tengo plata, perdón... :(")
		}
	}
	
	method puedePagarSuscripcion() = self.costoSuscripcion() <= plata
}

object premium {
	method puedeJugar(juego) = true
	
	method costo() = 50
}

object base {
	method puedeJugar(juego) = juego.esBarato()
	
	method costo() = 25
}

class SuscripcionSegunCategoria {
	method puedeJugar(juego) {
		return juego.esDeCategoria(self.categoriaDeseada())
	}
	
	method categoriaDeseada()
}

object infantil inherits SuscripcionSegunCategoria {
	override method categoriaDeseada() = "Infantil"
	
	method costo() = 10
}

object prueba inherits SuscripcionSegunCategoria {
	override method categoriaDeseada() = "Demo"
	
	method costo() = 0
}