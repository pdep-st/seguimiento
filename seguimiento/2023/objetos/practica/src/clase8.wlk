class Socio {
	var cuotasImpagas = []
	var bonos = []
	
	method pagarDeudas() {
		cuotasImpagas.forEach {cuota => cuota.pagar(self)}
		bonos.filter({bono => bono.vencio()})
			 .forEach {bono => bono.pagar(self)}
	}
	
}

class Socio2 {
	var cosasAPagar
	
	method pagarDeudas() {
		cosasAPagar.filter({cosa => cosa.esBono() && cosa.vencio()})
				   .forEach {cosa => cosa.pagar(self)}
	}
}

class Socio3 {
	var cuotasImpagas = []
	var bonos = []
	
	method pagarDeudas() {
		const deudas = cuotasImpagas + bonos.filter({bono => bono.vencio()})
		deudas.forEach {deuda => deuda.pagar(self)}
	}
}

object edu {
	method romper() {
		return new Exception(message="Así o más?")
	}
	
	method deVerdad(){
		if (8==8){
			throw new Exception(message="Ahora sí")
		}
		return 3
	}
	
	method otro() {
		try {
			return self.deVerdad()
		} catch error: Exception {
			console.println("Mirá que rompió, pero yo ya lo sé")
			throw new Exception(message="Rompí porque rompió el otro: " + error.message())
		}
	}
}


// Te lo resumo así nomás

class Resumen {
	const secciones = #{}
	const introduccion
	
	method agregarSeccion(seccion) {
		secciones.add(seccion)
	}
	
	method duracion() {
		return self.duracionSecciones() + self.duracionIntroduccion()
	}
	
	method duracionSecciones() {
		return secciones.sum {seccion => seccion.duracion()}
	}
	
	method duracionIntroduccion() {
		return introduccion.words().size() * 10
	}
	
	method tieneCancion(cancion) {
		return secciones.any {seccion => seccion.tieneCancion(cancion)}
	}
	
	method referenciaA(resumen) {
		return secciones.any {seccion => seccion.referenciaA(resumen)}
	}
	
	method libreto() {
		const speeches = [introduccion]
		speeches.addAll(secciones.map {seccion => seccion.speech()})
		return speeches.join(". ")
	}
}

class Seccion {
	const property duracion
	const property speech
	
	override method ==(otraSeccion) {
		return duracion == otraSeccion.duracion() && speech == otraSeccion.speech()
	}
	
	method tieneCancion(unaCancion) = false
	
	method referenciaA(resumen) = false
}

class SeccionMusicalizada inherits Seccion {
	const cancion
	
	override method tieneCancion(unaCancion) = unaCancion == cancion
}

class SeccionConReferencia inherits Seccion {
	const referencia
	
	override method referenciaA(resumen) = referencia == resumen
	
	override method duracion() {
		return referencia.duracion() + super()
	}
	
	override method speech() {
		return super() + '. ' + referencia.libreto()
	}
}

/*
 * var resumen = new Resumen(introduccion="Resumen de Spiderman")
 * var seccion = new Seccion(duracion=20, speech="Hola amigos... resumen de Spiderman")
 * var seccionMusicalizada = new SeccionMusicalizada(cancion="Jijiji", duracion=30, speech="Algo relacionado a Los Redondos")
 * resumen.agregarSeccion(seccion)
 * resumen.duracion()
 */
 
class Punto{
 	var property x
 	var property y
 	
 	override method toString() {
 		return "X: " + x + ", Y: " + y
 	}
 	
 	method +(punto) {
 		x += punto.x()
 		y += punto.y()
 		return self
 	}
}

class Puntov2{
 	const property x
 	const property y
 	
 	override method toString() {
 		return "X: " + x + ", Y: " + y
 	}
 	
 	method +(punto) {
 		return new Puntov2(
 			x = x + punto.x(),
 			y = y + punto.y()
 		)
 	}
}
