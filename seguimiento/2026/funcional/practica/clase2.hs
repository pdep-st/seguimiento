import PdePreludat

triple :: Number -> Number
triple numero = numero * 3

doble :: Number -> Number
doble numero = numero * 2

sextuple numero = doble(triple(numero))

fLoca numero otroNumero = (numero + otroNumero) * 3

-- alargarUnPoco/1: Recibe la longitud de un cable 
-- y le agrega 10 metros

alargarUnPoco :: Number -> Number
alargarUnPoco longitud = longitud + 10

-- sirve/1: Recibe la longitud de un cable y dice 
-- si es menor al largo maximo

largoMaximo = 100

sirve :: Number -> Bool
sirve longitud = longitud < largoMaximo

-- sirveAlargandoUnPoco/1
-- nos indica si una longitud es util luego de alargarla 10 metros

sirveAlargandoUnPoco :: Number -> Bool
sirveAlargandoUnPoco longitud = (sirve . alargarUnPoco) longitud


signo :: Number -> Number
signo x 
    |x < -10 = -1 
    |x < 0 = 0
    |otherwise = 1


{-
esMayorDeEdad :: Number -> Bool
esMayorDeEdad edad 
    |edad >= 18 = True
    |otherwise = False

-}

esMayorDeEdad :: Number -> Bool
esMayorDeEdad edad = edad >= 18 


floca algo 
    |algo < 3 = "Antonio"
    |otherwise = 8


-- en procedural
{- 
int signo(int numero) {

    if (numero < 0) {
        return -1 
        }
    else if (numero == 0) {
        return 0
        }
    else {
        return 1
        }
}
-}