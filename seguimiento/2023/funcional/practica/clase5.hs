import Data.List

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
