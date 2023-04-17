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

-- dividir: un número por otro,
-- obteniendo la parte entera y el resto
dividir numero otroNumero = 
  (numero `div` otroNumero , numero `mod` otroNumero)
-- esPar usando dividir

-- punto: x, y

punto = (1, (-3))

sumarPuntos unPunto otroPunto = 
  (fst unPunto + fst otroPunto, snd unPunto + snd otroPunto)

-- nacimiento (año, mes, dia)
fecha = (1993, 11, 10)
nacimientoGustavo = (2001, 11, 4)

anio (elAnio, _, _) = elAnio
mes (_, mes, _) = mes
dia (_, _, dia) = dia

-- persona: Nombre, Apellido, Edad
persona = ("Martín", "Gotelli", 29)

-- auto: Marca, Modelo, Año
auto = ("Fiat", "Cronos", 2018)
clio = ("Renault", "Clio", 2010)

marca (marca, _, _) = marca
modelo (_, modelo, _) = modelo
anioAuto (_, _, anio) = anio

-- cumplirAnios: Crecer un año

-- tieneNombreLargo
