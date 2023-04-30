import Text.Show.Functions
import Data.List

-- Hora de Lectura

data Libro = Libro {
    titulo:: String,
    autor:: String,
    paginas:: Int
} deriving (Show, Eq)

{-
data CD = CD {
    nombre:: String,
    autor:: String
}
-}

elVisitante :: Libro
elVisitante = Libro {
    autor = "Stephen King",
    titulo = "El Visitante",
    paginas = 592
}

--shingekiNoKyojin tomo = ("Shingeki no Kyojin " ++ show tomo, "Hajime Isayama", 40)

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

sagaEragon = [
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

esSagaEragon libro = elem libro sagaEragon

esObligatorio libro =
    libro == fundacion ||
    autor libro == "Stephen King" ||
    esSagaEragon libro

lecturasObligatorias =
    filter esObligatorio

tituloDeLecturasObligatorias biblioteca =
    map titulo . lecturasObligatorias $ biblioteca

cambiarTitulo nuevoTitulo libro =
    libro {
        titulo = nuevoTitulo
    } 