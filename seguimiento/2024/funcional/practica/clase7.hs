import Text.Show.Functions

-- reducir: para permitir la definición de
-- funciones recursivas


-- sumatoria/1
sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria xs

-- productoria/1
productoria [] = 1
productoria (x:xs) = x * productoria xs

-- longitud/1
longitud [] = 0
longitud (_:xs) = 1 + longitud xs


-- maximum/minimum??


-- restatoria??


data Persona = Persona {
    nombrePersona :: String
    } deriving (Eq, Show)

personas = [Persona "Inia",
    Persona "Martin",
    Persona "Gaston"
    ]

-- todosLosNombres

-- Golf con Lee Carvallo 
