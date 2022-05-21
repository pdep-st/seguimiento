import Text.Show.Functions

data Libro = Libro {
    titulo:: String,
    autor:: String,
    paginas:: Int
  } deriving Show

instance Eq Libro where
    (==) libro otroLibro = titulo libro == titulo otroLibro

-- (#) a = a

instance Ord Libro where
    compare libro otroLibro = compare (paginas libro) (paginas otroLibro)

elVisitante = Libro "El Visitante" "Stephen King" 592
elVisitante2Edicion = Libro "El Visitante" "Stephen King" 120

-- La comodidad de la función ($)
esNombreLargo :: String -> Bool
esNombreLargo nombre = (>7) . length $ nombre

-- esNombreLargo = (>7) . length

-- reducir: para permitir la definición de
-- funciones recursivas

-- reducir funcion casoBase lista
-- product lista = reducir (*) 1 lista

reducir:: (b -> a -> b) -> b -> [a] -> b
reducir _ casoBase [] = casoBase

reducir funcion casoBase (x:xs) =
    funcion (reducir funcion casoBase xs) x

-- foldl (\acum palabra -> acum + length palabra)
--    0 ["hola", "soy", "martin"]

-- product (x:xs) = (*) x (product xs)

--sumatoria/1
sumatoria lista = foldl (+) 0 lista

--productoria/1
productoria lista = foldl (*) 1 lista

-- longitud
-- longitud [] = 0
-- longitud (_:xs) = 1 + longitud xs

longitud lista =
    foldl (\acumulado _ -> 1 + acumulado) 0 lista

-- maximum/minimum??
maximo [x] = x
maximo (x:xs) = max x (maximo xs)

maximo' lista = foldl1 max lista

minimo [x] = x
minimo (x:xs) = min x (minimo xs)
-- restatoria??

--foldl1 f lista = foldl f (head lista) (tail lista)

data Persona = Persona {
    nombre :: String
    } deriving (Eq, Show)

personas = [Persona "Inia",
    Persona "Martin",
    Persona "Gaston"
    ]

todosLosNombres personas =
    foldl1
      (\nombres nombre -> nombres ++ ", " ++ nombre)
      (map nombre personas)

todosLosNombres' personas =
    drop 2 (foldl
        (\nombres persona -> nombres ++ ", " ++ nombre persona)
        ""
        personas)

-- Golf con Lee Carvallo
-- Modelo inicial
data Jugador = UnJugador {
  nombreJugador :: String,
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

maximoSegun f = foldl1 (mayorSegun f)

mayorSegun f a b
  | f a > f b = a
  | otherwise = b

-- 1
-- a

putter habilidad =
    UnTiro {
        velocidad = 10,
        precision = 2 * precisionJugador habilidad,
        altura = 0
    }

madera habilidad =
    UnTiro {
        velocidad = 100,
        precision = div (precisionJugador habilidad) 2, 
        altura = 5
    }

hierro n habilidad =
    UnTiro {
        velocidad = fuerzaJugador habilidad * n,
        precision = div (precisionJugador habilidad) n, 
        altura = max 0 (n - 3)
    }

-- b
palos = [putter, madera] ++ map hierro [1..10]

type Palo = (Habilidad -> Tiro)

-- 2
golpe persona palo = palo (habilidad persona)

--3
tiroDetenido = UnTiro 0 0 0

tunelConRampita tiro
    | superaTunelConRampita = UnTiro {
        altura = 0,
        precision = 100,
        velocidad = velocidad tiro * 2
    }
    | otherwise = tiroDetenido
    where superaTunelConRampita = precision tiro > 90 && altura tiro == 0