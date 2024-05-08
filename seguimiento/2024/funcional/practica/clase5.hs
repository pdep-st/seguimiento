import Text.Show.Functions
import Data.List

-- Record syntax
data Libro = Libro {
    nombre:: String,
    autor:: String,
    paginas:: Int
 } deriving Ord
data Loco = Loco String (Libro -> Libro) deriving Show -- No soporta Eq

instance Eq Libro where
    (==) libro otroLibro =
        nombre libro == nombre otroLibro

instance Show Libro where
    show libro = nombre libro ++ ": " ++ autor libro

miLoco = Loco "Soy un loco" id

elVisitante :: Libro
elVisitante = Libro {
    autor = "Stephen King",
    nombre = "El Visitante",
    paginas = 592
  }

shingekiNoKyojin1 :: Libro
shingekiNoKyojin1 = Libro "Shingeki no Kyojin 1" "Hajime Isayama" 40

shingekiNoKyojin3 :: Libro
shingekiNoKyojin3 = Libro "Shingeki no Kyojin 3" "Hajime Isayama" 40

shingekiNoKyojin127 :: Libro
shingekiNoKyojin127 = Libro "Shingeki no Kyojin 27" "Hajime Isayama" 40

fundacion :: Libro
fundacion = Libro "Fundacion" "Isaac Asimov" 230

sandman5 :: Libro
sandman5 = Libro "sandman5" "Neil Gaiman" 35

sandman10 :: Libro
sandman10 = Libro "sandman10" "Neil Gaiman" 35

sandman12 :: Libro
sandman12 = Libro "sandman12" "Neil Gaiman" 35

eragon :: Libro
eragon = Libro "eragon" "Christopher Paolini" 544

eldest :: Libro
eldest = Libro "eldest" "Christopher Paolini" 704

brisignr :: Libro
brisignr = Libro "brisignr" "Christopher Paolini" 700

legado = Libro "legado" "Christopher Paolini" 811

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

totalPaginas biblioteca = sum (map paginas biblioteca)

esAutor autorDeseado libro = autor libro == autorDeseado

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

feDeErratas libro nuevoAutor = 
    libro {
        autor = nuevoAutor
    }