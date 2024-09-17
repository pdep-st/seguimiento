object dniAgustin {
  method nombre() = "Agustín"
}

object amigo {
  var plata = 1880
  const dni = dniAgustin

  method nombre() {
    return dni.nombre()
  }

  method plataADar() {
    var plataADar = 20
    if (plata > 1000) {
      plataADar = 500
    }
    return plataADar
  }

  method damePlata() {
    var plataADar = self.plataADar()
    plata -= plataADar
    return plataADar
  }
}

const piluso = "Piluso Bostero"
const gorra = "Gorra Bostera"

object bostero {
  var property gorro = piluso

  method cambiarGorro() {
    if (gorro == gorra) {
      gorro = piluso
    } else if (gorro == piluso) {
      gorro = gorra
    } else {
      gorro = "De verdad?..."
    }
  }

  method sacarGorro() {
    gorro = null
  }

  method nombre() = "Aguante bokita papa"
}

object mama {
  const billetera = billeteraFausto

  method damePlata() = billetera.damePlata()

  method nombre() = "Valentina"
}

object billeteraFausto {
  method damePlata() = 1000
}