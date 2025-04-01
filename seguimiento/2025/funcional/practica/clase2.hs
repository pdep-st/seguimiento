import Text.Show.Functions

doble x = 2 * x

triple x = 3 * x

f = doble
g = triple


-- alargarUnPoco/1: Recibe la longitud de un cable 
-- y le agrega 10 metros

alargarUnPoco :: Int -> Int
alargarUnPoco longitud
    | longitud > 0 = longitud + 10
    | otherwise = longitud

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
signo x
    | x < 0 = -1
    | x > 0 = 1
    | otherwise = 0

{-
Expresado en procedural:
    def signo(x) {
        if x < 0
            return -1
        else if x > 0
            return 1
        else
            return 0
    }
-}


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
esMayorA10DespuesDeIncrementar x -- El que hace esto, le corto los dedos
    | x + 1 > 10 = True
    | otherwise = False

esMayorA10DespuesDeIncrementar' x = x + 1 > 10

noEsMayorA10DespuesDeIncrementar = not . esMayorA10DespuesDeIncrementar'