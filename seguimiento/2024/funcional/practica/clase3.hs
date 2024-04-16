import Text.Show.Functions
import Data.List

--maximoDeTres :: Int -> Int
maximoDeTres numero = max numero 3
--noMeImportaElPrimero

--Quiero una funcion que cuando recibe un numero par, me devuelva el doble. 
-- Si no, me devuelve el mismo numero
dobleCuandoEsPar numero
    | even numero = numero * 2
    | otherwise = numero
    

-- esNombreLargo: un nombre es largo cuando excede
-- los 7 caracteres
esMayorASiete numero = numero > 7
cantidadDeCaracteres nombre = genericLength nombre

--esNombreLargo' nombre = esMayorASiete (cantidadDeCaracteres nombre)

esNombreLargo = esMayorASiete . cantidadDeCaracteres
esNombreLargo2 = esMayorASiete # cantidadDeCaracteres


-- Definir la función (#)

(#) g f x = g ( f x )

(#):: (b -> c) -> (a -> b) -> a -> c
--(#):: (b -> c) -> (a -> b) -> (a -> c)

-- Tipo de la (.)





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