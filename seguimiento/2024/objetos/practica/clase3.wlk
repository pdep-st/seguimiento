/*
 * Iña se cansó de su vida de programador y decidió salir a pasear
 * con su perra Lassie y se dio cuenta que cada vez que salían, disminuía
 * su energía en una cantidad fija de 10.
 * Modelar a Iña que sale a pasear con Lassie.
 */
 
object lassie {
    var energia = 100

    method energia() = energia

    method pasear() {
        energia -= 10
    }
}

object inia {
    var perro = lassie
    var gato = doja

    method pasear(cantidadKms) {
        gato.pasear(cantidadKms)
        perro.pasear()
    }
}
 
// TDD: Test Driven Development
 
 /*
 * Con el tiempo, Iña sumó a su gata Doja a sus paseos. De manera
 * similar a Lassie, su gata perdía energía, pero era 5
 * por cada kilómetro que recorrían.
 * Modelar este nuevo requerimiento.
 */
 
object doja {
    var energia = 100

    method energia() = energia

    method pasear(cantidadKms) {
        energia -= 5 * cantidadKms
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
