import Text.Show.Functions
import Data.List

-- Cómo serán las raíces de mi cuadrática
-- discriminante -> b²-4ac

-- > 0  : 2 raíces reales
-- == 0 : raíz doble
-- < 0  : 2 raíces imaginarias

-- raices 1 2 1 -> "Tiene raíz doble"
-- raices 1 2 2 -> "Tiene raíces imaginarias"

--raices :: (Num a, Ord a) => a -> a -> a -> String 
raices a b c
    | discriminante > 0 = "Tiene raíces reales"
    | discriminante == 0 = "Tiene raíz doble"
    | otherwise = "Tiene raíces imaginarias"
    where discriminante = b ^ 2 - 4 * a * c

funcionMatematica x y z
    | calculo * 21 < 0 = 66
    | calculo ^ 2 == 21 = 67
    | otroCalculo 2 == 99 = 10
    | otroCalculo 15 > 0 = 11
    where calculo = otroCalculo z - z
          otroCalculo b = x * y * b

alargarUnPoco longitud = longitud + 10
longitudMaxima = 25
sirve longitud = longitud > longitudMaxima

sirveAlargandoUnPoco = sirve . alargarUnPoco

sirveAlargandoUnPoco' = 
    (\longitud -> longitud > 25) . (\longitud -> longitud + 10)

sirveAlargandoUnPoco'' cable = (.) sirve alargarUnPoco cable

-- esElMismo/2: Se cumple cuando los dos elementos que recibe son iguales
esElMismo x y = x == y
esElMismo' x = (\y -> x == y)

-- esJuani/1: Se cumple cuando el elemento que recibo es "Juani"
esJuani = esElMismo "Juani"

-- esDivisiblePorDos
-- esDivisiblePorDos n = mod n 2 == 0
-- esDivisiblePorDos n = (==) (mod n 2) 0
-- esDivisiblePorDos n = ((==0).(mod n)) 2
esDivisiblePorDos = (==0).(`mod`2)

fLoca :: Int -> Int -> Int -> Int
fLoca x y z = x - y + (z * 2)
-- aplicar x = 2, y = 1, z = 3
-- fLoca 2 1 3 :: Int -> 7
-- aplicar x = 2, y = 1
-- fLoca 2 1 :: Int -> Int
-- aplicar x = 2
-- fLoca 2 :: Int -> Int -> Int
-- no aplicar nada
-- fLoca :: Int -> Int -> Int -> Int
-- aplicar y = 1, z = 3
-- aplicar fLoca 1 3 :: Int -> Int
-- aplicar y = 1
-- (`fLoca` 1):: Int -> Int -> Int

aplicar f y z x = f x y z


-- flip
flip' f y x = f x y

-- flip (flip fLoca 1) 3 2
-- flip fLoca 1 -> fLoca x 1 z
-- flip (flip fLoca 1) -> fLoca z 1 x
-- flip (flip fLoca 1) 3 2 -> fLoca 2 1 3


lista1 = [10, 2, 5]
lista2 = [1, 21, 9, 3]

-- Hora de Lectura

type Libro = (String, String, Int)

elVisitante :: Libro
elVisitante = ("El Visitante", "Stephen King", 592)

--shingekiNoKyojin tomo = ("Shingeki no Kyojin " ++ show tomo, "Hajime Isayama", 40)

shingekiNoKyojin1 :: Libro
shingekiNoKyojin1 = ("Shingeki No Kyojin cap 1", "Hajime Isayama", 40)

shingekiNoKyojin3 :: Libro
shingekiNoKyojin3 = ("Shingeki no Kyojin 3", "Hajime Isayama", 40)

shingekiNoKyojin127 :: Libro
shingekiNoKyojin127 = ("Shingeki no Kyojin 127", "Hajime Isayama", 40)

fundacion :: Libro
fundacion = ("Fundacion", "Isaac Asimov", 230)

sandman5 :: Libro
sandman5 = ("sandman5", "Neil Gaiman", 35)

sandman10 :: Libro
sandman10 = ("sandman10", "Neil Gaiman", 35)

sandman12 :: Libro
sandman12 = ("sandman12", "Neil Gaiman", 35)

eragon :: Libro
eragon = ("eragon", "Christopher Paolini", 544)

eldest :: Libro
eldest = ("eldest", "Christopher Paolini", 704)

brisignr :: Libro
brisignr = ("brisignr", "Christopher Paolini", 700)

legado :: Libro
legado = ("legado", "Christopher Paolini", 811)

type Biblioteca = [Libro]

bibliotecaPdeP :: Biblioteca
bibliotecaPdeP = [
        elVisitante,
        shingekiNoKyojin1,
        shingekiNoKyojin3,
        shingekiNoKyojin127,
        fundacion,
        sandman5,
        sandman10,
        sandman12,
        eragon,
        eldest, 
        brisignr, 
        legado
    ]

promedioDePaginas biblioteca = totalPaginas biblioteca `div` cantidadLibros biblioteca

cantidadLibros = length

totalPaginas biblioteca = sum (map cantidadPaginas biblioteca)

cantidadPaginas (_, _, paginas) = paginas
nombre (nombre, _, _) = nombre

esAutor autorDeseado (_, autorLibro, _) = autorLibro == autorDeseado

sagaEragon = [eragon, eldest, brisignr, legado]

lecturaObligatoria :: Libro -> Bool
lecturaObligatoria libro = 
    libro == fundacion ||
    esAutor "Stephen King" libro ||
    elem libro sagaEragon

lecturasObligatorias biblioteca = filter lecturaObligatoria biblioteca

fantasiosa biblioteca = any fantasioso biblioteca

fantasioso libro = esAutor "Neil Gaiman" libro || esAutor "Christopher Paolini" libro

todosFantasiosos biblioteca = all fantasioso biblioteca

hayMasDe5Fantasiosos = (>5).length.filter fantasioso
hayMasDe5Fantasiosos' biblioteca = length (filter fantasioso biblioteca) > 5