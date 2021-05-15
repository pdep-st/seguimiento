import Text.Show.Functions()

type Autor = String
type Titulo = String
type Paginas = Int

data Libro = Libro {
    titulo :: String,
    autor :: String,
    paginas :: Int
} deriving (Show, Eq)

type Biblioteca = [Libro]

elVisitante :: Libro
elVisitante = Libro {
    titulo =  "El Visitante",
    autor = "Stephen King",
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

legado :: Libro
legado = Libro "legado" "Christopher Paolini" 811

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
paginasTotales biblioteca = 
    sum . map paginasDeLibro $ biblioteca

-- paginasDeLibro
paginasDeLibro :: Libro -> Paginas
paginasDeLibro = paginas

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

-- Si la biblioteca es fantasiosa, es decir, 
-- si tiene algún libro de Christopher Paolini o de Neil Gaiman.
-- elem :: Eq a => a -> [a] -> Bool

fantasiosa biblioteca = any esLibroFantasioso biblioteca

elAutorEs nombre = (== nombre) . autor 

esLibroFantasioso libro  = elAutorEs "Christopher Paolini" libro 
    || elAutorEs "Neil Gaiman" libro 

agregarPaginas cantidad unLibro = unLibro {
    paginas = paginas unLibro + cantidad 
}