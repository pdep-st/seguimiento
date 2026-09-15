object amigoCopado {
    const nombre = "Axel";
    var plata = 1200;

    method nombre() = nombre;

    method damePlata() {
        if(plata > 1000) {
            plata -= 500
            return 500
        }
        else {
            plata -= 100
            return 100
        }
    }
} 

object guardaBilletes {
    var plata = 3000

    method damePlata() {
        plata -= 1000
        return 1000
    }
}
object papa {
    const nombre = "Franco"
    var property billetera = guardaBilletes

    method damePlata() {
        return billetera.damePlata()
    }

    method nombre() = nombre
}

object monedero {
    var monedas = 1000

    method sacarPlata() {
        return monedas 
    }
}

object bostero {
    var campera = null

    method nombre() {
        return "Aguante bokita papa!!!!"
    }

    method sacarCampera() {
        campera = null
    }

    method cambiarCampera() {
        if(campera == camperaNegra) {
            campera = camperaVerde
        }
        else {
            campera = camperaNegra
        }
    }
}

object camperaNegra {}

object camperaVerde {}

object mati {
    method jugarEnClase(alguien) {
        alguien.damePlata()
    }
}