-- signo/1
signo x 
    | x > 0 = 1
    | x < 0 = -1
    | x == 0 = 0

-- mayorDeEdad/1 es mayor de edad si su edad es mayor o igual a 18
mayorDeEdad edad = edad >= 18

-- Tarea: maximo/2 devuelve el mayor de los 2
-- ejemplos
-- maximo 1 2  (2)
-- maximo 10 4 (10)

-- Pattern matching (con numeros, con Strings, con Booleanos se puede usar) 
-- basicamente Con Eq
miFuncion 10 = 32
miFuncion 18 = 24
miFuncion n = 2

-- probabilidadLluvia/1
-- *Main> probabilidadLluvia "Tornado"
-- 40
probabilidadLluvia "Despejado" = 0
probabilidadLluvia "Nublado" = 50
probabilidadLluvia "Relampaguea" = 100
-- Uso de variable anonima
probabilidadLluvia _ = 40

otraFuncion _ _ = 10

--probabilidadLluvia clima
--    | clima == "Despejado" = 0
--    | clima == "Nublado" = 50
--    | clima == "Relampaguea" = 100
--    | otherwise = 40


-- Tarea: factorial/1



-- Tipos que hicimos
miPi :: Float 
miPi = 3.14

largoMaximo :: Int
largoMaximo = 100

incrementar:: Int -> Int
incrementar n = n + 1

identidad :: a -> a
identidad x = x

multiplica:: Num a => a -> a -> a 
multiplica x y = x * y

funcionLoca :: a -> a -> b -> b
funcionLoca x y z = z

sirveAlargandoUnPoco:: Int -> Bool
sirveAlargandoUnPoco = 
    sirveCable . alargarUnPoco
