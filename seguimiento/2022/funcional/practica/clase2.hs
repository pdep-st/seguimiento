import Text.Show.Functions
-- alargarUnPoco/1: Recibe la longitud de un cable 
-- y le agrega 10 metros
alargarUnPoco longitud = longitud + 10

-- sirve/1: Recibe la longitud de un cable y dice 
-- si es mayor al largo maximo
largoMaximo = 30
sirve longitud = longitud > largoMaximo


-- sirveAlargandoUnPoco/1
-- sirveAlargandoUnPoco longitud = sirve (alargarUnPoco longitud)

-- g(f(x))


-- sirveAlargandoUnPoco longitud = (sirve . alargarUnPoco) longitud
-- esPar = even

sirveAlargandoUnPoco = sirve . alargarUnPoco
-- (g o f)(x)

-- signo/1
signo numero
    | numero > 0 = 1
    | numero == 0 = 0
    | otherwise = -1

-- esPar/1
esPar numero = mod numero 2 == 0

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
-- buenDia dia
--     | dia == "Lunes" = False
--     | dia == "Martes" = 0
--     | dia == "Miércoles" = "Ahí nomás"
--     | dia == "Viernes" = 'X'

identidad x = x

-- esMayorA10DespuesDeIncrementar/1: después de sumarle 1 es mayor a 10
-- esMayorA10DespuesDeIncrementar :: (Num a, Ord a) => a -> Bool
esMayorA10DespuesDeIncrementar numero = (numero + 1) > 10

-- fLoca :: (Num a, Ord a) => a -> a -> Bool
fLoca x y = (x + 1) > y

otraF x y
    | x > "String" = "Chau"
    | (y + 1) == 0 = "Hola"
    | otherwise = "Para que no rompa"


doble x = 2 * x

-- tresVecesDoble x = doble (doble (doble x))
-- tresVecesDoble x = (doble . doble . doble) x
tresVecesDoble = doble . doble . doble