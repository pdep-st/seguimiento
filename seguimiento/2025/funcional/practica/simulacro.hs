type Habilidad = Int

data Guerrero = UnGuerrero {
nombre :: String,
habilidad :: Habilidad,
caracteristicas :: [String] }

-- 1

habilidoso :: Int -> Guerrero -> Bool
habilidoso minimo guerrero = habilidad guerrero >= minimo

honorable:: Guerrero -> Bool
honorable guerrero = not $ elem "deshonra" (caracteristicas guerrero)

-- 2

type Maestro = Guerrero -> Bool
reclutas :: Maestro -> [Guerrero] -> [String]
reclutas maestro = map nombre . filter maestro

-- 3

ejemplo = reclutas (habilidoso 7)
ejemplo2 = reclutas honorable

-- 4

honorable':: Guerrero -> Bool
honorable' = not . (elem "deshonra") . caracteristicas
