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


-- muchos/1
muchos n = n : (muchos n)

-- fLoca = fst (1, muchos 3)

-- truePara0

-- tomar/2


-- tomar 2 (muchos 3)

-- enumerarDesde
