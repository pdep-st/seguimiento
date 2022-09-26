/*
 * Iña se cansó de su vida de programador y decidió salir a pasear
 * con su perra Mini y se dio cuenta que cada vez que salían, disminuía
 * su energía en una cantidad fija de 10.
 * Modelar a Iña que sale a pasear con Mini.
 */

object inia {

	const mascotas = #{}

	method pasear(distancia) {
		mascotas.forEach({ mascota => mascota.pasear(distancia)})
	}

	method pasear() {
		self.pasear(2)
	}

	method agregarMascota(mascota) {
		mascotas.add(mascota)
	}

	method mascotas() {
		return mascotas.copy()
	}

}

/*
 * Con el tiempo, Iña sumó a su gata Mía a sus paseos. De manera
 * similar a Mini, su gata perdía energía, pero era 5
 * por cada kilómetro que recorrían.
 * Modelar este nuevo requerimiento.
 */
class Gato {

	var property energia = 100

	method pasear(distancia) {
		const cantidadADisminuir = 5 * distancia
		self.disminuirEnergia(cantidadADisminuir)
	}

	method disminuirEnergia(cantidad) {
		const nuevaEnergia = energia - cantidad
		energia = 0.max(nuevaEnergia)
	}

}

class Perro {

	var property energia = 100

	method pasear(distancia) {
		self.disminuirEnergia(10)
	}

	method disminuirEnergia(cantidad) {
		const nuevaEnergia = energia - cantidad
		energia = 0.max(nuevaEnergia)
	}

}

/*
 * Iña se dio cuenta que era un negocio rentable pasear mascotas
 * por lo que empezó a pasear mascotas de sus vecinos.
 * Se dio cuenta que todos los gatos se comportaban igual, mientras que
 * los perros eran todos iguales excepto los golden, que gastan el doble
 * que los otros perros.
 * Modelar este nuevo requerimiento.
 */
object rocco {

	var property energia = 100

	method pasear(distancia) {
		self.disminuirEnergia(20)
	}

	method disminuirEnergia(cantidad) {
		const nuevaEnergia = energia - cantidad
		energia = 0.max(nuevaEnergia)
	}

}

