object dniLuciano {
  method nombre() = "Luciano"
}

object amigoCopado {
  var dni = dniLuciano
  var plata = 1200

  method nombre() = dni.nombre()
  method damePlata() {
    var plataASacar = 500
    if (plata < 1000) {
      plataASacar = 20
    }
    self.sacarPlata(plataASacar)
    return plataASacar
  }

  method sacarPlata(cantidad) {
    plata -= cantidad
  }
}

object billeteraDePapel {
  method damePlata() = 1000
}

object mama {
  var billetera = billeteraDePapel

  method nombre() = "Sofía"

  method damePlata() = billetera.damePlata()

  method cambiarBilletera(nuevaBilletera) {
    billetera = nuevaBilletera
  }
}

object bostero {
  var gorro = piluso

  method nombre() = "Aguante bokita papá"

  method cambiarGorro() {
    if (gorro == piluso) {
      gorro = gorritaBostera
    } else {
      gorro = piluso
    }
  }

  method sacarGorro() {
    gorro = null
  }
}

object piluso {}
object gorritaBostera {}

object pepita {
  var property energia = 100
  const property nombre = "Pepita"

  method energia() = energia
  method energia(cantidad) {
    energia = cantidad
  } 
}