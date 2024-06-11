import Text.Show.Functions
import Data.List

type CriterioVoto = [Participante] -> Participante

data Participante = Participante {
    nombre :: String,
    edad :: Double,
    atractivo :: Double,
    personalidad :: Double,
    inteligencia :: Double,
    criterioVoto :: CriterioVoto
} deriving Show

instance Eq Participante where
    (==) participante otroParticipante = nombre participante == nombre otroParticipante


juan :: Participante
juan = Participante {
    nombre = "Juan",
    edad = 25,
    atractivo = 30,
    personalidad = 25,
    inteligencia = 50,
    criterioVoto = head
}

maria :: Participante
maria = Participante {
    nombre = "Maria",
    edad = 22,
    atractivo = 35,
    personalidad = 15,
    inteligencia = 45,
    criterioVoto = head
}

facha :: Participante
facha = Participante {
    nombre = "facha",
    edad = 18,
    atractivo = 100,
    personalidad = 0,
    inteligencia = 40,
    criterioVoto = head
}

participantes = [juan, maria, facha]


-- 1)a)
data Prueba = Prueba {
    nombrePrueba :: String,
    requisito :: Participante -> Bool,
    calculoIndice :: Participante -> Double
} deriving Show

requisitoBaileDeTikTok :: Participante -> Bool
requisitoBaileDeTikTok participante = personalidad participante >= 20

requisitoBotonRojo :: Participante -> Bool
requisitoBotonRojo participante = personalidad participante >= 10 && inteligencia participante >= 20

requisitoCuentasRapidas :: Participante -> Bool
requisitoCuentasRapidas participante = inteligencia participante >= 40

calculoBaileDeTikTok :: Participante -> Double
calculoBaileDeTikTok participante = personalidad participante + 2 * atractivo participante

calculoBotonRojo :: Participante -> Double
calculoBotonRojo _ = 100

calculoCuentasRapidas :: Participante -> Double
calculoCuentasRapidas participante = inteligencia participante + personalidad participante - atractivo participante

calcularIndiceExito :: (Participante -> Bool) -> (Participante -> Double) -> Participante -> Double
calcularIndiceExito requisito calculo participante
    | requisito participante = min 100.max 0 $ calculo participante
    | otherwise = 0
-- Apliqué parcialmente el 100 al min, porque espera dos parámetros y sólo le paso uno
-- Usé composición entre el min 100 y el max 0, para crear una función que primero hace un max 0 y luego un min 100


hacerPrueba :: Prueba -> Participante -> Double
hacerPrueba prueba = calcularIndiceExito (requisito prueba) (calculoIndice prueba)

baileDeTikTok :: Prueba
baileDeTikTok = Prueba {
    nombrePrueba = "baileDeTikTok",
    requisito = requisitoBaileDeTikTok,
    calculoIndice = calculoBaileDeTikTok
}

botonRojo :: Prueba
botonRojo = Prueba {
    nombrePrueba = "Botón Rojo",
    requisito = requisitoBotonRojo,
    calculoIndice = calculoBotonRojo
}

cuentasRapidas :: Prueba
cuentasRapidas = Prueba {
    nombrePrueba = "Cuentas Rápidas",
    requisito = requisitoCuentasRapidas,
    calculoIndice = calculoCuentasRapidas
}
 
-- 2)a)

superanPrueba :: [Participante] -> Prueba -> [Participante]
superanPrueba participantes prueba = filter (requisito prueba)  participantes

-- 2)b)

promedioIndiceExito participantes prueba =
    sumatoriaIndicesExito participantes prueba / genericLength participantes

sumatoriaIndicesExito participantes prueba =
    sum . map (hacerPrueba prueba) $ participantes

-- 2)c)

esFavorito participante pruebas =
    all (superaConMasDe 50 participante) pruebas

superaConMasDe n participante prueba = hacerPrueba prueba participante > n

-- 3)
mejorSegun :: Ord a => (a -> a -> Bool) -> (x -> a) -> x -> x -> x
mejorSegun operador criterio elemento otroElemento
    | operador (criterio elemento) (criterio otroElemento) = elemento
    | otherwise = otroElemento

minSegun :: Ord a => (x -> a) -> x -> x -> x
minSegun = mejorSegun (<)

-- Acá usé orden superior porque defino una función que recibe un criterio (que es otra función)

maxSegun :: Ord a => (x -> a) -> x -> x -> x
maxSegun = mejorSegun (>)

mejorSegunLista segun criterio = foldl1 (segun criterio)

minimoSegun :: Ord a => (x -> a) -> [x] -> x
minimoSegun = mejorSegunLista minSegun
maximoSegun :: Ord a => (x -> a) -> [x] -> x
maximoSegun = mejorSegunLista maxSegun

-- 3)a)
menosInteligente :: CriterioVoto
menosInteligente = minimoSegun inteligencia

--3)b)
masAtractivo :: CriterioVoto
masAtractivo = maximoSegun atractivo

--3)c)
masViejo :: CriterioVoto
masViejo = maximoSegun edad

-- 4
javierTulei :: Participante
javierTulei = Participante {
    nombre = "Javier Tulei",
    edad = 52,
    atractivo = 30,
    personalidad = 70,
    inteligencia = 35,
    criterioVoto = menosInteligente
}

minimoKirchner :: Participante
minimoKirchner = Participante {
    nombre = "Mínimo Kirchner",
    edad = 46,
    atractivo = 0,
    personalidad = 40,
    inteligencia = 50,
    criterioVoto = masAtractivo
}

horacioBerreta :: Participante
horacioBerreta = Participante {
    nombre = "Horacio Berreta",
    edad = 57,
    atractivo = 10,
    personalidad = 60,
    inteligencia = 50,
    criterioVoto = masAtractivo
}

myriamBregwoman :: Participante
myriamBregwoman = Participante {
    nombre = "Myriam Bregwoman",
    edad = 51,
    atractivo = 40,
    personalidad = 40,
    inteligencia = 60,
    criterioVoto = masViejo
}

politicos = [javierTulei, minimoKirchner, horacioBerreta, myriamBregwoman]
-- 5

votar candidatos participante = criterioVoto participante candidatos

estanEnPlaca participantes = map (votar participantes) participantes

-- 6

estaEnElHorno votados participante =
    (>=3) . length . filter (==participante) $ votados

cantidadVotos votados participante =
    length . filter (==participante) $ votados

estaEnElHorno' votados participante =
    cantidadVotos votados participante >= 3

hayAlgoPersonal votados participante =
    all (==participante) votados

zafo votados participante =
    notElem participante $ votados