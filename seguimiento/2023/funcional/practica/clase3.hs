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

{-
probabilidadLluvia clima
    | clima == "Despejado" = 0
    | clima == "Nublado" = 50
    | clima == "Relampaguea" = 100
    | otherwise = 40

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