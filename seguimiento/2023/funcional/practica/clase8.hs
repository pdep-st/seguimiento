import Text.Show.Functions


data Persona = Persona {
    nombrePersona :: String
    } deriving (Eq, Show)

personas = [Persona "Inia",
    Persona "Martin",
    Persona "Gaston"
    ]

-- todosLosNombres


-- muchos/1
muchos n = n : (muchos n)

-- fLoca = fst (1, muchos 3)

-- truePara0

-- tomar/2


-- tomar 2 (muchos 3)

-- enumerarDesde
