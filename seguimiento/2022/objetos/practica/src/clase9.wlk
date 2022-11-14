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
	var property likes = 0
	var property dislikes = 0

	method agregarSeccion(seccion) {
		secciones.add(seccion)
	}

	method duracion() {
		return self.duracionSecciones() + self.duracionIntroduccion()
	}

	method duracionIntroduccion() = introduccion.words().size() * 10

	method duracionSecciones() = secciones.sum{ seccion => seccion.duracion() }

	method tieneCancion(nombre) = secciones.any{ seccion => seccion.tieneCancion(nombre) }

	method referenciaA(resumen) = secciones.any{ seccion => seccion.referenciaA(resumen) }

	method tieneReferencia() = secciones.any{ seccion => seccion.tieneReferencia() }

	method libreto() = introduccion + ". " + secciones.map{ seccion => seccion.speech() }.join(". ")

	method otroLibreto() {
		const speeches = secciones.map{ seccion => seccion.speech() }
		return ([ introduccion ] + speeches).join(". ")
	}
	
	method darLike() {
		likes += 1
	}
	
	method darDislike() {
		dislikes += 1
	}

}

class Seccion {

	const property duracion
	var property speech

	override method ==(otraSeccion) {
		return duracion == otraSeccion.duracion() && speech == otraSeccion.speech()
	}

	method tieneCancion(nombre) = false

	method referenciaA(resumen) = false

	method tieneReferencia() = false

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

	override method tieneReferencia() = true

}

// Espectadores
/*
 * Punto 2
 * var inia = new Espectador(duracionSoporta = 120, tipo = nuevo)
 * inia.leGusta(resumen)
 */
class Espectador {

	var property duracionSoportada = 600
	var property tipo
	const property cancionesFavoritas = #{}
	const resumenesPendientes = #{}
	const resumenesVistos = #{}

	method leGusta(resumen) {
		return self.duracionAcorde(resumen) && tipo.cumpleCriterio(resumen, self)
	}

	method duracionAcorde(resumen) {
		return resumen.duracion() <= duracionSoportada
	}

	method agregarCancionFavorita(cancion) {
		cancionesFavoritas.add(cancion)
	}
	
	method marcarComoPendiente(resumen) {
		resumenesPendientes.add(resumen)
	}
	
	method esAdicto(resumenes) = resumenesVistos.size() / resumenes.size() > 0.8
	
	method ver(resumen){
		resumenesVistos.add(resumen)
		
		if (self.leGusta(resumen)) {
			resumen.darLike()
		} else {
			resumen.darDislike()
		}
	}

}

object nuevo {

	method cumpleCriterio(resumen, espectador) = true

}

object follower {

	method cumpleCriterio(resumen, espectador) = espectador.cancionesFavoritas().any{ cancion => resumen.tieneCancion(cancion) }

}

object fan {

	method cumpleCriterio(resumen, espectador) {
		return self.tieneTodasLasCancionesFavoritas(resumen, espectador) && self.referenciaAOtroResumen(resumen)
	}

	method tieneTodasLasCancionesFavoritas(resumen, espectador) = espectador.cancionesFavoritas().all{ cancion => resumen.tieneCancion(cancion) }

	method referenciaAOtroResumen(resumen) = resumen.tieneReferencia()

}

// Resumenes Así Nomás
/*
 * var resumenAsiNomas = new ResumenAsiNomas(factorDeVelocidad=1.2, introduccion="Una fruta acá")
 */
class ResumenAsiNomas inherits Resumen {

	const property resumenes = #{}
	var property factorDeVelocidad

	override method duracion() {
		return super() * factorDeVelocidad
	}

}

// Suscriptores
object canalYoutube {

	const suscriptores = #{}
	const resumenes = #{}

	method agregarSuscriptor(suscriptor) {
		suscriptores.add(suscriptor)
	}

	method agregarResumen(resumen) {
		const suscriptoresQueGustan = self.suscriptoresQueGustan(resumen)
		if (not suscriptoresQueGustan.isEmpty()) {
			resumenes.add(resumen)
			suscriptoresQueGustan.forEach {suscriptor => suscriptor.marcarPendiente(resumen)}
		} else {
			self.error('El resumen es una cagada')
		}
	}
	
	method suscriptoresQueGustan(resumen) = suscriptores.filter {suscriptor => suscriptor.leGusta(resumen)}
	
	method suscriptoresAdictos() = suscriptores.filter {suscriptor => suscriptor.esAdicto(resumenes)}
	
	method cancionesSolicitadas() = suscriptores.flatMap {suscriptor => suscriptor.cancionesFavoritas()}.asSet()
	
	method resumenConMasLikes() = resumenes.max {resumen => resumen.likes() }
	
	method resumenConMasDislikes() = resumenes.max {resumen => resumen.dislikes() }
}
