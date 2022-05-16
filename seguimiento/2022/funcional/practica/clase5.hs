import Text.Show.Functions
import Data.List

-- Hora de Lectura
-- (Titulo, Autor, Paginas)
-- data Libro = Libro String, String, Int
data Libro = Libro {
    titulo:: String,
    autor:: String,
    paginas:: Int
  } deriving (Show, Eq, Ord)

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

shingekiNoKyojin1 :: Libro
shingekiNoKyojin1 = Libro "Shingeki no Kyojin 1" "Hajime Isayama" 40

shingekiNoKyojin3 :: Libro
shingekiNoKyojin3 = Libro "Shingeki no Kyojin 3" "Hajime Isayama" 40

shingekiNoKyojin27 :: Libro
shingekiNoKyojin27 = Libro "Shingeki no Kyojin 27" "Hajime Isayama" 40

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

{- Se tiene que borrar por syntaxt record!!
titulo :: Libro -> String
titulo (Libro titulo _ _) = titulo
autor :: Libro -> String
autor (Libro _ autor _) = autor
paginas :: Libro -> Int
paginas (Libro _ _ paginas) = paginas
-}

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
esLecturaObligatoria (Libro _ "Stephen King" _) = True
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

fantasiosa biblioteca = any esFantasioso biblioteca

esFantasioso libro = autorEs libro "Neil Gaiman"
                        || autorEs libro "Christopher Paolini"

autorEs libro autorEsperado = autor libro == autorEsperado

-- any :: (a -> Bool) -> [a] -> Bool 

esLigero libro = paginas libro <= 40

siempreTrue _ = True

bibliotecaLigera biblioteca = all esLigero biblioteca

-- all :: (a -> Bool) -> [a] -> Bool

aplicar funcion parametro = funcion parametro
-- ($)