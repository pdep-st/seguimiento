import Text.Show.Functions

type Persona = (String, Int)

martina = ("Martina", 21)
-- nombre (x, y) = fst (x, y)
nombre persona = fst persona
cumplirAnios (nombre, edad) = (nombre, edad + 1)

 -- Cómo serán las raíces de mi cuadrática
 -- discriminante -> b²-4ac
 
 -- > 0  : 2 raíces reales
 -- == 0 : raíz doble
 -- < 0  : 2 raíces imaginarias
 
 -- raices 1 2 1 -> "Tiene raíz doble"
 -- raices 1 2 2 -> "Tiene raíces imaginarias"
 
raices a b c
    | discriminante > 0 = "Reales"
    | discriminante == 0 = "Doble"
    | otherwise = "Imaginarias"
    where discriminante = b ** 2 - 4 * a * c

funcionMatematica x y z
    | calculo * 21 < 0 = 66
    | calculo ^ 2 == 21 = 67
    | otroCalculo 2 == 99 = 10
    | otroCalculo 15 > 0 = 11
    where calculo = otroCalculo z - z
          otroCalculo b = x * y * b

alargarUnPoco longitud = longitud + 10
longitudMaxima = 25
sirve longitud = longitud > longitudMaxima
 
sirveAlargandoUnPoco = sirve . alargarUnPoco

-- lambda
sirveAlargandoUnPoco' = 
    (\longitud -> longitud > longitudMaxima) . (\longitud -> longitud + 10)
    where longitudMaxima = 25
 
 -- esElMismo/2: Se cumple cuando los dos elementos que recibe son iguales
 
 
 -- esDivisiblePorDos
 
fLoca :: Int -> Int -> Int -> Int
fLoca x y z = x - y + (z * 2)
 -- aplicar x = 2, y = 1, z = 3
 -- 
 -- aplicar x = 2, y = 1
 -- 
 -- aplicar x = 2
 -- 
 -- no aplicar nada
 -- 
 -- aplicar y = 1, z = 3
 -- 
 
 
 -- flip