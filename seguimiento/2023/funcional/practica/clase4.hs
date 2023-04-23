import Text.Show.Functions
import Data.List

-- esNombreLargo: un nombre es largo cuando excede
-- los 7 caracteres

longitudMaxima = 7
esNombreLargo = (>longitudMaxima) . genericLength

-- max entre 0 y mi número
maximoEntre0 = max 0

esPositivo = (>0)

-- esDivisiblePorDos

esDivisiblePorDos numero = mod numero 2 == 0
-- esDivisiblePorDos numero = (==0) (mod numero 2)
-- esDivisiblePorDos numero = ((==0) . mod numero) 2
-- esDivisiblePorDos = (==0) . (`mod`2)
-- esDivisiblePorDos = (==0) . (flip mod 2)

-- sumaDeTres: suma tres números

-- precioDeMensaje:
-- Un mensaje sale 3 pesos por cada caracter


fLoca :: Int -> Int -> Int -> Int
fLoca x y z = x - y + (z * 2)
-- aplicar x = 2, y = 1, z = 3
-- fLoca 2 1 3 -> 7
-- aplicar x = 2, y = 1
-- fLoca 2 1 -> function :: Int -> Int :: 1 + (z * 2)
-- aplicar x = 2
-- fLoca 2 -> function :: Int -> Int -> Int :: 2 - y + (z * 2)
-- no aplicar nada
-- fLoca -> fLoca
-- aplicar y = 1, z = 3
-- aplicar fLoca 1 3 -> function :: Int -> Int :: x - 1 + (3 * 2)

aplicar f y z x = f x y z

-- flip
flipito f y x = f x y

-- crear dos listas y jugar!

lista1 = [1, 2, 3]
lista2 = [4, 5, 6]


-- Hora de Lectura

type Libro = (String, String, Int)

titulo (titulo, _, _) = titulo
autor (_, autor, _) = autor

paginas :: Libro -> Int
paginas (_, _, paginas) = paginas

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

type Biblioteca = [Libro]

miBiblioteca :: Biblioteca
miBiblioteca = [
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

promedioDePaginas :: Biblioteca -> Int
promedioDePaginas biblioteca = div (sumatoriaPaginas biblioteca) (cantidadLibros biblioteca)

sumatoriaPaginas :: Biblioteca -> Int
sumatoriaPaginas = sum . cantidadDePaginasDeCadaLibro

cantidadDePaginasDeCadaLibro :: Biblioteca -> [Int]
cantidadDePaginasDeCadaLibro = map paginas  

cantidadLibros = genericLength
