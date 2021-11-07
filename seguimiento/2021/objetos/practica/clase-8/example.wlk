// - modelar la abstraccion punto (x, y)
// - modelar la suma de dos puntos

// opcion mutable
/*
class Punto {
	var property x
	var property y
	
	method sumar(punto2) {
		x = x + punto2.x()
		y = y + punto2.y()
	}
}
 */
 
 // opcion inmutable
 class Punto {
	var property x
	var property y
	
	method sumar(punto2) {
		return new Punto(
			x = x + punto2.x(),
			y = y + punto2.y()
		)
	}
	
	override method ==(punto2) {
		return x == punto2.x() && y == punto2.y()
	}
}

object malaria {}
class Persona {
	var property nombre = ""
	const enfermedades = []
	
	method tenesNombre(_nombre) = nombre == _nombre
	method agregarEnfermedad(enfermedad) {
		enfermedades.add(enfermedad)
	}
}


