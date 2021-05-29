import Text.Show.Functions
--data Persona = Persona { nombre :: String }

-- todosLosNombres [Persona { nombre = "carlos" }, Persona { nombre = "melina" }]
-- "carlos,melina"

-- (nombre (Persona { nombre = "carlos" }) ++ nombre (Persona { nombre = "melina" })) ++ nombre .... 
-- "carlosmelina"
-- personas = [Persona { nombre = "carlos" }, Persona { nombre = "melina" }, Persona { nombre = "maria" }]

-- todosLosNombres:: [Persona] -> String
-- todosLosNombres personas = 
--     drop 1 (foldr (\persona concatenacion -> concatenacion ++ "," ++ nombre persona  ) "" personas)

-- miMaximum :: Ord a => [a] -> a
-- miMaximum [x] = x
-- miMaximum (x: xs) = x `max` (miMaximum xs) 

--miMaximum xs = foldl1 max xs

-- Modelo inicial
data Jugador = UnJugador {
  nombre :: String,
  padre :: String,
  habilidad :: Habilidad
} deriving (Eq, Show)

data Habilidad = Habilidad {
  fuerzaJugador :: Int,
  precisionJugador :: Int
} deriving (Eq, Show)

-- Jugadores de ejemplo
bart = UnJugador "Bart" "Homero" (Habilidad 25 60)
todd = UnJugador "Todd" "Ned" (Habilidad 15 80)
rafa = UnJugador "Rafa" "Gorgory" (Habilidad 10 1)

data Tiro = UnTiro {
  velocidad :: Int,
  precision :: Int,
  altura :: Int
} deriving (Eq, Show)

type Puntos = Int

-- Funciones útiles
between n m x = elem x [n .. m]

maximoSegun f = foldl1 (mayorSegun f)
mayorSegun f a b
  | f a > f b = a
  | otherwise = b

putter :: Habilidad -> Tiro
putter habilidad =  UnTiro {
    velocidad = 10,
    precision = (precisionJugador habilidad) * 2,
    altura = 0
}

madera :: Habilidad -> Tiro
madera habilidad = UnTiro {
    velocidad = 100,
    altura = 5,
    precision = (precisionJugador habilidad) `div` 2 
}

hierro :: Int -> (Habilidad -> Tiro)
hierro n habilidad = UnTiro {
    velocidad = (fuerzaJugador habilidad) * n,
    precision = (precisionJugador habilidad) `div` n,
    altura = max (n - 3) 0
}

hierros = [hierro 1, hierro 2, hierro 3, hierro 4]
palos = [putter, madera] ++ hierros

