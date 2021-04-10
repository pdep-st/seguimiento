-- Constantes
miPi :: Float 
miPi = 3.14

-- La longitud maxima de un cable
largoMaximo :: Int
largoMaximo = 100

incrementar:: Int -> Int
incrementar n = n + 1

-- Función de un parametro
-- identidad/1 (id/1 existe en haskell por default)
identidad :: a -> a
identidad x = x

-- doble/1
-- doble x = (*) 2 x  -- notacion prefija cuando hay operadores
doble x = 2 * x -- cuando hay operadores se pueden usar de manera infija

-- alargarUnPoco/1: Recibe una longitud de un cable y le agrega 10 metros
alargarUnPoco metros = alargarN metros 10
-- noSirveCable/1: Recibe una longitud y dice si supera el largo maximo
sirveCable metros = metros < 100
noSirveCable  = not . sirveCable

-- Función de n parametros
multiplica:: Num a => a -> a -> a 
multiplica x y = x * y

funcionLoca :: a -> a -> b -> b
funcionLoca x y z = z

-- cuentaLoca/2 recibe dos parametros los multiplica y les suma 2
cuentaLoca x y = multiplica x y + 2

-- alargarN/2 recibe una longitud de un cable y la alarga
-- tantos metros como le pasan por parametro
alargarN longitud metrosAdicionales = longitud + metrosAdicionales

-- Composición
-- cuadruple x = 4 * x
-- cuadruple n = doble (doble n)   -- f[g(x)]
-- cuadruple = (doble . doble)   -- (f . g) x
cuadruple = doble . doble

-- import Text.Show.Functions,  trucazo para poder mostrar las funciones por las consola

-- sirveAlargandoUnPoco 
-- sirveAlargandoUnPoco longitud = sirveCable . alargarUnPoco longitud
sirveAlargandoUnPoco:: Int -> Bool
sirveAlargandoUnPoco = 
    sirveCable . alargarUnPoco
