object rompe {

	method devolve() {
		return new Exception(message = "Rompí")
	}

	method lanzar(x) {
		try {
			if (x > 0) {
				return try {
					throw self.devolve()
				} catch e : DomainException {
					return 3
				}
			}
			return 0
		} catch e {
			return 22
		}
	}

	method rompe() {
		throw self.devolve()
	}

}

object juanito {

	method llamar() {
		try {
			return rompe.lanzar(1)
		} catch e {
			return 5
		}
	}

}

object pepito {

	method llamar() {
		try {
			return juanito.llamar()
		} catch e {
			return 8
		}
	}

}

class Punto {

	const property x
	const property y

	method +(otroPunto) {
		return new Punto(x = x + otroPunto.x(), y = y + otroPunto.y())
	}

	override method toString() = "x: " + x + ", y: " + y

}

class PuntoMutable {

	var property x
	var property y

	method +(otroPunto) {
		x += otroPunto.x()
		y += otroPunto.y()
		return self
	}

	override method toString() = "x: " + x + ", y: " + y

}

class Billetera {

	var property plata = 0

	method agregaPlata(nuevaPlata) {
		plata += nuevaPlata
	}

}

class Persona {

	const amigos = #{}

	method agregarAmigo(amigo) {
		return new Persona(amigos = amigos + [ amigo ])
	}

	method amigos() {
		return amigos.copy()
	}

}

// Te lo resumo así parcial

/*
 * Punto 1
 * var resumen = new Resumen(introduccion = "Mi intro copada")
 * var seccion = new Seccion(duracion = 120, speech = "Es una sección muy larga")
 * resumen.agregarSeccion(seccion)
 */
 
 /*
 * Punto 2
 * resumen.duracion()
 */
 
 /*
 * Punto 3
 * var seccionMusicalizada = new SeccionMusicalizada(duracion = 30, speech = "Que buen tema!", cancion = "Bohemian Rhapsody")
 * resumen.agregarSeccion(seccionMusicalizada)
 * resumen.tieneCancion("Bohemian Rhapsody")
 */
 
  /*
 * Punto 4
 * var otroResumen = new Resumen(introduccion = "Son cuatro palabras eh")
 * var seccionConReferencia = new SeccionConReferencia(duracion = 40, speech = "Estoy referenciando!", referencia = otroResumen)
 * resumen.agregarSeccion(seccionConReferencia)
 * resumen.referenciaA(otroResumen)
 */

 /*
 * Punto 5
 * resumen.libreto()
 */

class Resumen {
	var property introduccion
	const secciones = #{}
	
	method agregarSeccion(seccion){
		secciones.add(seccion)
	}
	
	method duracion() {
		return self.duracionSecciones() + self.duracionIntroduccion()
	}
	
	method duracionIntroduccion() = introduccion.words().size() * 10
	
	method duracionSecciones() = secciones.sum {seccion => seccion.duracion()}
	
	method tieneCancion(nombre) = secciones.any {seccion => seccion.tieneCancion(nombre)}
	
	method referenciaA(resumen) = secciones.any {seccion => seccion.referenciaA(resumen)}
	
	method libreto() = introduccion + ". " + secciones.map {seccion => seccion.speech()}.join(". ")
	
	method otroLibreto() {
		const speeches = secciones.map {seccion => seccion.speech()}
		return ([introduccion] + speeches).join(". ")
	}
}

class Seccion {
	const property duracion
	var property speech
	
	override method ==(otraSeccion){
		return duracion == otraSeccion.duracion() && speech == otraSeccion.speech()
	}
	
	method tieneCancion(nombre) = false
	
	method referenciaA(resumen) = false
}

class SeccionMusicalizada inherits Seccion {
	const cancion
	
	override method tieneCancion(nombre) = cancion == nombre
}

class SeccionConReferencia inherits Seccion {
	const referencia
	
	override method duracion() {
		return referencia.duracion() + super() 
	}
	
	override method speech() {
		return super() + ". " + referencia.introduccion()
	}
	
	override method referenciaA(resumen) = resumen == referencia
}






 
 