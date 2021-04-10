import Text.Show.Functions()

data Libro = Libro {
    nombre:: String,
    autor:: String,
    paginas:: Int
} deriving (Show, Eq)

elVisitante = Libro { nombre = "El visitante", autor = "Stephen King", paginas = 592 }

shingekiNoKyojin1 = Libro { nombre = "Shingeki no Kyojin - Capitulo 1", autor = "Hajime Isayama", paginas = 40 }
shingekiNoKyojin3 = Libro { nombre = "Shingeki no Kyojin - Capitulo 3", autor = "Hajime Isayama", paginas = 40 }
shingekiNoKyojin127 = Libro { nombre = "Shingeki no Kyojin - Capitulo 127", autor = "Hajime Isayama", paginas = 40 }

fundacion = Libro { nombre = "Fundacion", autor = "Isaac Asimov", paginas = 230 }

sandman5 = Libro { nombre = "Sandman - Capitulo 5", autor = "Neil Gaiman", paginas = 35 }
sandman10 = Libro { nombre = "Sandman - Capitulo 10", autor = "Neil Gaiman", paginas = 35 }
sandman12 = Libro { nombre = "Sandman - Capitulo 12", autor = "Neil Gaiman", paginas = 35 }

eragon = Libro { nombre = "Eragon", autor = "Christopher Paolini", paginas = 544 }
eldest = Libro { nombre = "Eldest", autor = "Christopher Paolini", paginas = 704 }
brisignr = Libro { nombre = "Brisignr", autor = "Christopher Paolini", paginas = 700 }
legado = Libro { nombre = "Legado", autor = "Christopher Paolini", paginas = 811 }

biblioteca = [elVisitante, shingekiNoKyojin1, shingekiNoKyojin3, shingekiNoKyojin127, fundacion, sandman5, sandman10, sandman12, eragon, eldest, brisignr, legado] 

-- lecturaObligatoria
esDe unAutor libro = (autor libro) == unAutor
sagaDeEragon = [eragon, eldest, brisignr, legado]
perteneceAEragon libro = elem libro sagaDeEragon

lecturaObligatoria libro = 
    esDe "Stephen King" libro || 
    perteneceAEragon libro || 
    libro == fundacion

-- fantasioso
autoresFantasiosos = ["Christopher Paolini",  "Neil Gaiman"]
fantasioso libro = elem (autor libro) autoresFantasiosos

-- ligero
ligero = (<= 40) . paginas 

promedioDeHojas biblioteca =
    fromIntegral (totalDeHojas biblioteca) / fromIntegral (length biblioteca)

totalDeHojas = sum . map paginas

lecturasObligatoria biblioteca = filter lecturaObligatoria biblioteca

bibliotecaFantasiosa biblioteca = 
    any fantasioso biblioteca

esVocal 'a' = True
esVocal 'e' = True
esVocal _ = False

nombreDeLaBiblioteca biblioteca =
    (filter (not . esVocal) . concat . map nombre) biblioteca


aumentarPaginas (Libro nombre autor paginas) paginasAAgregar = 
    Libro nombre autor (paginas + paginasAAgregar)













