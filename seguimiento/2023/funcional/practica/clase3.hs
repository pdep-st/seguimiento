import Text.Show.Functions
import Data.List

-- (==) :: Eq a => a -> a -> Bool

--noMeImportaElPrimero

-- esNombreLargo: un nombre es largo cuando excede
-- los 7 caracteres
-- esNombreLargo nombre = length nombre > 7
--excedeLargo:: Int -> Bool
excedeLargo longitud = longitud > 7

-- esNombreLargo:: (String -> Bool)
esNombreLargo = excedeLargo . genericLength 

-- Tipo de la (.) usando esNombreLargo
-- Recibe dos parámetros (que son funciones que esperan un parámetro)
-- La entrada del primer parámetro tiene que ser
--  del mismo tipo que la salida del segundo parámetro
-- Retorna una función que espera un parámetro

-- (.) :: (b -> c) -> (a -> b) -> (a -> c)
-- (excedeLargo . length)::
--  (Int -> Bool) -> (String -> Int) -> (String -> Bool)

(#) g f x = g (f x)
-- Definir la función (.)

probabilidadLluvia "Despejado" = 0
probabilidadLluvia "Nublado" = 50
probabilidadLluvia "Relampaguea" = 100
probabilidadLluvia _ = 40

signo 0 = 0
signo numero
    | numero < 0 = -1
    | otherwise = 1

-- ganaNombreLargo/2
-- 1. entre dos nombres, va a ganar (se retorna) el nombre que sea mas largo
-- 2. entre dos nombres de igual longitud gana el primero
-- 3. siempre que compita martin, va a ganar (se retorna) martin

ganaNombreLargo "martin" _ = "martin"
ganaNombreLargo _ "martin" = "martin"
ganaNombreLargo unNombre otroNombre
    | length unNombre >= length otroNombre = unNombre
    | otherwise = otroNombre

--6! = 6*5*4*3*2 = numero

factorial 0 = 1
factorial unNumero = unNumero * factorial (unNumero - 1)

-- si funcionDeSuma es exactamente la suma, que la utilice con los dos numeros
-- si funcinoDeSuma no es exactamente la suma, que sume los dos numeros 
--funcionLoca "+" unNumero otroNumero = (-) unNumero otroNumero
--funcionLoca "-" unNumero otroNumero = (+) unNumero otroNumero
-- funcionLoca (+) 1 2  -> -1
-- funcionLoca (-) 1 2  -> 3

--quienEsMasGrande :: _ -> _ -> String      <- No se puede
quienEsMasGrande :: String -> String -> String 
quienEsMasGrande _ _ = "Boca"

{-
Cuando no es ninguna de las tres sumar un caso
que sea 20 si la cantidad de letras es menor a 3
que sea 40 si la cantidad de letras es mayor o igual a 3
-}


-- noMeImportaElPrimero
-- noMeImportaElPrimero :: a -> b -> b

-- factorial (5! = 5 * 4!, 0! = 1)

-- dividir: un número por otro,
-- obteniendo la parte entera y el resto

-- esPar usando dividir

-- punto: x, y

-- nacimiento (año, mes, dia)

-- persona: Nombre, Apellido, Edad

-- auto: Marca, Modelo, Año


-- cumplirAnios: Crecer un año

-- tieneNombreLargo