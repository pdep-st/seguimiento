import Text.Show.Functions

data Libro = Libro {
    titulo:: String,
    autor:: String,
    paginas:: Int
  } deriving Show

{-
instance Eq Libro where
    (==) libro otroLibro = titulo libro == titulo otroLibro

instance Ord Libro where
    compare libro otroLibro = compare (paginas libro) (paginas otroLibro)
-}

elVisitante = Libro "El Visitante" "Stephen King" 592
elVisitante2Edicion = Libro "El Visitante" "Carlos" 120

-- La comodidad de la función ($)
esNombreLargo :: String -> Bool
esNombreLargo nombre = ((>7) . length) nombre

-- Cómo serán las raíces de mi cuadrática
-- discriminante -> b²-4ac

-- > 0  : 2 raíces reales
-- == 0 : raíz doble
-- < 0  : 2 raíces imaginarias

-- raices 1 2 1 -> "Tiene raíz doble"
-- raices 1 2 2 -> "Tiene raíces imaginarias"

--discriminante a b c = b ** 2 - 4 * a * c

raices a b c
    | valorDiscriminante > 0 = "2 raíces reales"
    | valorDiscriminante == 0 = "raíz " ++ doble "."
    | valorDiscriminante < 0 = "2 raíces imaginarias"
    where valorDiscriminante = b ** 2 - 4 * a * c
          doble x = "doble" ++ x

-- Acortar múltiples veces
-- acortarMultiple "MiPalabraLarga" [1, 3, 7]
-- ["M", "MiP", "MiPalab"]
-- [take 1 "MiPalabraLarga", take 3 "MiPalabraLarga", take 7 "MiPalabraLarga"]
acortarMultiple palabra longitudes =
    map (\longitud -> take longitud palabra) longitudes

suma = (\ x y -> x + y)

-- cabeza, cola
cabeza (x : _) = x

cola (_ : xs) = xs

-- estaVacia
estaVacia [] = True
estaVacia (_ : _) = False

--tieneUnSoloElemento (_ : []) = True
tieneUnSoloElemento [_] = True
tieneUnSoloElemento _ = False

--estaOrdenada
estaOrdenada [] = True
estaOrdenada [_] = True
estaOrdenada (x:y:xs) = x <= y && estaOrdenada (y:xs)

-- longitud
longitud [] = 0
longitud (_:xs) = 1 + longitud xs

-- sumatoria/1
sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria xs

-- productoria/1
productoria [] = 1
productoria (x:xs) = x * productoria xs