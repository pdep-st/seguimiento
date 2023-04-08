-- Qué es la suma?

-- alargarUnPoco/1: Recibe la longitud de un cable 
-- y le agrega 10 metros

-- sirve/1: Recibe la longitud de un cable y dice 
-- si es mayor al largo maximo


-- sirveAlargandoUnPoco/1


-- signo/1


-- esPar/1


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


-- identidad


-- identidad de la suma

-- esMayorA10DespuesDeIncrementar/1: después de sumarle 1 es mayor a 10

fLoca x y = (x + 1) > y

otraF x y
    | x > "String" = "Chau"
    | (y + 1) == 0 = "Hola"
    | otherwise = "Para que no rompa"

otraFSimilar x y
    | x > 3 = "Chau"
    | (y + 1) == 0 = "Hola"
    | otherwise = "Para que no rompa"

doble x = 2 * x

-- tresVecesDoble