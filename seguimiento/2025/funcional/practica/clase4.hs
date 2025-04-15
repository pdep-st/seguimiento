import Text.Show.Functions
import Data.List

type Persona = (String, Int)

martina = ("Martina", 21)
-- nombre (x, y) = fst (x, y)
--nombre persona = fst persona
cumplirAnios (nombre, edad) = (nombre, edad + 1)

 -- Cómo serán las raíces de mi cuadrática
 -- discriminante -> b²-4ac
 
 -- > 0  : 2 raíces reales
 -- == 0 : raíz doble
 -- < 0  : 2 raíces imaginarias
 
 -- raices 1 2 1 -> "Tiene raíz doble"
 -- raices 1 2 2 -> "Tiene raíces imaginarias"
 
raices a b c
    | discriminante > 0 = "Reales"
    | discriminante == 0 = "Doble"
    | otherwise = "Imaginarias"
    where discriminante = b ** 2 - 4 * a * c

funcionMatematica x y z
    | calculo * 21 < 0 = 66
    | calculo ^ 2 == 21 = 67
    | otroCalculo 2 == 99 = 10
    | otroCalculo 15 > 0 = 11
    where calculo = otroCalculo z - z
          otroCalculo b = x * y * b

alargarUnPoco longitud = longitud + 10
longitudMaxima = 25
sirve longitud = longitud > longitudMaxima
 
sirveAlargandoUnPoco = sirve . alargarUnPoco

-- lambda
sirveAlargandoUnPoco' = 
    (\longitud -> longitud > longitudMaxima) . (\longitud -> longitud + 10)
    where longitudMaxima = 25
 
 -- esElMismo/2: Se cumple cuando los dos elementos que recibe son iguales
esElMismo x y = x == y 
esElMismo' x = (\y -> y == x )

esMartin = esElMismo "Martin"

 -- esDivisiblePorDos
esDivisiblePorDos numero = mod numero 2 == 0
esDivisiblePorDos' = (0 ==) . (`mod` 2)


fLoca :: Int -> Int -> Int -> Int
fLoca x y z = x - y + (z * 2)
 -- aplicar x = 2, y = 1, z = 3
 -- fLoca 2 1 3 -> 7
 -- aplicar x = 2, y = 1
 -- fLoca 2 1 :: Int -> Int
 -- aplicar x = 2
 -- fLoca 2 :: Int -> Int -> Int
 -- no aplicar nada
 -- fLoca :: Int -> Int -> Int -> Int
 -- aplicar y = 1, z = 3
 --  (aplicar fLoca 1 3) 2
 -- 

aplicar f y z x = f x y z
aplicar' f y = flip ( flip fLoca y)
 
 -- flip  

flip' f x y = f y x

-- aplicar y = 1, z = 3 
-- (flip ( flip fLoca 1) 3) 2

lista1 = [10, 30, 34]
lista2 = [23, 56, 30]

-- Hora de aventura

type Libro = (String, String, Double)

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

promedioDePaginas biblioteca = cantidadPaginas biblioteca `div` cantidadLibros biblioteca

paginas (_,_,paginas) = paginas

cantidadPaginas biblioteca = sum(map paginas biblioteca)

cantidadLibros = length

esLecturaObligatoria libro = autor libro == "Stephen King" || esDeEragon libro || nombre libro == "Fundacion"

autor (_, autor, _) = autor

esDeEragon libro = elem libro sagaEragon 

nombre (nombre, _, _) = nombre

sonLecturaObligatoria biblioteca = filter esLecturaObligatoria biblioteca
