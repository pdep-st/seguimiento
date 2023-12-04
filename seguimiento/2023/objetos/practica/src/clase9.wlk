// Te lo resumo así nomás

class Resumen {
	const secciones = #{}
	const introduccion
	var property likes = 0
	var property dislikes = 0
	
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
	
	method tieneReferencia() {
		return secciones.any {seccion => seccion.tieneReferencia()}
	}
	
	method libreto() {
		const speeches = [introduccion]
		speeches.addAll(secciones.map {seccion => seccion.speech()})
		return speeches.join(". ")
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
	const property speech
	
	override method ==(otraSeccion) {
		return duracion == otraSeccion.duracion() && speech == otraSeccion.speech()
	}
	
	method tieneCancion(unaCancion) = false
	
	method referenciaA(resumen) = false
	
	method tieneReferencia(resumen) = false
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
	
	override method tieneReferencia(resumen) = true
}

/*
 * var resumen = new Resumen(introduccion="Resumen de Spiderman")
 * var seccion = new Seccion(duracion=20, speech="Hola amigos... resumen de Spiderman")
 * var seccionMusicalizada = new SeccionMusicalizada(cancion="Jijiji", duracion=30, speech="Algo relacionado a Los Redondos")
 * resumen.agregarSeccion(seccion)
 * resumen.duracion()
 */
 
 
 
class Espectador {
	
	var property duracionDeseada 
	var property tipo 
	const property cancionesFavoritas = #{}
	const property resumenesPendientes = #{}
	const property resumenesVistos = #{}
	
	method agregarCancionFavorita(cancion) = cancionesFavoritas.add(cancion)
	
	method leGusta(resumen) {
		return self.duracionMenorALaDeseada(resumen) && self.cumpleRequisitos(resumen)
	}
	
	method duracionMenorALaDeseada(resumen){
		return resumen.duracion() <= duracionDeseada
	}
	
	method cumpleRequisitos(resumen){
		return tipo.cumpleRequisito(resumen, self)
	}
	
	method marcarPendiente(resumen){
		resumenesPendientes.add(resumen)
	}
	
	method verResumen(resumen) {
		resumenesPendientes.remove(resumen)
		resumenesVistos.add(resumen)
		
		if (self.leGusta(resumen)) {
			resumen.darLike()
		} else {
			resumen.darDislike()
		}
	}
	
	method esAdicto(resumenes) = resumenesVistos.size() / resumenes.size() >= 0.8
}

object nuevoEspectador {
	method cumpleRequisito(resumen, espectador) = true
}

object follower {
	method cumpleRequisito(resumen, espectador){
		return espectador.cancionesFavoritas().any{ cancion => resumen.tieneCancion(cancion)}
	}
}

object fan {
	method cumpleRequisito(resumen, espectador){
		return self.tieneTodasLaCancionesFavoritas(resumen, espectador) && self.referenciaAOtroResumen(resumen)
	}
	
	method tieneTodasLaCancionesFavoritas(resumen, espectador) {
		return espectador.cancionesFavoritas().all{ cancion => resumen.tieneCancion(cancion)}
	}
	
	method referenciaAOtroResumen(resumen) = resumen.tieneRefencia()
	
}

// ResumenAsiNomas

class ResumenAsiNomas inherits Resumen {
	
	var property factorVelocidad
	const property resumenes = #{}
	
	override method duracion() {
		return super() * factorVelocidad
	}
}

// Suscriptores y canal

object canalYoutube {
	const suscriptores = #{}
	const resumenes = #{}
	
	method agregarSuscriptor(suscriptor) { suscriptores.add(suscriptor) }
	
	method agregarResumen(resumen) { 
		const suscriptoresQueLesGusta = self.suscriptoresQueLesGusta(resumen)
		self.validarQueLeGusteAAlguien(suscriptoresQueLesGusta)
		resumenes.add(resumen)
		suscriptoresQueLesGusta.forEach{ suscriptor => suscriptor.marcarPendiente(resumen)}
	}
	
	method suscriptoresQueLesGusta(resumen){
		return suscriptores.filter{ suscriptor => suscriptor.leGusta(resumen)}
	}
	
	method validarQueLeGusteAAlguien(suscriptoresQueLesGusta) {
		if(suscriptoresQueLesGusta.isEmpty()){
			self.error("El resumen es MALISIMO, no se agrego.")
		}
	}
	
	method suscriptoresAdictos() = suscriptores.filter{ suscriptor => suscriptor.esAdicto(resumenes)}
	
	method cancionesSolicitadas() = suscriptores.flatMap {suscriptor => suscriptor.cancionesFavoritas()}.asSet()
	
	method resumenConMasLikes() = self.resumenMayorSegun{resumen => resumen.likes() }
	
	method resumenConMasDislikes() = self.resumenMayorSegun{resumen => resumen.dislikes() }
	
	method resumenMayorSegun(criterio) {
		return resumenes.max(criterio)
	}

}


