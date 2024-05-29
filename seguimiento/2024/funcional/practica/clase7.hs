import Text.Show.Functions

-- reducir: para permitir la definición de
-- funciones recursivas

-- sumatoria/1
sumatoria :: Num a => [a] -> a
sumatoria = foldr (+) 0

-- productoria/1
productoria :: Num a => [a] -> a
productoria = foldr (*) 1

concatenacion :: [String] -> String
concatenacion = foldr (++) ""
-- a ++ []
-- longitud/1
longitud:: [a] -> Int
longitud = foldr (\_ acumulador -> 1 + acumulador) 0

reducirR _ semilla [] = semilla
reducirR f semilla (x:xs) = f x (reducirR f semilla xs) 

reducirL _ semilla [] = semilla
reducirL f semilla (x:xs) = f (reducirL f semilla xs) x
-- (+) 8 ((+) 4 0))
-- (+) 8 4
--    12


--foldl _ semilla [] = semilla
--foldl f semilla (x:xs) = f (foldl f semilla xs) x
-- foldl (+) 0 [8,4]
-- (+) ((+) 0 4 ) 8
-- (+) 4 8
--    12

{-- reducir (+) 0 [8,4]
primera vuelta
x=8 xs=[4]

segunda vuelta
x=4 xs= []

tercera vuelta
semilla = 0
-}
-- (+) 8 ((+) 4 0))
-- (+) 8 4
--    12



-- maximum/minimum??

maximo (x:xs) = foldl max x xs
maximo':: Ord a => [a] -> a
maximo' = foldl1 max

minimo (x:xs) = foldl min x xs
minimo':: Ord a => [a] -> a
minimo' = foldl1 min



-- restatoria??

foldL _ semilla [] = semilla
--foldL f semilla (x:xs) = f (foldL f semilla xs) x
foldL f acumulador (x:xs) = foldL f (f acumulador x) xs

-- foldL (++) "" ["a", "b"]
-- foldL (++) ((++) "" "a") ["b"] -> foldL (++) "a" ["b"]
-- foldL (++) ((++) "a" "b") [] -> foldL (++) "ab" []
-- "ab"

{- 
reducirL _ semilla [] = semilla
reducirL f semilla (x:xs) = f (reducirL f semilla xs) x

(++) (reducirL (++) "" ["b"]) "a"
(++) ((++) (reducirL (++) "" []) "b") "a"
(++) ((++) "" "b") "a"
-}

data Persona = Persona {
    nombrePersona :: String
    } deriving (Eq, Show)

personas = [Persona "Inia",
    Persona "Martin",
    Persona "Gaston"
    ]

-- todosLosNombres

