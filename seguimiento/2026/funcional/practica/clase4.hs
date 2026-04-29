module Library where
import PdePreludat

doble :: Number -> Number
doble numero = numero + numero

empiezaComoTermina :: String -> Bool
empiezaComoTermina palabra = head palabra == last palabra

siguiente :: Number -> Number
siguiente x = x +1

capicua :: Eq a => [a] -> Bool
capicua palabra = palabra == reverse palabra

f1:: [a]-> b -> [a]
f1 algo otraCosa = head algo : tail algo

f2 a b = a

f3:: String-> String -> String
f3 algo otraCosa = head algo : tail otraCosa

--Ejercicios de listas que se pueden hacer:
--removePorPosicion
--removePorContenido
--sinElemento 
--insertarEnUnaPosicion

elementoMedioPar :: [a]-> a
elementoMedioPar = last.mediaLista 
--elementoMedioImpar lista = last (take ((div (length lista) 2)+1) lista)

mediaLista :: [a] -> [a]
mediaLista lista = take (div (length lista) 2) lista

elementoMedio :: [a] -> a
elementoMedio lista = head (drop(length lista `div` 2) lista)

--Definicion de una funcion de ORDEN SUPERIOR. Anticipo de lo que vamos a ver en proximas clases
parteLista :: (Number -> String -> String) -> String -> String
parteLista takeodrop lista = takeodrop 4 lista
----

---Ejercicio de las películas

type Titulo = String
type Pais = String
type Duracion = Number
type Peli = (Titulo,Duracion,Pais,Bool)

peli1, peli2, peli3 :: Peli
peli1 = ("titanic",800,"usa",True)
peli2 = ("la historia oficial",120, "arg", False)
peli3 = ("harry potter", 200, "usa",False)

--duracion (nombre, tiempo, pais, buena) = tiempo
duracion :: Peli -> Duracion
duracion (_, tiempo, _, _) = tiempo

tiempoTotal:: [Peli] -> Duracion
tiempoTotal maraton = sum (map duracion maraton )

peliculasDelPais ::Pais -> [Peli] ->  [Peli]
peliculasDelPais pais pelis = filter ((pais==). origen) pelis
    where origen (_, _, lugar, _) = lugar
-- con definición local de funciones

tiempoTotalDePeliculasDelPaisIndicado::[Peli]->Pais->Duracion
tiempoTotalDePeliculasDelPaisIndicado pelis pais =  (tiempoTotal . peliculasDelPais pais) pelis

superanDuracion :: Duracion -> [Peli] -> [Peli]
superanDuracion durASuperar pelis = filter ((>durASuperar).duracion) pelis
--Variante con expresión lambda
--superanDuracion durASuperar pelis = filter (\(_,tiempo,_,_) -> tiempo > durASuperar) pelis

cantidadPeliculasDeMasDeTantosMinutos::[Peli]->Duracion->Number
cantidadPeliculasDeMasDeTantosMinutos pelis minsAsuperar =
        (length . (superanDuracion minsAsuperar)) pelis
 

nombreDeLaPrimerPeliculaDeUSA :: [Peli] -> Titulo
nombreDeLaPrimerPeliculaDeUSA peliculas = (nombre.head.peliculasDelPais "usa") peliculas

nombre :: Peli -> Titulo
nombre (titulo, _, _, _) = titulo

-- Ejemplos de consultas
e1 = nombreDeLaPrimerPeliculaDeUSA [peli1,peli2,peli3] --"titanic"
e2 = cantidadPeliculasDeMasDeTantosMinutos [peli1,peli2,peli3] 1
e3 = map ((1+).snd) (filter ((<5).snd) [("A",1),("B",4),("F",9)]) --[2,5]
e4 = map (/2) [2,3,4,5,5] --[1,1.5,2,2.5,2.5]
e5 = map (\x -> x / (x+1)) [10,30,100]
