data Personaje = Personaje {
    energia :: Float,
    nombreCompleto :: String,
    tipo :: String,
    poderes:: [Poder]
}

nombreYApellido nombreCompleto = (head tokens, last tokens)
    where tokens = words nombreCompleto

type Poder = Personaje -> Personaje

esCientifico = (=="Cientifico") . tipo
esVillano = (=="Villano") . tipo
esHeroe = (=="Heroe") . tipo

sonEnemigos personaje otroPersonaje =
    (esVillano personaje && esHeroe otroPersonaje) ||
    (esHeroe personaje && esVillano otroPersonaje)

--punto 1
sePuedenPelear unPersonaje otroPersonaje = 
    sonEnemigos unPersonaje otroPersonaje ||
    any esCientifico [unPersonaje, otroPersonaje]

estaBienArmado grupo oponente =
    all (sePuedenPelear oponente) grupo

iniciales nombreCompleto =
    (inicial . fst $ separados) ++ (inicial . snd $ separados)
    where 
        separados = nombreYApellido nombreCompleto
        inicial = take 1

tieneIniciales unasIniciales personaje =
    (iniciales . nombreCompleto $ personaje) == unasIniciales

puedeGanar grupo oponente = 
    estaBienArmado grupo oponente &&
    any (tieneIniciales "HR") grupo

viajarEnElTiempo :: Poder
viajarEnElTiempo personaje = personaje { poderes = [] }

tirarRayo:: Poder
tirarRayo personaje = personaje {
    poderes = tail (poderes personaje)
}

darDiscurso:: Int -> Poder
darDiscurso = error "noImplementado"

hablarHastaElCansancio :: Poder
hablarHastaElCansancio = error "noImplementado"

correrAVelocidad personaje velocidad = personaje {
    energia = (energia personaje) - (10 + 0.05 * velocidad)
}

correr :: [Float] -> Poder
correr velocidades personaje = foldl correrAVelocidad personaje velocidades
