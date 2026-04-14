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