import Text.Show.Functions
-- alargarUnPoco/1: Recibe la longitud de un cable 
-- y le agrega 10 metros

-- sirve/1: Recibe la longitud de un cable y dice 
-- si es mayor al largo maximo


-- sirveAlargandoUnPoco/1


-- g o f (x) = g(f(x))

--tresVecesDoble unNumero = ?

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