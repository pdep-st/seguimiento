import Text.Show.Functions
-- alargarUnPoco/1: Recibe la longitud de un cable 
-- y le agrega 10 metros
alargarUnPoco longitud = longitud + 10

-- sirve/1: Recibe la longitud de un cable y dice 
-- si es mayor al largo maximo
longitudMaxima = 25

sirve longitud = longitud > longitudMaxima


-- sirveAlargandoUnPoco/1

--sirveAlargandoUnPoco longitud = sirve (alargarUnPoco longitud)
sirveAlargandoUnPoco = sirve . alargarUnPoco

-- g o f (x) = g(f(x))

doble unNumero = unNumero * 2

--tresVecesDoble unNumero = doble (doble (doble unNumero))
tresVecesDoble = doble . doble . doble

esPar = even

--otherwise = True

-- signo/1
signo numero
    | numero < 0 = -1
    | numero > 0 = 1
    | otherwise = 0

{- 
if numero < 0:
    return -1
elseif numero > 0:
    return 1
else:
    return 0
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

probabilidadLluvia clima
    | clima == "Despejado" = 0
    | clima == "Nublado" = 50
    | clima == "Relampaguea" = 100
    | otherwise = 40



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