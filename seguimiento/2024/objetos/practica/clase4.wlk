/*
Tenemos a Dora que, ademas de otra gente,
quiere sacar plata del cajero y guardarla en su monedero
Cuando el cajero no cuenta con el disponible,
Dora intenta sacar la mitad de la plata. Si no, no saca nada
*/

object dora {
    var monedero = 0

    method plata() {
        return monedero
    }

    /*method sacarPlata(cantidad) {
        try {
            self.tratarDeSacar(cantidad)
        } catch exception {
            try {
                self.tratarDeSacar(cantidad / 2)
            } catch exception {}
        }
    }*/

    method sacarPlata(cantidad) {
        self.sacarO(cantidad, {self.sacarO(cantidad/2, {})})
    }

    method sacarO(cantidad, bloque) {
        try {
            self.tratarDeSacar(cantidad)
        } catch exception {
            bloque.apply()
        }
    }

    method tratarDeSacar(cantidad) {
        monedero += cajero.sacarPlata(cantidad)
    }
}

// Exceptions: Excepciones <- Errores

object cajero {
    var dineroDisponible = 100000

    method sacarPlata(cantidad) {
        if (dineroDisponible >= cantidad) {
            dineroDisponible -= cantidad
            return cantidad
        }
        throw new DomainException(message="No hay suficiente plata para sacar")
    }
}


object miObjeto {
    method lanzar(numero) {
        if (numero < 10)
            throw new DomainException(message="Lanzado")
        if (numero > 100)
            throw new ElementNotFoundException()
        if (numero == 99)
            throw new Exception()
        if (numero == 98)
            throw new MessageNotUnderstoodException()
    }

    method atrapar(numero) {
        try {
            self.lanzar(numero)
            return 20
        } catch exception: ElementNotFoundException {
            return 100
        } catch exception: DomainException {
            return 80
        }
    }

    method metodoLoco(valor, excepcion) {
        if (valor == "Fallá") {
            throw excepcion
        }
    }

    method excepcion() {
        return new DomainException(message="copado, no?")
    }
}