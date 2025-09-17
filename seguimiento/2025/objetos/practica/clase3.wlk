/*
* Iña se cansó de su vida de programador y decidió salir a pasear
* con su perra Lassie y se dio cuenta que cada vez que salían, disminuía
* su energía en una cantidad fija de 10.
* Modelar a Iña que sale a pasear con Lassie.
*/
// TDD: Test Driven Development

class Perro {
    var energia = 100
    const property nombre

    method pasear(_) {
        energia -= 10
    }

    method energia() {
        return energia
    }
}

const lassie = new Perro(nombre="Lassie")

object inia {
    const mascotas = [lassie, doja]

    method pasear(kilometros) {
        mascotas.forEach {mascota => mascota.pasear(kilometros)}
    }

    method agregarMascota(mascota) {
        mascotas.add(mascota)
    }
}

/*
* Con el tiempo, Iña sumó a su gata Doja a sus paseos. De manera
* similar a Lassie, su gata perdía energía, pero era 5
* por cada kilómetro que recorrían.
* Modelar este nuevo requerimiento.
*/

class Gato {
    var energia = 100

    method energia() = energia

    method pasear(kilometros) {
        energia -= kilometros * 5
    }
}

const doja = new Gato()


/*
* Iña se dio cuenta que era un negocio rentable pasear mascotas
* por lo que empezó a pasear mascotas de sus vecinos.
* Se dio cuenta que todos los gatos se comportaban igual, mientras que
* los perros eran todos iguales excepto los golden, que gastan el doble
* que los otros perros.
* Modelar este nuevo requerimiento.
*/

class Golden {
    var energia = 100
    const property nombre

    method pasear(_) {
        energia -= 10 * 2
    }

    method energia() {
        return energia
    }
}