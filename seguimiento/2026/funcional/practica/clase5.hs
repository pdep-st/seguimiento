module Library where
import PdePreludat

-- Hora de Lectura
-- Syntax Sugar

-- type Libro = (String, String, Number)
-- Record Syntax
data Libro = Libro {
    titulo:: String,
    autor:: String,
    paginas:: Number
} deriving Show

instance Eq Libro where
    (==) libro otroLibro = 
        titulo libro == titulo otroLibro &&
        autor libro == autor otroLibro

elVisitante :: Libro
elVisitante = Libro "El Visitante" "Stephen King" 592

nuevoVisitante :: Libro
nuevoVisitante = Libro {
    autor = "Stephen King",
    titulo = "El Visitante",
    paginas = 312
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

eragonCorto :: Libro
eragonCorto = Libro "eragon" "Christopher Paolini" 420

eldest :: Libro
eldest = Libro "eldest" "Christopher Paolini" 704

brisignr :: Libro
brisignr = Libro "brisignr" "Christopher Paolini" 700

legado :: Libro
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

sagaEragon = [eragon,
        eldest, 
        brisignr, 
        legado]

promedioDePaginas:: Biblioteca -> Number
promedioDePaginas biblioteca = cantidadPaginas biblioteca `div` cantidadLibros biblioteca

--paginas:: Libro -> Number
--paginas (Libro _ _ paginas) = paginas

cantidadPaginas = sum . map paginas
cantidadLibros = length

data CD = CD String String Number

ayAyAy:: CD
ayAyAy = CD "Ay Ay Ay" "Los Piojos" 85

coleccionDeDiscos = [ayAyAy]

nombre (CD nombre _ _) = nombre

-- cambiarNombre (Libro _ autor paginas) nuevoNombre = Libro nuevoNombre autor paginas
conNuevoNombre libro nuevoNombre = libro {titulo=nuevoNombre}