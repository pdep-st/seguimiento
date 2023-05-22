import Text.Show.Functions


data Persona = Persona {
    nombre :: String
    } deriving (Eq, Show)

personas = [Persona "Inia",
    Persona "Martin",
    Persona "Gaston"
    ]

-- todosLosNombres

todosLosNombres personas = drop 2
    (foldl (\acumulador persona -> acumulador ++ ", " ++ nombre persona) "" personas )

--foldl (\persona = persona + ",") personas ?
--fold1 (++) map nombre personas
todosLosNombres' personas = drop 2 . concatMap (\persona -> ", " ++ nombre persona) $ personas

--concat == foldl (++) 
--[[1,2] , [3,4,5]] -> [1,2,3,4,5]

-- ", Inia, Martin, Gaston"


misPares numeros = [x * 2 | x <- numeros, even x, x > 4]

misPares' = map (*2) . filter (\x -> even x && x > 4)

-- Evaluación Diferida
-- Lazy Evaluation
-- Evaluación Perezosa

-- muchos/1
-- muchos n = muchos n ++ [n]
muchos n = n : muchos n


-- fLoca = fst (1, muchos 3)
doble x = 2 * x
masUno x = x + 1

-- Pattern Matching (no Machine)

-- truePara0
truePara0 0 = True

(#) _ False = False
(#) False _ = False
(#) _ _ = True


miTrue = truePara0 8

-- tomar/2


-- tomar 2 (muchos 3)

-- enumerarDesde
