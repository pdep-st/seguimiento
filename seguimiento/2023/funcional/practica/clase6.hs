import Text.Show.Functions

data Libro = Libro {
    titulo:: String,
    autor:: String,
    paginas:: Int
  } deriving Show


instance Eq Libro where
    (==) libro otroLibro = titulo libro == titulo otroLibro

instance Ord Libro where
    compare libro otroLibro = compare (paginas libro) (paginas otroLibro)


elVisitante = Libro "El Visitante" "Stephen King" 592
elVisitante2Edicion = Libro "El Visitante" "Carlos" 120


-- Cómo serán las raíces de mi cuadrática
-- discriminante -> b²-4ac

-- > 0  : 2 raíces reales
-- == 0 : raíz doble
-- < 0  : 2 raíces imaginarias

-- raices 1 2 1 -> "Tiene raíz doble"
-- raices 1 2 2 -> "Tiene raíces imaginarias"

raices a b c
    | valorDiscriminante > 0 = "raíces reales"
    | valorDiscriminante == 0 = "raiz " ++ doble
    | otherwise = "raíces imaginarias"
    where
        valorDiscriminante = b ** 2 - 4 * a * c
        doble = "doble"

-- "che, te fijás cuáles son las palabras con más de 5 letras?"
palabras = ["este", "año", "no", "apruebo", ",", "seguro", "con", "martín"]

--esLarga palabra = length palabra > 5


-- Acortar múltiples veces
-- acortarMultiple "MiPalabraLarga" [1, 3, 7]
-- ["M", "MiP", "MiPalab"]
-- [take 1 "MiPalabraLarga", take 3 "MiPalabraLarga", take 7 "MiPalabraLarga"]

acortarMultiple palabra longitudes =
    map (\longitud -> take longitud palabra) longitudes

-- cabeza, cola
cabeza (cabeza : _) = cabeza
cola (_:cola) = cola

-- estaVacia
estaVacia [] = True
estaVacia _ = False

--tieneUnSoloElemento
-- tieneUnSoloElemento (_:[]) = True
tieneUnSoloElemento [_] = True
tieneUnSoloElemento _ = False

--estaOrdenada
estaOrdenada (x:y:resto) =
    x < y && estaOrdenada (y:resto)
estaOrdenada _ = True

-- longitud
longitud (_:cola) = 1 + longitud cola
longitud [] = 0

-- sumatoria/1
sumatoria [] = 0
sumatoria (cabeza:cola) = cabeza + sumatoria cola

-- productoria/1
productoria [] = 1
productoria (cabeza:cola) = cabeza * productoria cola