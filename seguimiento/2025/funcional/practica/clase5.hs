import Text.Show.Functions
import Data.List

-- Hora de aventura

data Libro = Libro {
    nombre::String,
    autor::String,
    paginas::Double
} deriving (Show, Ord)

instance Eq Libro where
    (==) libro otroLibro =
        nombre libro == nombre otroLibro
            && autor libro == autor otroLibro

data CD = CD {
    nombreCD::String,
    autorCD::String,
    duracionCD:: Double
    } deriving (Eq, Show)

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

eragonCorto :: Libro
eragonCorto = Libro "eragon" "Christopher Paolini" 420

eldest :: Libro
eldest = Libro "eldest" "Christopher Paolini" 704

brisignr :: Libro
brisignr = Libro "brisignr" "Christopher Paolini" 700

legado :: Libro
legado = Libro "legado" "Christopher Paolini" 811

ayAyAy :: CD
ayAyAy = CD "Ay ay ay" "Los Piojos" 121

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

sagaEragon = [eragon,
        eldest, 
        brisignr, 
        legado]

promedioDePaginas biblioteca = round (cantidadPaginas biblioteca) `div` cantidadLibros biblioteca


cantidadPaginas biblioteca = sum(map paginas biblioteca)

cantidadLibros = genericLength

esLecturaObligatoria libro = autor libro == "Stephen King" || esDeEragon libro || nombre libro == "Fundacion"

esDeEragon libro = elem libro sagaEragon 


sonLecturaObligatoria biblioteca = filter esLecturaObligatoria biblioteca

--componerNombreConAutor (Libro nombre autor _) = nombre ++ autor
componerNombreConAutor libro = nombre libro ++ autor libro

--cambiarNombre nuevoNombre (Libro _ autor paginas) = Libro nuevoNombre autor paginas
cambiarNombre nuevoNombre libro = libro {
    nombre = nuevoNombre
}