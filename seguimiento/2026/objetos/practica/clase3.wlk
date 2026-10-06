/*
* Iña se cansó de su vida de programador y decidió salir a pasear
* con su perra Lassie y se dio cuenta que cada vez que salían, disminuía
* su energía (de Lassie) en una cantidad fija de 10.
* Modelar a Iña que sale a pasear con Lassie.
*/
// TDD: Test Driven Development
// WKO: Well-Known Object

class Perro {
    var energia = 100
    const property nombre

    method energia() = energia

    method pasear(distanciaKms) {
        energia = (energia - 10).max(0)
    }
}

const lassie = new Perro(nombre="Lassie")

object inia {
    const mascotas = #{lassie, doja}

    method mascotas() = mascotas.copy()

    method pasear(distanciaKms) {
        mascotas.forEach({mascota => mascota.pasear(distanciaKms)})
    }

    method pasear() {
        self.pasear(1)
    }
}

/*
* Con el tiempo, Iña sumó a su gata Doja a sus paseos. De manera
* similar a Lassie, su gata perdía energía, pero era 5
* por cada kilómetro que recorrían.
* Modelar este nuevo requerimiento.
*/

class Gato {
    var energia

    method energia() = energia

    method pasear(distanciaKms) {
        energia = (energia - distanciaKms * 5).max(0)
    }
}

const doja = new Gato(energia=100)

/*
* Iña se dio cuenta que era un negocio rentable pasear mascotas
* por lo que empezó a pasear mascotas de sus vecinos.
* Se dio cuenta que todos los gatos se comportaban igual, mientras que
* los perros eran todos iguales excepto los golden, que gastan el doble
* que los otros perros.
* Modelar este nuevo requerimiento.
*/

// Identidad -> Cada nueva instancia, tiene una nueva identidad
// Comportamiento -> Se comparte entre instancias
// Estado -> No se comparte entre instancias (único por objeto).
// Se comparte la definición de los atributos (no el valor)

// Method Lookup: Miro a mi instancia, si no lo tengo...
// le pregunto a la clase, si no lo tiene -> MessageNotUnderstood (por ahora...)

class Golden {
    var energia = 100
    const property nombre

    method energia() = energia

    method pasear(distanciaKms) {
        energia = (energia - 10 * 2).max(0)
    }
}