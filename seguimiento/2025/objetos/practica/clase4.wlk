const album = #{1, 2, 3, 4, 5, 6}

object coleccionista {
    const figuritas = [] // Mutable
    var plata = 1000 // Inmutable

    method abrirSobre(sobre) {
        figuritas.addAll(sobre)
    }

    method completoElAlbum() {
        return album == figuritas.asSet()
    }

    method poderFiguril() = figuritas.sum()

    method figuritas() = figuritas.copy()
    method plata() = plata
}



/*
Tenemos a Dora que, ademas de otra gente,
quiere sacar plata del cajero y guardarla en su monedero
Cuando el cajero no cuenta con el disponible,
Dora intenta sacar la mitad de la plata. Si no, no saca nada
*/
object dora {
    var monedero = 0

    method plata() = monedero

    /*method sacarPlata(plata){
        try {
            monedero += cajero.sacarPlata(plata)
        } catch exception { 
            try {
                monedero += cajero.sacarPlata(plata / 2)
            } catch exception {}
        }
    }*/

    method sacarPlata(plata){
        self.sacarPlataO(plata, {self.sacarPlataO(plata / 2, {})})
    }
    
    method sacarPlataO (plata, bloque) {
        try {
            monedero += cajero.sacarPlata(plata)
        } catch exception {
            bloque.apply()
        }
    }
}

object cajero {
    var disponible = 100000

    method sacarPlata(plata) {
        if (plata <= disponible) {
            self.restarDisponible(plata)
            return plata
        }

        throw new DomainException(message = "No tengo plata")
    }

    method restarDisponible(cantidad) {
        disponible -= cantidad
    }
}

// Excepciones <- Error


object miObjeto {
    method lanzar(numero) {
        if (numero == 10) {
            throw new DomainException(message = "El numero es muy grande")
        }
        if (numero == 20) {
            throw new ElementNotFoundException(message = "No esta el numero")
        }
        if (numero == 30) {
            throw new Exception(message = "Rompio")
        }
        if (numero == 40) {
            throw new MessageNotUnderstoodException(message = "No entiendo")
        }   

        if (numero == 50) {
            throw constructorDeExcepciones.construir()
        }   
        return numero
    }

    method atrapar(numero) {
        try {
            return self.lanzar(numero)
        } catch exception: DomainException {
            return -2
        }
         catch exception: Exception {
            return -1
        }
    }

    method superAtrapar(numero) {
        try {
            return self.atrapar(numero)
        } catch exception: ElementNotFoundException {
            return -3
        }
    }
}

object constructorDeExcepciones {
    method construir() {
        return new OtherValueExpectedException(message = "Error de dominio")
    }
}

