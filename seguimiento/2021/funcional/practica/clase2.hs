
-- alargarUnPoco/1: Recibe la longitud de un cable 
-- y le agrega 10 metros
alargarUnPoco longitud = longitud + 10

-- sirve/1: Recibe la longitud de un cable y dice 
-- si es mayor al largo maximo

sirve longitud = longitud > largoMaximo

-- sirveAlargandoUnPoco/1
-- sirveAlargandoUnPoco longitud =
--    (sirve . alargarUnPoco) longitud
sirveAlargandoUnPoco = sirve . alargarUnPoco

doble numero = 2 * numero

largoMaximo = 100

-- tresVecesDoble numero = 
--    doble (doble (doble numero))
tresVecesDoble :: Int -> Int
tresVecesDoble numero =
  (doble . doble . doble) numero

otraVersionDeTresVecesDoble = doble . doble . doble

-- (g . f) (x)  === g (f x)

-- signo
signo numero
    | numero < 0 = -1
    | numero == 0 = 0
    | otherwise = 1

otraFuncion numero
    | numero > 20 && numero <= 100 = 10
    | numero > 100 = 20
    | otherwise = 1

esPar numero = (mod numero 2) == 0

-- probabilidadLluvia(clima)
--   "Despejado"      0
--   "Nublado"        50
--   "Relampaguea"    100
--   cualquierOtro    40
probabilidadLluvia clima
     | clima == "Despejado" = 0
     | clima == "Nublado" = 20
     | clima == "Relampaguea" = 100
     | otherwise = 40

identidad :: a -> a
identidad x = x

sumarNumeros :: Num a => a -> a -> a
sumarNumeros x y = x + y