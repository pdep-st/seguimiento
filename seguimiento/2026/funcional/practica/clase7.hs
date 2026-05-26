module Library where
import PdePreludat

-- reducir: para permitir la definición de
-- funciones recursivas
reducir semilla f [] = semilla
reducir semilla f (x:xs) = f (reducir semilla f xs) x

-- sumatoria/1
sumatoria :: [Number] -> Number
--sumatoria [] = 0
--sumatoria (x:xs) = x + sumatoria xs
sumatoria numeros = reducir 0 (+) numeros

-- productoria/1
productoria :: [Number] -> Number
--productoria [] = 1
--productoria (x:xs) = x * productoria xs
productoria lista = reducir 1 (*) lista

-- longitud/1
longitud :: [a] -> Number
longitud [] = 0
longitud (_:xs) = 1 + longitud xs

longitud' lista = 
    reducir 0 (\acumulador _ -> acumulador + 1) lista

-- maximum/minimum??

-- restatoria??

-- sumatoria1
