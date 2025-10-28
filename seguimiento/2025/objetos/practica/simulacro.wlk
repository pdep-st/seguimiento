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
