import Text.Show.Functions

-- esNombreLargo: un nombre es largo cuando excede
-- los 7 caracteres
largoMaximo = 7
excedeLargo :: Int -> Bool
excedeLargo largo = largo > largoMaximo

--length :: String -> Int

esNombreLargo :: String -> Bool
esNombreLargo = excedeLargo . length

-- sirveAlargandoUnPoco = sirve . alargarUnPoco

-- (excedeLargo . length) ::
 -- (Int -> Bool) -> (String -> Int) -> (String -> Bool)

-- (.) :: (b -> c)      -> (a -> b)        -> (a -> c)
--------- (Int -> Bool) -> (String -> Int) -> (String -> Bool)
-- (excedeLargo . length) ::

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

probabilidadLluvia "Despejado" = 0
probabilidadLluvia "despejado" = 0
probabilidadLluvia "Nublado" = 50
probabilidadLluvia "Relampaguea" = 100
probabilidadLluvia clima
  | length clima < 3 = 20
  | otherwise = 40


{-
algo x
 | x > 3 = "J"

algo 1 = "H"
-}

-- noMeImportaElPrimero
-- noMeImportaElPrimero :: a -> b -> b
noMeImportaElPrimero _ b = b


-- factorial (5! = 5 * 4!, 0! = 1)
factorial 0 = 1
factorial x = x * factorial(x - 1)

-- dividir: un número por otro,
-- obteniendo la parte entera y el resto

dividir numero otro = (div numero otro, mod numero otro)

-- esPar usando dividir
esPar numero = snd (dividir numero 2) == 0

-- punto: x, y
punto = (4, -8)

nacimiento = (1993, 11, 10)
anio (anio, _, _) = anio
mes (_, mes, _) = mes
dia (_, _, dia) = dia

-- persona: Nombre, Apellido, Edad
type Edad = Integer
type Persona = (String, String, Edad)
iniaki :: Persona
iniaki = ("Iña", "Lopetegui", 24)
nombre :: Persona -> String
nombre (nombre, _, _) = nombre
apellido (_, apellido, _) = apellido
edad (_, _, edad) = edad

-- auto: Marca, Modelo, Año
type Auto = (String, String, Integer)
auto :: Auto
auto = ("Chevrolet", "Corsa", 2004)
-- anio (_, _, anio) = anio --YA ESTÁ DEFINIDO

-- cumplirAnios: Crecer un año
cumplirAnios (nombre, apellido, edad) = (nombre,
    apellido,
    edad + 1)

dameTuNombre persona = nombre persona

zorro = ("Don Diego", "De la vega", 60)

tieneNombreLargo = excedeLargo . length . nombre
-- tieneNombreLargo persona = excedeLargo (length (nombre persona))