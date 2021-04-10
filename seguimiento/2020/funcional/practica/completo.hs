import Text.Show.Functions

data Personaje = Personaje {
    energia :: Float,
    nombreCompleto :: String,
    tipo :: String,
    poderes:: [Poder]
} deriving Show

type Poder = Personaje -> Personaje

nombreYApellido nombreCompleto = (head tokens, last tokens)
    where tokens = words nombreCompleto

iniciales nombreYApellido = 
     [ (head . fst) nombreYApellido, (head . snd) nombreYApellido]

cumpleRol unRol = (== unRol ) . tipo

sonEnemigos contendientes =
    any (cumpleRol "villano") contendientes &&
    any (cumpleRol "heroe") contendientes

sePuedenPelear unPersonaje otroPersonaje =
    any (cumpleRol "cientifico") contendientes ||
    sonEnemigos contendientes
    where contendientes = [unPersonaje, otroPersonaje]

bienArmado enemigo =
    all (sePuedenPelear enemigo)

puedeGanar enemigo grupo =
    bienArmado enemigo grupo &&
    ((=="HR")  . iniciales . nombreYApellido . nombreCompleto $ enemigo)

viajarEnElTiempo oponenete = oponenete { poderes = [] }
tirarRayo oponente = oponente {
        energia = ((-) 50) . energia $ oponente, 
        poderes = tail . poderes $ oponente
    }

hablarHastaElCansancio oponente
    | (cumpleRol "villano") oponente = oponente
    | otherwise = oponente { nombreCompleto = "" }

correrAVelocidad velocidad personaje = personaje {
    energia = energia personaje - 10 + 0.05 * velocidad
}

correr velocidades oponente =
    foldr correrAVelocidad oponente velocidades 


-- Harrison Wells Tierra 2, es un científico de 300 unidades de energia, que que sabe correr de 1 a 10, y dar un discurso de 32 palabras.
harrison2 = Personaje {
    energia = 300,
    nombreCompleto = "Harrison Wells",
    tipo  = "cientifico",
    poderes = [correr [1..10]]
}

harrison32 = Personaje {
    energia = 300,
    nombreCompleto = "Harrison Wells",
    tipo  = "cientifico",
    poderes = [hablarHastaElCansancio]
}

darDiscurso cantidadPalabras personaje = personaje {
    energia = energia personaje - cantidadPalabras
}

deathstroke = Personaje {
    energia = 800,
    nombreCompleto = "Deathstroke",
    tipo  = "villano",
    poderes = [darDiscurso 32  . darDiscurso 32 ]
}

atacarIndividual :: Personaje -> Personaje -> Personaje
atacarIndividual personaje oponente = 
    foldr ($) oponente $ poderes personaje

atacarGrupal :: [Personaje] -> Personaje -> Personaje
atacarGrupal grupo oponente =
    foldr atacarIndividual oponente grupo

atacar :: (Personaje -> Bool) -> [Personaje] -> Personaje -> Bool
atacar objetivo grupo oponente = objetivo $ atacarGrupal grupo oponente

estaKO = (<10) . energia

inserviblePorTipo personaje "villano" = estaKO personaje
inserviblePorTipo personaje "heroe" = nombreCompleto personaje == ""

-- Acá no se puede hacer == [] porque la lista no es Eq
inserviblePorTipo personaje "cientifico" = (==0) . length $ poderes personaje

inservible personaje = inserviblePorTipo personaje $ tipo personaje

unGrupo = [harrison2, harrison32]

-- consulta 1
-- atacar estaKO unGrupo deathstroke  

-- consulta 2
-- atacar (\villano -> (>2) . length . filter estaKO . map (atacarIndividual villano) $ unGrupo ) unGrupo deathstroke
-- atacar ( (>2) . length . filter estaKO . flip map unGrupo . atacarIndividual ) unGrupo deathstroke

-- consulta 3
-- atacar inservible unGrupo deathstroke 

-- PUNTO 7
flash = Personaje {
    nombreCompleto = "Barry Allen",
    tipo = "cientifico",
    energia = 1000,
    poderes = [correr [1..]]
}
