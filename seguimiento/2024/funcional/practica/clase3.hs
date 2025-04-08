import Text.Show.Functions
import Data.List

--maximoDeTres :: Int -> Int
maximoDeTres numero = max numero 3

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

-- Tipo de la (.)

(#):: (b -> c) -> (a -> b) -> a -> c
--(#):: (b -> c) -> (a -> b) -> (a -> c)

{-
probabilidadLluvia clima
    | clima == "Despejado" = 0
    | clima == "Nublado" = 50
    | clima == "Relampaguea" = 100
    | otherwise = 40
Cuando no es ninguna de las tres sumar un caso
que sea 20 si la cantidad de letras es menor a 3
que sea 30 si la cantidad de letras es exactamente 3
que sea 40 si la cantidad de letras es mayor a 3
-}

-- probabilidadLluvia/1
probabilidadLluvia "Despejado" = 0
probabilidadLluvia "Nublado" = 50
probabilidadLluvia "Relampaguea" = 100
probabilidadLluvia clima
    | length clima == 1 = 0
    | length clima > 1 && length clima < 4 = 20
    | length clima == 4 = 30
    | otherwise = 40

-- noMeImportaElPrimero
-- noMeImportaElPrimero :: a -> b -> b
noMeImportaElPrimero 10 _ = 800
noMeImportaElPrimero _ x = x + 2

-- factorial (5! = 5 * 4!, 0! = 1)
factorial 0 = 1
factorial n = n * factorial (n - 1)


-- dividir: un número por otro,
-- obteniendo la parte entera y el resto
dividir dividendo divisor = (div dividendo divisor, mod dividendo divisor)

-- esPar usando dividir
esPar numero = snd (dividir numero 2) == 0

-- punto: x, y

origen = (0, 0)
puntazo = (1, 3)

-- nacimiento (año, mes, dia)
nacimientoValentina = (2005, 3, 23)

anio (anio, _, _) = anio
mes (_, mes, _) = mes
dia (_, _, dia) = dia

-- persona: Nombre, Apellido, Edad
bauti :: Persona
bauti = ("Bautista", "Leguía", 20)

-- auto: Marca, Modelo, Año
cronos = ("Fiat", "Cronos", 2022)

type Persona = (String, String, Integer)

-- cumplirAnios: Crecer un año
edad (_, _, edad) = edad

cursarUTN:: Persona -> Persona
cursarUTN persona = 
    (cumplirAnios . cumplirAnios . cumplirAnios . 
      cumplirAnios . cumplirAnios . cumplirAnios) persona

cumplirAnios (nombre, apellido, edad) = (nombre, apellido, edad + 1)

-- tieneNombreLargo