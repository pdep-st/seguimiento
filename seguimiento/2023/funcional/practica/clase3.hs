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

-- esNombreLargo nombre = excedeLargo (genericLength nombre)

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
edu = ("Edu", "Montecchia", 27)
donDiego= ("Don Diego de la Vega", "El Zorro", 105)

eduViejo = (cumplirAnios . cumplirAnios) edu

nombre (nombre, _, _) = nombre
apellido (_, apellido, _) = apellido
edad (_, _, edad) = edad

-- auto: Marca, Modelo, Año
auto = ("Fiat", "Cronos", 2018)
clio = ("Renault", "Clio", 2010)

marca (marca, _, _) = marca
modelo (_, modelo, _) = modelo
anioAuto (_, _, anio) = anio

-- cumplirAnios: Crecer un año

cumplirAnios persona = (nombre persona, apellido persona, edad persona + 1)

-- tieneNombreLargo

-- tieneNombreLargo (nombre, _, _) = esNombreLargo nombre

-- tieneNombreLargo persona = esNombreLargo (nombre persona)
-- tieneNombreLargo persona = (esNombreLargo . nombre) persona
tieneNombreLargo = esNombreLargo . nombre

-- tieneNombreLargo = excedeLargo . genericLength . nombre