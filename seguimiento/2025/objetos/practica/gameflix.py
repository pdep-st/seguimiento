class Prueba:
    def puedeJugar(self, juego):
        return juego.esCategoria("Demo")
    
    def costo(self):
        return 0
    
prueba = Prueba()

class Infantil:
    def puedeJugar(self, juego):
        return juego.esCategoria("Infantil")
    
    def costo(self):
        return 10
    

infantil = Infantil()

class Base:
    def puedeJugar(self, juego):
        return juego.esBarato()
    
    def costo(self):
        return 25
    
base = Base()

class Premium:
    def puedeJugar(self, _juego):
        return True
    
    def costo(self):
        return 50
    
premium = Premium()


class Usuario:
    def __init__(self, suscripcion = prueba, dinero = 0):
        self.suscripcion = suscripcion
        self._dinero = dinero

    def puedeJugar(self, juego):
        return self.suscripcion.puedeJugar(juego)
    
    def pagarSuscripcion(self):
        costo = self.suscripcion.costo()
        if self._dinero < costo:
            self.suscripcion = prueba
        else:
            self._dinero -= costo

class Juego:
    def __init__(self, categoria = "Demo", costo = 25):
        self._categoria = categoria
        self._costo = costo

    def esCategoria(self, categoria):
        return self._categoria == categoria
    
    def esBarato(self):
        return self._costo < 30

    

pedro = Usuario()
juego = Juego()


martina = Usuario( dinero=20, suscripcion=infantil)
bauti = Usuario( dinero=9999, suscripcion=premium)

class Gameflix:
    usuarios = {bauti, martina}
    juegos = set()

    def agregarJuego(self, juego):
        self.juegos.add(juego)

    def darDeAlta(self, usuario):
        self.usuarios.add(usuario)

    def cobrarSuscripcion(self):
        for usuario in self.usuarios:
            usuario.pagarSuscripcion()

gameflix = Gameflix()

def cobrar(veces):
    for _ in range(veces):
        gameflix.cobrarSuscripcion()