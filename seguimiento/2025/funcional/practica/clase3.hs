import Text.Show.Functions
import Data.List

--Quiero una funcion que cuando recibe un numero par, me devuelva el doble. 
-- Si no, me devuelve el mismo numero
dobleCuandoEsMayorA3 numero
    | numero > 3 = 2 * numero
    | otherwise = numero

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
que sea 30 si la cantidad de letras es exactamente 3
que sea 6 por cada letra si la cantidad de letras es mayor a 3
-}

-- probabilidadLluvia/1
probabilidadLluvia "Despejado" = 0
probabilidadLluvia "Nublado" = 50
probabilidadLluvia "Relampaguea" = 100
-- probabilidadLluvia _ = 40 -- Variable Anónima
probabilidadLluvia clima
    | length clima > 3 = min 100 (6 * length clima)
    | length clima < 3 = 9 * length clima
    | otherwise = 30

-- noMeImportaElPrimero
-- noMeImportaElPrimero :: a -> b -> b
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

-- esPar usando dividir

-- punto: x, y


-- nacimiento (año, mes, dia)


-- persona: Nombre, Apellido, Edad


-- auto: Marca, Modelo, Año


-- cumplirAnios: Crecer un año


-- tieneNombreLargo