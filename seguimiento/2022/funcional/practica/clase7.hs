-- reducir: para permitir la definición de
-- funciones recursivas

-- longitud
longitud [] = 0
longitud (_:xs) = 1 + longitud xs

-- sumatoria/1
sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria xs

-- productoria/1
productoria [] = 1
productoria (x:xs) = x * productoria xs

-- maximum/minimum??

-- restatoria??

data Persona = Persona {
    nombre :: String
    } deriving (Eq, Show)