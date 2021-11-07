class Resumen {
	const intro = ""
	const secciones = #{}
	
	method agregarSeccion(seccion) {
		secciones.add(seccion)
	}
	
	method tieneReferencia() = secciones.any({
		seccion => seccion.tieneReferencia()
	})
	
	method tieneCancion(cancion) = secciones.any({
		seccion => seccion.tieneCancion(cancion)
	})
	
	method duracion() = intro.length() * 10 + secciones.sum({ seccion => seccion.duracion() })

	method libreto() = ([intro] + secciones.map({ seccion => seccion.speech()})).join(".")

}

class Seccion {
	const duracion
	const speech
	
	method duracion() = duracion
	method speech() = speech
	method tieneReferencia() = false
	method tieneCancion(_cancion) = false
}

class SeccionMusicalizada inherits Seccion {
	const cancion

	override method tieneCancion(_cancion) = cancion == _cancion 
}

class SeccionReferencia inherits Seccion {
	const resumen
	override method duracion() = super() + resumen.duracion()
	override method speech() = super() + resumen.libreto()
	override method tieneReferencia() = true
}