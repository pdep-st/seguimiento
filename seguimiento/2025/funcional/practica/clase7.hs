import Text.Show.Functions

-- reducir: para permitir la definición de
-- funciones recursivas
reducir :: (b -> a  -> b) -> b -> [a] -> b
reducir _ semilla [] = semilla
reducir f semilla (x:xs) = f (reducir f semilla xs) x

foldl' _ semilla [] = semilla
foldl' f semilla (x:xs) =
    foldl' f (f semilla x) xs

foldr' _ semilla [] = semilla
foldr' f semilla (x:xs) =
    foldr' f (f x semilla) xs

-- Restatoria
-- foldl (-) 0 (1:[2,3])
-- foldl (-) (-1) (2:[3])
-- foldl (-) (-3) (3:[])
-- foldl (-) (-6) []

-- foldr (-) 0 (1:[2,3])
-- foldr (-) 1 (2:[3])
-- foldr (-) 1 (3:[])
-- foldr (-) 2 []


-- sumatoria/1
sumatoria = reducir (+) 0

-- productoria/1
productoria :: Num a => [a] -> a
productoria = reducir (*) 1

-- longitud/1
--longitud [] = 0
--longitud (_:xs) = 1 + longitud xs
longitud = reducir (\acumulador _ -> 1 + acumulador) 0

-- maximum/minimum??
maximo :: Ord a => [a] -> a
maximo = foldl1 max
minimo :: Ord a => [a] -> a
minimo = foldl1 min

-- restatoria??
restatoria lista = reducir (-) 0 lista


-- sumatoria1

sumatoria1 xs = foldl1 (+) xs

data Persona = Persona {
 nombrePersona :: String
 } deriving (Eq, Show)

personas = [Persona "Inia",
 Persona "Martin",
 Persona "Gaston"
 ]

-- todosLosNombres

-- Golf con Lee Carvallo
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

between n m x = elem x [n .. m]

type Palo = Jugador -> Tiro

precisionDelJugador = precisionJugador . habilidad
fuerzaDelJugador = fuerzaJugador . habilidad

putter :: Palo
putter jugador = UnTiro {
    velocidad = 10,
    precision = (*2) . precisionDelJugador $ jugador,
    altura = 0
}

madera :: Palo
madera jugador = UnTiro {
    velocidad = 100,
    precision = (`div` 2) . precisionDelJugador $ jugador,
    altura = 5
}

hierro :: Int -> Palo
hierro n jugador = UnTiro {
    velocidad = (*n) . fuerzaDelJugador $ jugador,
    precision = (`div` n) . precisionDelJugador $ jugador,
    altura = max 0 (n - 3)
}

palos :: [Palo]
palos = [putter, madera] ++ map hierro [1..10]

golpe :: Jugador -> Palo -> Tiro
golpe jugador palo = palo jugador

type Obstaculo = Tiro -> Tiro
tiroPiola = UnTiro 100 92 0
tiroAlto = UnTiro 100 92 3

tiroFallido = UnTiro 0 0 0

obstaculo :: (Tiro -> Bool) -> (Tiro -> Tiro) -> Tiro -> Tiro
obstaculo criterioSuperacion modificadorTiro tiro
    | criterioSuperacion tiro = modificadorTiro tiro
    | otherwise = tiroFallido

tunelConRampita :: Obstaculo
tunelConRampita tiro =
    obstaculo supera modificador tiro
    where
        supera tiro = precision tiro > 90 && altura tiro == 0
        modificador tiro = UnTiro {
            velocidad = (*2) . velocidad $ tiro,
            precision = 100,
            altura = 0
        }

laguna :: Int -> Obstaculo
laguna largo tiro =
    obstaculo supera modificador tiro
    where
        supera tiro = velocidad tiro > 80 && between 1 5 (altura tiro)
        modificador tiro = tiro {
            altura = (`div` largo) . altura $ tiro
        }

hoyo :: Obstaculo
hoyo tiro =
    obstaculo supera modificador tiro
    where
        supera tiro = precision tiro > 95 && between 5 20 (velocidad tiro)
        modificador _ = UnTiro 0 0 0


obstaculos = [hoyo, tunelConRampita, laguna 5]

palosUtiles jugador obstaculo =
    filter (\palo -> obstaculo (golpe jugador palo) != tiroFallido) palos
-- Esta solución no cumple con lo requerido si el obstáculo es "hoyo"