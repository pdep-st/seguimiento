type Habilidad = Int

data Guerrero = UnGuerrero {
nombre :: String,
habilidad :: Habilidad,
caracteristicas :: [String] }

-- 1

habilidoso :: Int -> Guerrero -> Bool
habilidoso minimo guerrero = habilidad guerrero >= minimo

honorable:: Guerrero -> Bool
honorable guerrero = not $ elem "deshonra" (caracteristicas guerrero)

-- 2

type Maestro = Guerrero -> Bool
reclutas :: Maestro -> [Guerrero] -> [String]
reclutas maestro = map nombre . filter maestro

-- 3

ejemplo = reclutas (habilidoso 7)
ejemplo2 = reclutas honorable

-- 4

honorable':: Guerrero -> Bool
honorable' = not . (elem "deshonra") . caracteristicas


--https://drive.google.com/drive/u/1/folders/1fn2fkaI_8IX9XIy_TG_Us3sDu4E53LER

data Videojuego = UnVideojuego {
    titulo :: String,
    desarrolladora :: String,
    generos :: [String],
    lanzamiento :: Int
}

type Jugador = Videojuego -> Bool
type Preferencia = Videojuego -> Bool

type Comite = [Jugador]

esDesarrolladoPor :: String -> Preferencia
esDesarrolladoPor dev = (==dev).desarrolladora

perteneceAGenero :: String -> Preferencia
perteneceAGenero genero videojuego = elem genero (generos videojuego)

esReciente :: Preferencia
esReciente videojuego = lanzamiento videojuego > 2015

gta = UnVideojuego "GTA 6" "Rockstar" ["Plataforma"] 2025

preferenciaDevYGenero :: String -> String -> Jugador
preferenciaDevYGenero dev genero videojuego = esDesarrolladoPor dev videojuego || perteneceAGenero genero videojuego

juan :: Jugador
juan = preferenciaDevYGenero  "Nintendo" "Plataforma"

maria :: Jugador
maria = esReciente

pedro :: Jugador
pedro = preferenciaDevYGenero "Rockstar"  "mundo abierto" 


preferidosDelComite :: Comite -> [Videojuego] -> [Videojuego]
preferidosDelComite comite = filter (comiteAcepta comite)

comiteAcepta :: Comite -> Videojuego -> Bool
comiteAcepta comite videojuego = any ($ videojuego) comite

--tamanioComite :: [Jugador] -> Int
--tamanioComite comite = length comite
--tamanioComite No es de order superior

gtaI = UnVideojuego "GTA 1" "Rockstar" ["Plataforma"] 1997

comite = [juan, pedro, maria]
comiteInfinito = repeat maria

gtaInfinitos = map gtaViejo [1..]
gtaViejo anio = UnVideojuego "GTA" "Rockstar" ["Plataforma"] anio


