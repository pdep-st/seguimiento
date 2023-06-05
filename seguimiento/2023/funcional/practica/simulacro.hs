import Text.Show.Functions
import Data.List

g x y = fst (x, fst y)

tuplaRota = (head [], head [])

enumerarDesde x = x : enumerarDesde (x + 1)

f xs = any (>2) . map (*10)

--($) f x = f x
aplicaleEl2 f = f 2

miPatron [x : y : ys] = True


suma (x, y) = x + y

-- h x y z = x + y * z
h = (\x -> (\y -> (\z -> x + y * z)))

-- tomar/2

-- Simulacro : Toy Story

data Juguete = Juguete {
    nombre :: String,
    duenio :: String,
    facha :: Double,
    accesorios :: [Accesorio],
    vivo :: Bool
} deriving Show

data Accesorio = Accesorio {
    efecto :: Efecto,
    eficacia :: Double
} deriving Show

type Efecto = Double -> Juguete -> Juguete

lucirAmenazante :: Efecto
lucirAmenazante eficacia = modificarFacha (10 + eficacia)

vieneAndy :: Efecto
vieneAndy _ juguete = juguete {
    vivo = False
}

masSteel :: Efecto
masSteel eficacia juguete = cambiarNombre "Max Steel" . modificarFacha (eficacia * largoDeNombre juguete) $ juguete

quemadura :: Double -> Efecto
quemadura grado eficacia = modificarFacha fachaADisminuir
    where fachaADisminuir = -(grado * (eficacia + 2))

largoDeNombre = genericLength . nombre

cambiarNombre nombre juguete = juguete {
    nombre = nombre
}

-- cantidad + o -
modificarFacha cantidad juguete = juguete {
    facha = facha juguete + cantidad
}

-- Punto 2

serpienteEnBota :: Accesorio
serpienteEnBota = Accesorio {
    efecto = lucirAmenazante,
    eficacia = 2
}

radio :: Accesorio
radio = Accesorio {
    efecto = vieneAndy,
    eficacia = 3
}

revolver:: Accesorio
revolver = arma 5

escopeta:: Accesorio
escopeta = arma 20

arma :: Double -> Accesorio
arma eficacia = Accesorio {
    efecto = masSteel,
    eficacia = eficacia
}

lanzaLlamas :: Accesorio
lanzaLlamas = Accesorio {
    efecto = quemadura 3,
    eficacia = 8.5
}

-- Punto 3

woody :: Juguete
woody = Juguete {
    nombre = "Woody",
    duenio = "Andy",
    vivo = True,
    facha = 100,
    accesorios = [serpienteEnBota, revolver]
}

soldado:: Juguete
soldado = Juguete {
    nombre = "Soldado",
    duenio = "andy",
    facha = 5,
    accesorios = [lanzaLlamas, radio],
    vivo = True
}

barbie:: Juguete
barbie = Juguete {
    nombre = "Barbie",
    duenio = "dany",
    facha = 95.5,
    accesorios = [lanzaLlamas, escopeta, revolver],
    vivo = False
}

-- Punto 4

esImpaktante :: Juguete -> Bool
esImpaktante juguete = any ((>10) . eficacia) (accesorios juguete)

-- Punto 5
esDisxelico :: Juguete -> Bool
esDisxelico juguete = tieneEnDesorden "andy" (duenio juguete)

tieneEnDesorden letras palabra =
    letras /= palabra &&
    length palabra == length letras &&
    all (\letra -> elem letra letras) palabra


-- Punto 7
aplicarAccesorios juguete = foldl aplicarAccesorio juguete (accesorios juguete)

aplicarAccesorio juguete accesorio =
    efecto accesorio (eficacia accesorio) juguete