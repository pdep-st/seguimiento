import Text.Show.Functions
import Data.List
-- sumarPrimeros:: Num a => (a,b) -> (a,c) -> a 
sumarPrimeros x y =
    fst x + fst y

sumarCoordenadas (x1, y1) (x2, y2) =
    ( x1 + x2 , y1 + y2)

-- :t (max 2) :: (Num a, Ord a) => a -> a
doble = (* 2)
elPrimero = fst
mas10 x = x + 10

type Autor = String
type Titulo = String
type Paginas = Int
type Libro = (Titulo, Autor, Paginas)
type Biblioteca = [Libro]

elVisitante :: Libro
elVisitante = ("El Visitante", "Stephen King", 592)

shingekiNoKyojin1 :: Libro
shingekiNoKyojin1 = ("Shingeki no Kyojin 1", "Hajime Isayama", 40)

shingekiNoKyojin3 :: Libro
shingekiNoKyojin3 = ("Shingeki no Kyojin 3", "Hajime Isayama", 40)

shingekiNoKyojin27 :: Libro
shingekiNoKyojin27 = ("Shingeki no Kyojin 27", "Hajime Isayama", 40)

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

miBiblioteca :: Biblioteca
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

promedioDePaginas biblioteca = 
  div (paginasTotales biblioteca) (cantidadLibros biblioteca)

-- cantidadLibros
cantidadLibros biblioteca = length biblioteca

-- paginasTotales :: Biblioteca -> Int
paginasTotales biblioteca = sum (map paginasDeLibro biblioteca)
    -- paginasDeLibro
paginasDeLibro :: Libro -> Paginas
paginasDeLibro (_, _, paginas) = paginas

autor:: Libro -> Autor
autor (_, autor, _) = autor

titulo:: Libro -> Titulo
titulo (titulo, _, _) = titulo

-- y si quiero saber cuantos libros (length)
-- tienen un numero 
-- de paginas par mayores a 100
-- 

-- filter :: (a -> Bool) -> [a] -> [a]
-- map :: (a -> b) -> [a] -> [b]

-- lecturaObligatoria:: Libro -> Bool
-- sagaEragon libro = (nombre libro) == "Eragon"
--     || (nombre libro) == "Brisignr"
--     || (nombre libro) == "Eldest"
--     || (nombre libro) == "Legado"

titulosEragon = [
   "Eragon",
   "Brisignr",
   "Eldest",
   "Legado"
   ]

sagaEragon libro = elem (titulo libro) titulosEragon

-- sagaEragon libro = esLibroDeEragon (titulo libro)
-- esLibroDeEragon "Eragon" = True
-- esLibroDeEragon "Eldest" = True
-- esLibroDeEragon "Legado" = True
-- esLibroDeEragon "Brisignr" = True
-- esLibroDeEragon _ = False

-- esDeStephenKing
