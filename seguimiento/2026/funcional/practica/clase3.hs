import PdePreludat

--Quiero una funcion que cuando recibe un numero par, me devuelva el doble. 
-- Si no, me devuelve el mismo numero


-- esNombreLargo: un nombre es largo cuando excede
-- los 7 caracteres

--esNombreLargo' nombre = esMayorASiete (cantidadDeCaracteres nombre)


-- Definir la función (#)

-- Tipo de la (.)


{-
probabilidadLluvia clima
    | clima == "Despejado" = 0
    | clima == "Nublado" = 50
    | clima == "Relampaguea" = 100
    | otherwise = 40
Cuando no es ninguna de las tres sumar un caso
que sea 9 por cada letra si la cantidad de letras es menor a 3
que sea 6 por cada letra si la cantidad de letras es mayor a 3
que sea 30 si la cantidad de letras es exactamente 3
-}

-- probabilidadLluvia/1
probabilidadLluvia "Despejado" = 0
probabilidadLluvia "Nublado" = 50
probabilidadLluvia "Relampaguea" = 100
probabilidadLluvia clima
    | length clima < 3 = 9 * length clima
    | length clima > 3 = 6 * length clima
    | otherwise = 30

-- noMeImportaElPrimero
noMeImportaElPrimero _ x = x

-- fLoca: Cuando x es 0, es la suma de y dos veces con z si z es mayor a 10, si no, es y tres veces sola
-- Cuando x no es 0, es x + y + z
fLoca 0 y z
    | z > 10 = 2 * y + z
    | otherwise = 3 * y
fLoca x y z = x + y + z

-- factorial (5! = 5 * 4!, 0! = 1)
factorial 0 = 1
factorial numero = factorial (numero - 1) * numero

-- dividir: un número por otro,
-- obteniendo la parte entera y el resto

dividir dividendo divisor = (div dividendo divisor, mod dividendo divisor)

-- esPar usando dividir

esPar numero = snd (dividir numero 2) == 0

-- punto: x, y

punto = (1,2)

-- nacimiento (año, mes, dia)

nacimientoAxel = (2004, 10, 29)

anio (anio, _, _) = anio

mes (_, mes, _) = mes

dia (_, _, dia) = dia

-- persona: Nombre, Apellido, Edad
type Persona = (String, String, Number)

axel :: Persona
axel = ("Axel", "Pinto", 21)

-- auto: Marca, Modelo, Año

cronos = ("Fiat", "Cronos", 2020)

-- cumplirAnios: Crecer un año
cumplirAnios (nombre, apellido, edad) = (nombre, apellido, edad+1)

cursarUTN :: Persona -> Persona
cursarUTN persona = (cumplirAnios.cumplirAnios.cumplirAnios.cumplirAnios.cumplirAnios.cumplirAnios) persona

-- tieneNombreLargo
