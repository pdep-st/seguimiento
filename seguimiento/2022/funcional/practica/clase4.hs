import Text.Show.Functions
import Data.List

-- :t (max 2)
-- (Ord a, Num a) => a -> a
-- :t max "gola"
-- String -> String

-- esNombreLargo: un nombre es largo cuando excede
-- los 7 caracteres
esNombreLargo nombre = ((>7) . length) nombre

-- max entre 0 y mi número
max0 = max 0
-- esDivisiblePorDos
esDivisiblePorDos x = mod x 2
-- sumaDeTres: suma tres números
sumaDeTres x y z = x + y + z

-- precioDeMensaje:
-- Un mensaje sale 3 pesos por cada caracter
precioDeMensaje :: String -> Int
precioDeMensaje = (*3) . length

fLoca :: Int -> Int -> Int -> Int
fLoca x y z = x - y + (z * 2)
-- aplicar x = 2, y = 1, z = 3
-- fLoca 2 1 3 -> 7
-- aplicar x = 2, y = 1
-- fLoca 2 1 -> function :: Int -> Int
-- aplicar x = 2
-- fLoca 2 -> function :: Int -> Int -> Int
-- aplicar y = 1, z = 3
-- aplicar fLoca 1 3 -> function :: Int -> Int 

aplicar funcion y z x = funcion x y z

flip2 f y x = f x y
-- flip mod 2
-- f = mod, y = 2


-- Hora de Lectura
-- (Titulo, Autor, Paginas)
type Libro = (String, String, Int)

elVisitante :: Libro
elVisitante = ("El Visitante", "Stephen King", 592)

shingekiNoKyojin1 :: Libro
shingekiNoKyojin1 = ("Shingeki No Kyojin cap 1", "Hajime Isayama", 40)

shingekiNoKyojin3 :: Libro
shingekiNoKyojin3 = ("Shingeki no Kyojin 3", "Hajime Isayama", 40)

shingekiNoKyojin27 :: Libro
shingekiNoKyojin27 = ("Shingeki no Kyojin 27", "Hajime Isayama", 40)

fundacion :: Libro
fundacion = ("Fundation", "Isaac Asimov", 230)

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

titulo :: Libro -> String
titulo (titulo, _, _) = titulo
autor :: Libro -> String
autor (_, autor, _) = autor
paginas :: Libro -> Int
paginas (_, _, paginas) = paginas

miBiblioteca = [
        elVisitante,
        shingekiNoKyojin1,
        shingekiNoKyojin3,
        shingekiNoKyojin27,
        fundacion,
        sandman5,
        sandman10,
        sandman12,
        eragon,
        eldest, 
        brisignr, 
        legado
    ]

-- promedioDePaginas
promedioDePaginas biblioteca =
    div (totalPaginas biblioteca) (cantidadLibros biblioteca)

-- cantidadLibros
cantidadLibros = length

-- totalPaginas
totalPaginas biblioteca = (sum . map paginas) biblioteca

esLecturaObligatoria :: Libro -> Bool
esLecturaObligatoria (_, "Stephen King", _) = True
esLecturaObligatoria libro = libro == fundacion || esSagaEragon libro
-- esLecturaObligatoria ("Fundación", "Isaac Asimov", 230) = True

sagaEragon = [eragon, eldest, brisignr, legado]

esSagaEragon libro = elem libro sagaEragon

lecturasObligatorias biblioteca = filter esLecturaObligatoria biblioteca

lecturasOpcionales biblioteca = filter (not . esLecturaObligatoria) biblioteca


-- :t filter
-- filter :: (a -> Bool) -> [a] -> [a]

-- :t map
-- map :: (a -> b) -> [a] -> [b]