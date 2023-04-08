import Text.Show.Functions

-- alargarUnPoco/1: Recibe la longitud de un cable 
-- y le agrega 10 metros
alargarUnPoco:: Int -> Int
alargarUnPoco longitud = longitud + 10

-- sirve/1: Recibe la longitud de un cable y dice 
-- si es mayor al largo maximo
largoMaximo = 25
sirve:: Int -> Bool
sirve longitud = longitud > largoMaximo


-- sirveAlargandoUnPoco/1
-- sirveAlargandoUnPoco longitud = 
--    sirve (alargarUnPoco longitud)

sirveAlargandoUnPoco = sirve . alargarUnPoco

impar = odd 


-- signo/1

signo numero
    | numero < 0 = -1
    | numero == 0 = 0
    | otherwise = 1

-- esPar/1
{--
esPar numero
    | mod numero 2 /= 0 = False
    | otherwise = True
--}

esPar numero = mod numero 2 == 0

esImpar = not . esPar

-- probabilidadLluvia/1 (clima)
--   "Despejado"      0
--   "Nublado"        50
--   "Relampaguea"    100
--   cualquierOtro    40

probabilidadLluvia:: String -> Int
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
{--
buenDia dia
    | dia == "Lunes" = False
    | dia == "Martes" = 0
    | dia == "Miercoles" = "Ahí nomás"
    | dia == "Viernes" = 'X'
--}

-- identidad f(x) = x
-- identidad:: a -> a
identidad x = x


-- esMayorA10DespuesDeIncrementar/1: después de sumarle 1 es mayor a 10
esMayorA10DespuesDeIncrementar::
  (Num x, Ord x) => x -> Bool
esMayorA10DespuesDeIncrementar numero = numero + 1 > 10


-- (>):: Ord a => a -> a -> Bool


fLoca:: (Num a, Ord a) => a -> a -> Bool
fLoca x y = (x + 1) > y


otraF:: (Num a, Eq a) => String -> a -> String
otraF x y
    | x > "String" = "Chau"
    | (y + 1) == 0 = "Hola"
    | otherwise = "Para que no rompa"


otraFSimilar::
  (Num a, Eq a, Ord b, Num b) => b -> a -> String
otraFSimilar x y
    | x > 3 = "Chau"
    | (y + 1) == 0 = "Hola"
    | otherwise = "Para que no rompa"

