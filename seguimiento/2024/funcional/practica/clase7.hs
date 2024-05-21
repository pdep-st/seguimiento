import Text.Show.Functions

-- reducir: para permitir la definición de
-- funciones recursivas

-- sumatoria/1
sumatoria = reducirR (+) 0

-- productoria/1
productoria = reducirR (*) 1

concatenacion = reducirR (++) ""

-- longitud/1
longitud = reducirR (\_ acumulador -> 1 + acumulador) 0

reducirR _ semilla [] = semilla
reducirR f semilla (x:xs) = f x (reducirR f semilla xs)
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


-- restatoria??


data Persona = Persona {
    nombrePersona :: String
    } deriving (Eq, Show)

personas = [Persona "Inia",
    Persona "Martin",
    Persona "Gaston"
    ]

-- todosLosNombres

-- Golf con Lee Carvallo 
