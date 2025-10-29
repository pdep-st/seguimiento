/*
Estamos modelando parte del sistema de una ferretería, donde se quiere conocer el precio de los productos adquiridos en una compra.
Sabemos que el precio de cada producto se calcula como el precio base del mismo, al cual se le hace un recargo de un porcentaje
según el país de origen. Por ejemplo, para Uruguay actualmente sería del 10%, mientras que para Brasil sería del 7%.

* El precio base de una herramienta es 10 veces su peso en gramos.
* Para los materiales de construcción, el precio base se indica de manera explícita para cada uno.
* Al momento, no hay productos que no sean herramientas o materiales de construcción.

*/

class Compra {
    const productos = []
    method totalAPagar() = productos.sum{ producto => producto.precio() }

    method productos() = productos.copy()

    method agregarProducto(producto) {
        productos.add(producto)
    }
}

class Producto{
    var origen 
    method precio() = self.precioBase() * (1 + origen.recargo()/100) 

    method precioBase()
}

class Origen {
    var property recargo
}

class Herramienta inherits Producto {
    const peso

    override method precioBase() = peso * 10
}

class MaterialDeConstruccion inherits Producto {
    var property precioBase
}

class HerramientaProfesional inherits Herramienta{
    override method precio() = super() + 10000
}

class ProductoLimpieza {
    var property precio
}


/*
1. Completar la solución, modelando los orígenes e implementando el método totalAPagar(), precio() y los demás métodos
 y definiciones que sean necesarios para poder calcular el total a pagar de una compra de productos de la ferretería. 

2. Indicar si es V o F y justificar brevemente
    a. Hay polimorfismo en precio(), a pesar que haya una sola implementación de dicho método que es la misma para todos 
        los productos. 
    b. Si se agregaran nuevos cosas que se puedan comprar en la ferreteria para las cuales las clases ya definidas no 
        fueran adecuadas, la clase de la que se instanciarían estos nuevos objetos debe también heredar de Producto.

3. Se agregan algunas herramientas que son de uso profesional, en las que su precio base es también su peso por 10, 
pero para el precio final, luego de aplicarle el recargo del país de origen, se le suman siempre $10.000 de la licencia
 profesional. Modificar la solución para contemplar este nuevo requerimiento. 
*/








class Critico {
    const preferencias = #{}

    method leGusta(restaurant) = self.esPremiado(restaurant) && self.aceptanPreferencias(restaurant)
    
    method esPremiado(restaurant) = restaurant.esPremiado()

    method aceptanPreferencias(restaurant) = preferencias.all{preferencia => preferencia.acepta(restaurant)}
}

object preferenciaLight {
    method cantidadCaloriasMaxima() = 300
    method acepta(restaurant) = restaurant.platos().all { plato => plato.calorias() < self.cantidadCaloriasMaxima() }
}

object preferenciaVariedad {
    method cantidadMinimaPlatos() = 50
    method acepta(restaurant) = restaurant.platos().size() > self.cantidadMinimaPlatos()
}

class Restaurant {
    const platos = #{}
    var property esPremiado = false

    method platos() = platos.copy()
}

class Plato {
    const property origen
    const property chef
    var property calorias
    const property tieneGluten
}


// Final PdeP - 17-02-2024

/*
En nuestro sistema, para que una película rompa estereotipos, en principio su protagonista no debe ser varon.
Además se debe cumplir: en el caso de las películas de aventura, que ese protagonista no sea rescatado;
en el caso de las películas de terror, que todos los personajes sean rescatados;
y en el caso de las de comedia, que sólo tengan un personaje.
Se sabe que los personajes animados no tienen género definido y nunca son rescatados,
y los personajes actuados pueden tener distintos géneros y ser o no rescatados en la película
*/

class Pelicula {                      
  const personajes = []
  method protagonista() = personajes.first()

  method elProtagonistaNoEsVaron() = self.protagonista().esVaron().negate()

  method rompeEstereotipos() {
    return self.elProtagonistaNoEsVaron() and self.rompeCriterioEstereotipico()
  }

