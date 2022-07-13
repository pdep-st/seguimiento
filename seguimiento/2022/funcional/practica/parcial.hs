import Data.List
import Text.Show.Functions

data Juguete = Juguete {
    nombre:: String,
    duenio:: String,
    facha:: Double,
    accesorios:: [Accesorio],
    vivo:: Bool
} deriving Show

data Accesorio = Accesorio {
    eficacia:: Double,
    efecto:: Efecto
} deriving Show

type Efecto = Double -> Juguete -> Juguete

-- 1)
-- 1.a)
lucirAmenazante:: Efecto
lucirAmenazante eficacia juguete = incrementarFacha (10 + eficacia) juguete

-- 1.b)
vieneAndy:: Efecto
vieneAndy _ juguete = juguete { vivo = False}

-- 1.c)
masSteel:: Efecto
masSteel eficacia juguete =
    incrementarFacha ((genericLength.nombre $ juguete) * eficacia)
        (juguete { nombre = "Max Steel" })

-- 1.d)
quemadura:: Double -> Efecto
quemadura grado eficacia juguete = disminuirFacha (grado * (eficacia + 2)) juguete

incrementarFacha incremento juguete = juguete {facha = facha juguete + incremento}
disminuirFacha decremento juguete = incrementarFacha (-decremento) juguete

-- 2)

-- 2.a)
serpienteEnBota:: Accesorio
serpienteEnBota = Accesorio {
    eficacia = 2,
    efecto = lucirAmenazante
}

-- 2.b)
radio:: Accesorio
radio = Accesorio {
    eficacia = 3,
    efecto = vieneAndy
}

-- 2.c)
revolver:: Accesorio
revolver = Accesorio {
    eficacia = 5,
    efecto = masSteel
}

-- 2.d)
escopeta:: Accesorio
escopeta = Accesorio {
    eficacia = 20,
    efecto = masSteel
}

-- 2.e)
lanzaLlamas:: Accesorio
lanzaLlamas = Accesorio {
    eficacia = 8.5,
    efecto = quemadura 3
}

-- 3)
-- 3.a)
woody:: Juguete
woody = Juguete {
    nombre = "Woody",
    duenio = "andy",
    facha = 100,
    accesorios = [serpienteEnBota, revolver],
    vivo = True
}

-- 3.b)
soldado:: Juguete
soldado = Juguete {
    nombre = "Soldado",
    duenio = "andy",
    facha = 5,
    accesorios = [lanzaLlamas, radio],
    vivo = True
}

-- 3.c)
barbie:: Juguete
barbie = Juguete {
    nombre = "Barbie",
    duenio = "dany",
    facha = 95.5,
    accesorios = [lanzaLlamas, escopeta, revolver],
    vivo = False
}

-- 4)
esImpaktante:: Juguete -> Bool
esImpaktante = (any esEficaz).accesorios
-- esImpaktante juguete = any esEficaz (accesorios juguete)

esEficaz accesorio = (>=10).eficacia $ accesorio
-- Acá se aplica:
    -- Aplicación parcial en el >= porque se le asigna sólo el 10 y espera dos parámetros
    -- Composición entre (>=10) y eficacia, siendo que el resultado de eficacia se aplica en el >=
    -- Orden superior, ya que la composición es una función que recibe otra función, en este caso (>=10) y eficacia

-- 5)
esDisxelico:: Juguete -> Bool
esDisxelico juguete = tieneEnDesorden "andy" (duenio juguete)

tieneEnDesorden letras duenio = 
    mismaCantidad letras duenio &&
    letras /= duenio &&
    todosEstanEn letras duenio

mismaCantidad lista1 lista2 = length lista1 == length lista2

todosEstanEn lista1 lista2 =
    all (\elemento -> elem elemento lista1) lista2


-- 6)
type Cajon = [Juguete]

miCajon = [woody, soldado, barbie]
-- 6.a)
cuantosImpaktantes:: Cajon -> Int
cuantosImpaktantes = cuantos esImpaktante

-- 6.b)
cuantosNombreLargo:: Cajon -> Int
cuantosNombreLargo = cuantos ((>6).length.nombre)

-- 6.c)
cuantosDisxelicosYMuertos:: Cajon -> Int
cuantosDisxelicosYMuertos = cuantos (\juguete -> esDisxelico juguete && (not.vivo) juguete)

cuantos:: (Juguete -> Bool) -> Cajon -> Int
cuantos criterio = length.filter criterio
-- cuantos criterio cajon = (length.filter criterio) cajon


-- 7)
nivelAmorAndy:: Juguete -> Double
nivelAmorAndy juguete = nivelDeAmorAplicado (aplicarAccesorios juguete)

nivelDeAmorAplicado:: Juguete -> Double
nivelDeAmorAplicado jugueteAplicado = 
    (facha jugueteAplicado +
    (genericLength.nombre) jugueteAplicado * 5 -
    (genericLength.accesorios) jugueteAplicado * 7) *
    coeficienteDeVida jugueteAplicado

coeficienteDeVida juguete
    | vivo juguete = 2
    | otherwise = 1

aplicarAccesorios:: Juguete -> Juguete
aplicarAccesorios juguete = foldl aplicarAccesorio juguete (accesorios juguete)

aplicarAccesorio:: Juguete -> Accesorio -> Juguete
aplicarAccesorio juguete accesorio = 
    (efecto accesorio) (eficacia accesorio) juguete

-- 8)
nivelAmorCajonDeLadrones:: Cajon -> Double
nivelAmorCajonDeLadrones = sum.map (nivelAmorAndy.agregar pasaMontanias)

pasaMontanias = Accesorio {
    eficacia = 7,
    efecto = lucirAmenazante
}

agregar accesorio juguete =
    juguete { accesorios = accesorios juguete ++ [accesorio]}