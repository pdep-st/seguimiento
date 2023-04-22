import Text.Show.Functions
import Data.List

-- esNombreLargo: un nombre es largo cuando excede
-- los 7 caracteres

longitudMaxima = 7
esNombreLargo = (>longitudMaxima) . genericLength

-- max entre 0 y mi número
maximoEntre0 = max 0

esPositivo = (>0)

-- esDivisiblePorDos

esDivisiblePorDos numero = mod numero 2 == 0
-- esDivisiblePorDos numero = (==0) (mod numero 2)
-- esDivisiblePorDos numero = ((==0) . mod numero) 2
-- esDivisiblePorDos = (==0) . (`mod`2)
-- esDivisiblePorDos = (==0) . (flip mod 2)

-- sumaDeTres: suma tres números

-- precioDeMensaje:
-- Un mensaje sale 3 pesos por cada caracter


fLoca :: Int -> Int -> Int -> Int
fLoca x y z = x - y + (z * 2)
-- aplicar x = 2, y = 1, z = 3
-- fLoca 2 1 3 -> 7
-- aplicar x = 2, y = 1
-- fLoca 2 1 -> function :: Int -> Int :: 1 + (z * 2)
-- aplicar x = 2
-- fLoca 2 -> function :: Int -> Int -> Int :: 2 - y + (z * 2)
-- no aplicar nada
-- fLoca -> fLoca
-- aplicar y = 1, z = 3
-- aplicar fLoca 1 3 -> function :: Int -> Int :: x - 1 + (3 * 2)

aplicar f y z x = f x y z

-- flip
flipito f y x = f x y

-- crear dos listas y jugar!

lista1 = [1, 2, 3]
lista2 = [4, 5, 6]


-- Hora de Lectura
