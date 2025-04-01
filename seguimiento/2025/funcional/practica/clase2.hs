import Text.Show.Functions

doble x = 2 * x

triple x = 3 * x

f = doble
g = triple


-- alargarUnPoco/1: Recibe la longitud de un cable 
-- y le agrega 10 metros

alargarUnPoco :: Int -> Int
alargarUnPoco longitud = longitud + 10

-- sirve/1: Recibe la longitud de un cable y dice 
-- si es menor al largo maximo

longitudMaxima = 100

sirve :: Int -> Bool
sirve longitud = longitud < longitudMaxima


-- sirveAlargandoUnPoco/1
-- nos indica si una longitud es util luego de alargarla 10 metros

sirveAlargandoUnPoco :: (Int -> Bool)
-- sirveAlargandoUnPoco longitud = sirve (alargarUnPoco longitud)
sirveAlargandoUnPoco = sirve . alargarUnPoco

-- (.) :: funcion -> funcion -> funcion

-- g o f (x) = g(f(x))

--tresVecesDoble unNumero = ?
tresVecesDoble :: (Int -> Int)
tresVecesDoble = doble . doble . doble

-- signo/1


{-
Expresado en procedural:

-}

-- divisible3/1
divisible3 numero = not (numero `mod` 3 /= 0)

fLoca x y
    | x > 0 = y < 0
    | otherwise = y > 0

fLoca' x y = (x > 0 && y < 0) || (y > 0) -- No es correcto, Martín se equivocó

-- probabilidadLluvia/1 (clima)
--   "Despejado"      0
--   "Nublado"        50
--   "Relampaguea"    100
--   cualquierOtro    40


-- buenDia/1
-- "Lunes"  False
-- "Martes" 0
-- "Miércoles" "Ahí nomás"
-- "Viernes" 'X'

{-
buenDia dia
    | dia == "Lunes" = False
    | dia == "Martes" = 0
    | dia == "Miércoles" = "Ahí nomás"
    | dia == "Viernes" = 'X'
-}

-- esMayorA10DespuesDeIncrementar/1