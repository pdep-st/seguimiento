import Text.Show.Functions

suma x y = x + y

suma' (x, y) = x + y

curry' f a b = f (a, b)

uncurry' f (a, b) = f a b

sumaDe3 x y z = x + y + z

sumaDe3' = (\x -> (\y -> (\z -> x + y + z)))
-- (\y -> (\z -> 1 + y + z))
-- (\z -> 1 + 2 + z)


-- SIMULACRO
-- Un candidato tiene nombre, edad, carisma y capacidades.
-- Las capacidades sirven para convencer a la gente (mejor explicado más adelante).

data Candidato = Candidato {
    nombre:: String,
    edad:: Float,
    carisma:: Float,
    capacidades:: [Capacidad]
} deriving Show

type Capacidad = Candidato -> Float

incapaz = Candidato "Inca" 40 100 [corrupto]

-- 1
-- 1.a)
-- facha: (60 - edad del candidato)  + carisma del candidato * 3
facha:: Capacidad
facha candidato = (60 - edad candidato) + (carisma candidato * 3)

-- 1.b)
-- liderazgo: edad del candidato * 10
-- aplicación parcial en el (*10)
-- composición entre (*10) y edad
liderazgo:: Capacidad
liderazgo = (*10).edad

-- 1.c)
-- riqueza: carisma del candidato + edad del candidato / 50
riqueza:: Capacidad
riqueza candidato = carisma candidato + (edad candidato / 50)

-- 1.d)
-- corrupto: resta 100 (en este caso no ayuda a convencer)
corrupto:: Capacidad
corrupto _ = -100.0

-- 1.e)
-- tiktoker: 100
tiktoker:: Capacidad
tiktoker _ = 100

-- 1.f)
-- flogger: 0 ( ya pasó de moda (?) )
flogger:: Capacidad
flogger _ = 0 

-- 2)
-- 2.a)
-- Cintia, que tiene 40 años, su carisma es de 12 y las capacidades
-- que tiene son liderazgo, riqueza y es tiktoker.
cintia = Candidato {
    nombre = "Cintia",
    edad = 40,
    carisma = 12,
    capacidades = [liderazgo, riqueza, tiktoker]
}

-- 2.b)
-- Marcos, que tiene 45 años, su carisma es de 10 y las capacidades
-- que tiene son facha, liderazgo, corrupto.
marcos = Candidato {
    nombre = "Marcos",
    edad = 45,
    carisma = 10,
    capacidades = [facha, liderazgo, corrupto]
}

-- 3)
-- Se desea saber si una persona tiene capacidades inútiles,
-- se cumple cuando la persona tiene al menos una capacidad
-- con convencimiento menor o igual a 0.
tieneCapacidadInutil:: Candidato -> Bool
tieneCapacidadInutil candidato =
    any (esInutilPara candidato) (capacidades candidato)

esInutilPara candidato capacidad = (capacidad candidato) <= 0

-- 4)
-- Saber los candidatos que entre sus capacidades 
-- no tienen ninguna que sea inútil.
losNoInutiles:: [Candidato] -> [Candidato]
losNoInutiles candidatos = filter (not.tieneCapacidadInutil) candidatos

-- 5)
-- Se desea poder evaluar las capacidades de un candidato y
-- obtener el valor de la suma de su convencimiento.
-- Se debe devolver un candidato evaluado: (nombre, sumaCapacidades).
-- Si la suma es menor a 0 debe devolver 0.
evaluarCandidato:: Candidato -> (String, Float)
evaluarCandidato candidato = 
    (nombre candidato,
    convencimiento candidato)

convencimiento candidato = max 0 (sum (map ($candidato) (capacidades candidato)))

-- 6)
-- Definir la función “elMejor/3” que dado dos elementos
-- y una operación define cuál es el mejor de los dos.
-- Se considera que un elemento es mejor que otro, si
-- la operación a ese elemento, éste tiene un mayor resultado
-- que el segundo. Se espera como resultado el elemento.
-- En caso de empate devuelve el primero.
elMejor:: Ord b => (a -> b) -> a -> a -> a 
elMejor criterio primero segundo
    | criterio primero >= criterio segundo = primero
    | otherwise = segundo

-- 7)
-- Definir la función “votacion/2” que dada una cantidad
-- de votantes y una lista de candidatos devuelve una
-- nueva lista con el nombre del candidato y la cantidad
-- de votos que consiguió. La cantidad de votos se define por:
-- cantidadVotantes * convencimientoCandidato / totalConvencimientoDeTodosLosCandidatos.
votacion cantidadVotos candidatos =
    map (resultadoVotacion cantidadVotos (totalConvencimientoDe candidatos)) candidatos

resultadoVotacion cantidadVotos convencimientoTotal candidato =
    (nombre candidato,
    calcularVotos cantidadVotos convencimientoTotal candidato)

calcularVotos cantidadVotos convencimientoTotal candidato =
    cantidadVotos * convencimiento candidato / convencimientoTotal

totalConvencimientoDe = sum . map convencimiento
-- 8)
-- 8.a)
-- “ganador/2”: Dada una cantidad de votantes y una lista
-- de candidatos, nos informa cuál fue el ganador de la elección
-- (sería el que tiene mayor proporción de votos).

ganador cantidadVotos candidatos =
    elMejorDeTodos
        (calcularVotos cantidadVotos (totalConvencimientoDe candidatos))
        candidatos
--    foldl1 
--        (elMejor (calcularVotos cantidadVotos (totalConvencimientoDe candidatos)))
--        candidatos

-- 8.b)
-- “elMasFachero/1”: Dada una lista de candidatos es el que
-- tiene más facha (no importa que no esté entre las capacidades).

elMasFachero candidatos = elMejorDeTodos facha candidatos
-- foldl1 (elMejor facha) candidatos

-- 8.c)
-- “elMasMolestoDeNombrar/1”: Es el candidato con
-- más letras en su nombre.

elMasMolestoDeNombrar candidatos = elMejorDeTodos (length.nombre) candidatos
-- foldl1 (elMejor (length.nombre)) candidatos

elMejorDeTodos criterio candidatos =
    foldl1 (elMejor criterio) candidatos