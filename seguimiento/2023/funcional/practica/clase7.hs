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

-- Funciones útiles
between n m x = elem x [n .. m]

maximoSegun f = foldl1 (mayorSegun f)
mayorSegun f a b
  | f a > f b = a
  | otherwise = b



{- PUNTO 1
    Sabemos que cada palo genera un efecto diferente, por lo tanto elegir el palo correcto 
    puede ser la diferencia entre ganar o perder el torneo.
-}

--  a) Modelar los palos usados en el juego que a partir de una determinada 
--     habilidad generan un tiro que se compone por velocidad, precisión y altura.

-- El putter genera un tiro con velocidad igual a 10, el doble de la precisión recibida y altura 0.

type Palo = (Habilidad -> Tiro)

putter :: Palo
putter habilidad = UnTiro{velocidad = 10,
                          precision = precisionJugador habilidad * 2,
                          altura = 0}

-- La madera genera uno de velocidad igual a 100, altura igual a 5 y la mitad de la precisión.

madera habilidad = UnTiro{velocidad = 100,
                          altura = 5,
                          precision = precisionJugador habilidad `div` 2}

{-
Los hierros, que varían del 1 al 10 (número al que denominaremos n), generan un tiro de velocidad 
igual a la fuerza multiplicada por n, la precisión dividida por n y una altura de n-3 (con mínimo 0). 
Modelarlos de la forma más genérica posible.
-}

hierro :: Int -> Palo
hierro n habilidad = UnTiro{ velocidad = fuerzaJugador habilidad * n,
                             precision = precisionJugador habilidad `div` n,
                             altura = max (n-3) 0}
                            
-- b) Definir una constante palos que sea una lista con todos los palos que se pueden usar en el juego.

palos = [putter, madera] ++ hierros

hierros = map hierro [1..10]

{- PUNTO 2
    Definir la función golpe que dados una persona y un palo, 
    obtiene el tiro resultante de usar ese palo con las habilidades de la persona.
-}
golpe jugador palo = (palo.habilidad) jugador

{- PUNTO 3
    Lo que nos interesa de los distintos obstáculos es si un tiro puede superarlo, y 
    en el caso de poder superarlo, cómo se ve afectado dicho tiro por el obstáculo. 
-}

{- a)
    Un túnel con rampita sólo es superado si la precisión es mayor a 90 yendo al ras del suelo, 
    independientemente de la velocidad del tiro. Al salir del túnel la velocidad del tiro se duplica, 
    la precisión pasa a ser 100 y la altura 0.
-}

data Obstaculo = Obstaculo{ puedeSerSuperado :: Tiro -> Bool,
                            efecto :: Tiro -> Tiro}

tunelConRampita = Obstaculo{ puedeSerSuperado = superaTunelConRampita,
                             efecto = efectoTunelConRampita}
                            
superaTunelConRampita tiro = precision tiro > 90 && altura tiro == 0
efectoTunelConRampita tiro = tiro{velocidad = velocidad tiro * 2,
                                  precision = 100,
                                  altura = 0}

tiroFallido = UnTiro 0 0 0

cruzarObstaculo obstaculo tiro
    |puedeSerSuperado obstaculo tiro = efecto obstaculo tiro
    |otherwise = tiroFallido
