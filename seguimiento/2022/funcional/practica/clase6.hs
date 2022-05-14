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


-- Acortar múltiples veces
-- acortarMultiple "MiPalabraLarga" [1, 3, 7]
-- ["M", "MiP", "MiPalab"]

-- sum/1
-- product/1