  method rompeCriterioEstereotipico()
}
class PeliAventura inherits Pelicula {
  override method rompeCriterioEstereotipico(){
        return self.protagonista().esRescatado().negate()
    }
}
class PeliTerror inherits Pelicula {
  override method rompeCriterioEstereotipico(){
        return personajes.all({p => p.esRescatado()})
    }
}
class PeliComedia inherits Pelicula {
  override method rompeCriterioEstereotipico(){
        return personajes.size() == 1
    }
}
class PersonajeAnimado {
  method esRescatado() = false
  method esVaron() = false
}
class PersonajeActuado {
  const genero
  var property esRescatado
  method esRescatado() = esRescatado
  method esVaron() = genero == "varon"
}



/*
Responder verdadero o falso y justificar conceptualmente en todos los casos:
Escribiendo un método elProtagonistaNoEsVaron en la superclase y usándolo en las subclases se elimina toda repetición de lógica.
    - Se sigue repitiendo lógica, "self.elProtagonistaNoEsVaron() and"
Se está rompiendo el encapsulamiento de los personajes.
    - Se rompe cuando le pido el género y comparo "self.protagonista().genero() != "varon""
Como no hay ifs, se está haciendo un buen uso del polimorfismo.
    - No hay polimorfismo, ya que el criterio de si es varón o no discrimina pregunta si es actuado (múltiples formas = Personaje, discrimina = esRescatado)
*/


// Final 27/07/2024


/*
Se desea modelar las líneas telefónicas que pueden contratar los usuarios de una empresa para poder tener internet en sus dispositivos.
En una línea prepaga, uno puede cargar saldo, que se va agotando con cada kb de internet usado (hay un precio por kb).
En una línea con factura, uno va acumulando kb de internet usados, y al final de mes se cobra lo que se debe pagar.
En una línea control, que es como la línea con factura más restrictiva,
hay un límite de kb y no permite usar internet si se llega a ese límite.
Además, se desea poder conocer un string que muestre el estado de la línea, que incluirá en todos los casos
el nombre del plan, el número de teléfono, y además si es línea prepaga el saldo, y si es línea factura ó control los kb usados.
Importante: una línea debe poder cambiar de plan en cualquier momento.
*/

class Linea {
  var property plan
  var property numero
  var property saldo 
  var property kbUsados

  method estado(){
    return "Tu plan es: " + plan.nombre() + "tu numero es: " + numero + plan.estado()
  }
  
  method usarInternet(kbs){
    plan.usarInternet(kbs)
  }
}

class PlanPrepago {
    var saldo
    const precioPorKb = 20

    method usarInternet(kbs) {
        const saldoAGastar = kbs * precioPorKb
        if (self.plataInsuficiente(saldoAGastar)){
            self.error("No alcanza el saldo")
        }
        saldo -= saldoAGastar
    }

    method estado() = "tu saldo es: " + saldo

    method nombre() = "Prepago"

    method plataInsuficiente(saldoAGastar) = saldo < saldoAGastar
}

class PlanFactura {
    var kbsUsados = 0

    method usarInternet(kbs) {
        kbsUsados += kbs
    }

    method estado() = "usaste kbs: " + kbsUsados

    method nombre() = "Factura"
}

class PlanControl inherits PlanFactura {
    const limiteKbs = 10000

    override method usarInternet(kbs) {
        if (self.noAlcanzaPara(kbs)) {
            self.error("Se ha superado el límite")
        }
       super(kbs)
    }

    method noAlcanzaPara(kbs) = kbs + kbsUsados > limiteKbs

    override method nombre() = "Control"
}

/*
Sin modificar los métodos existentes puede agregarse fácilmente un nuevo tipo de plan
(por ejemplo, un plan “Ilimitado” que siempre permita usar internet), poniendo un string diferente en la variable plan.
    - No, se tiene que agregar otro else if que aumenta la complejidad algorítmica de la solución

Luego de agregar un método llamarPorWhatsapp, implementado de esta forma:
method llamarPorWhatsapp(linea1,linea2){ 
   linea1.usarInternet(250)
   linea2.usarInternet(250) }

Si una de las líneas no tiene saldo o si superó el límite de kb (y, por lo tanto, la llamada no puede ocurrir),
no se le gasta indebidamente internet a la otra.
    - Falso, ambas van a tratar de usarInternet, ninguna va a fallar (no uso excepciones), por lo tanto se gasta a ambas
*/