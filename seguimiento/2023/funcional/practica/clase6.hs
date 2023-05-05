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



-- Cómo serán las raíces de mi cuadrática
-- discriminante -> b²-4ac

-- > 0  : 2 raíces reales
-- == 0 : raíz doble
-- < 0  : 2 raíces imaginarias

-- raices 1 2 1 -> "Tiene raíz doble"
-- raices 1 2 2 -> "Tiene raíces imaginarias"



-- "che, te fijás cuáles son las palabras con más de 5 letras?"
palabras = ["este", "año", "no", "apruebo", ",", "seguro", "con", "martín"]

-- Acortar múltiples veces
-- acortarMultiple "MiPalabraLarga" [1, 3, 7]
-- ["M", "MiP", "MiPalab"]
-- [take 1 "MiPalabraLarga", take 3 "MiPalabraLarga", take 7 "MiPalabraLarga"]


-- cabeza, cola

-- estaVacia

--tieneUnSoloElemento

--estaOrdenada

-- longitud

-- sumatoria/1

-- productoria/1