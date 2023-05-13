import Text.Show.Functions

-- esNombreLargo = (>7) . length

-- reducir: para permitir la definición de
-- funciones recursivas

-- sumatoria/1
sumatoria [] = 0
sumatoria (cabeza:cola) = cabeza + sumatoria cola

-- productoria/1
productoria [] = 1
productoria (cabeza:cola) = cabeza * productoria cola

-- longitud
longitud (_:cola) = 1 + longitud cola
longitud [] = 0

-- maximum/minimum??

-- restatoria??

data Persona = Persona {
    nombre :: String
    } deriving (Eq, Show)

personas = [Persona "Inia",
    Persona "Martin",
    Persona "Gaston"
    ]

-- todosLosNombres

-- Golf con Lee Carvallo
