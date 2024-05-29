import Text.Show.Functions

-- Evaluación Diferida vs Evaluación Ansiosa
-- Lazy Evaluation vs Eager Evaluation
-- Evaluación Perezosa

-- muchos/1
muchos :: a -> [a]
muchos n = n : muchos n

fLoca = fst (1, muchos 3)

-- truePara0
truePara0 :: (Num a, Eq a) => [a] -> Bool
truePara0 [0] = True
truePara0 _ = False

-- tomar/2
tomar 0 _ = []
tomar _ [] = []
tomar n (x:xs) = x : tomar (n-1) xs

-- tomar 2 (muchos 3)

-- enumerarDesde
enumerarDesde n = n : enumerarDesde (n+1)

enumerarDesdeHasta n h
    | n == h = [h]
    | otherwise = n : enumerarDesdeHasta (n+1) h


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
between :: Int -> Int -> Int -> Bool
between n m x = elem x [n .. m]

maximoSegun f = foldl1 (mayorSegun f)
mayorSegun f a b
  | f a > f b = a
  | otherwise = b

-- 1) a)
type Palo = Habilidad -> Tiro

putter :: Palo
putter habilidad = UnTiro {
    velocidad = 10,
    precision = (2*).precisionJugador $ habilidad,
    altura = 0
}

madera :: Palo
madera habilidad = UnTiro {
    velocidad = 100,
    altura = 5,
    precision = (`div`2).precisionJugador $ habilidad
}

hierro :: Int -> Palo
hierro n habilidad = UnTiro {
    velocidad = (*n).fuerzaJugador $ habilidad,
    precision = (`div`n).precisionJugador $ habilidad,
    altura = max (n - 3) 0
}

-- max 0 n -> Como mínimo 0
-- min 100 n -> Como máximo 100

-- 1)b)
hierros = map hierro [1..10]
palos = [putter, madera] ++ hierros

-- 2)
golpe persona palo = palo (habilidad persona)

-- 3)
data Obstaculo = Obstaculo {
    criterioSuperacion :: Tiro -> Bool,
    modificadorTiro :: Tiro -> Tiro
}

criterioTunel tiro = 
    precision tiro > 90 && altura tiro == 0

modificadorTunel tiro = UnTiro {
    velocidad = velocidad tiro * 2,
    precision = 100,
    altura = 0
}

crearObstaculo criterio modificador = Obstaculo {
    criterioSuperacion = criterio,
    modificadorTiro = modificador
}

tunelConRampita = crearObstaculo criterioTunel modificadorTunel

criterioHoyo tiro =
    between 5 20 (velocidad tiro) && altura tiro == 0 && precision tiro > 95

modificarHoyo _ = bolaMuerta

hoyo = crearObstaculo criterioHoyo modificarHoyo


criterioLaguna tiro = velocidad tiro > 80 && between 1 5 (altura tiro)

modificadorLaguna largoLaguna tiro = tiro {
    altura = altura tiro `div` largoLaguna
}

laguna longitud = crearObstaculo criterioLaguna (modificadorLaguna longitud)

bolaMuerta = UnTiro 0 0 0

intentarSuperar tiro obstaculo
    | criterioSuperacion obstaculo tiro = modificadorTiro obstaculo tiro
    | otherwise = bolaMuerta