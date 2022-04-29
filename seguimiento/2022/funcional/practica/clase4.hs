import Text.Show.Functions

-- esNombreLargo: un nombre es largo cuando excede
-- los 7 caracteres
largoMaximo = 7
excedeLargo :: Int -> Bool
excedeLargo largo = largo > largoMaximo

--length :: String -> Int
esNombreLargo :: String -> Bool
esNombreLargo = excedeLargo . length


-- max entre 0 y mi número
-- esPar
-- sumaDeTres: suma tres números

-- precioDeMensaje:
-- Un mensaje sale 3 pesos por cada caracter

fLoca x y z = x - y + (z * 2)
-- aplicar x = 2, y = 1, z = 3 >
-- aplicar x = 2, y = 1 > 
-- aplicar x = 2 > 
-- aplicar y = 1, z = 3 >


-- Hora de Lectura
