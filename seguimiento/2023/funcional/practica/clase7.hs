import Text.Show.Functions

-- esNombreLargo = (>7) . length

-- reducir: para permitir la definición de
-- funciones recursivas
reducirL:: (b -> a -> b) -> b -> [a] -> b
reducirL _ semilla [] = semilla
reducirL f semilla (x:xs) = f (reducirL f semilla xs) x

reducirR _ semilla [] = semilla
reducirR f semilla (x:xs) = f x (reducirL f semilla xs)

-- reducirR == foldr
-- reducirL == foldl

-- sumatoria/1
sumatoria:: Num a => [a] -> a
sumatoria = foldl (+) 0

-- productoria/1
productoria:: Num a => [a] -> a
productoria = foldl (*) 1

-- longitud
longitud:: [a] -> Int
longitud = foldl (\acumulado _ -> 1 + acumulado) 0
{-
longitud (_:cola) = (+) 1 (longitud cola)
longitud [] = 0
-}

-- maximum/minimum??
maximo [x] = x
maximo (x:xs) = max x (maximo xs)

minimo [x] = x
minimo (x:xs) = min x (minimo xs)


maximo' lista = foldl1 max lista

minimo' lista = foldl1 min lista
-- restatoria??

restatoria:: Num a => [a] -> a
restatoria = foldr (-) 0

data Persona = Persona {
    nombre :: String
    } deriving (Eq, Show)

personas = [Persona "Inia",
    Persona "Martin",
    Persona "Gaston"
    ]

-- todosLosNombres

-- Golf con Lee Carvallo 
