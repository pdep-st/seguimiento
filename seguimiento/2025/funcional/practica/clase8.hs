import Text.Show.Functions

-- Evaluación Diferida vs Evaluación Ansiosa (Eager Evaluation)
-- Evaluación Perezosa
-- Lazy Evaluation

-- muchos/1
muchos n = n : muchos n

-- fLoca = fst (1, muchos 3)

-- fSuperLoca lista = False && head lista

-- truePara0
truePara0 0 = True
truePara0 _ = False

-- tomar/2


-- tomar 2 (muchos 3)

-- enumerarDesde
enumerarDesde n = n : enumerarDesde (n + 1)

-- Ejercicio de Final

between n m x = elem x [n .. m]

data Futbolista = UnFutbolista {
    posiciones :: [Int],
    goles :: Int
} deriving (Show,Eq)

tito = UnFutbolista [9,10] 47

meterGoles cant (UnFutbolista posiciones goles) = UnFutbolista posiciones (goles + cant)

jugarDe posicion (UnFutbolista ps goles) = UnFutbolista (agregarPosicion posicion ps) goles

agregarPosicion p ps 
    |not (elem p ps) && between 1 11 p = p : ps
    |otherwise = ps

{- En cada una de las consolas siguientes, ¿qué sucede en la última consulta? ¿Hay respuesta? ¿Cuál es?  Justifique conceptualmente en todos los casos. 
    
? Consola A)
> tito 
UnFutbolista [9,10] 47

> meterGoles 2 tito
UnFutbolista [9,10] 49

> goles tito --> 47 por asignación destructiva / transparencia referencial

? Consola B)
> jugarDe 2 (UnFutbolista [3..] 1) 

? Consola C)
> meterGoles 3 --> aplicación parcial
-}

{- 
Usando composición, escriba una consulta que permita conocer si, luego de haber jugado de 4 y haber jugado de nuevo de 10, es cierto que tito jugó en más de 2 posiciones.
-}
jugoMasDe2Posiciones = (>2) . length . posiciones . jugarDe 10 . jugarDe 4

{- 
Dadas las funciones f, g y h de las cuales sólo conocemos su tipo:
f :: (a -> b) -> c -> (b, c)         g :: a -> a -> Bool             h :: [a] -> [b]
even :: Int a => a -> Bool
Indicar cuáles de las siguientes expresiones tipan (indicando cuál es el tipo de dicha expresión) y cuáles no (indicando el motivo por el cuál no tipan):

f h . g 3 --> ([b], Bool)

g 3 . h --> h devuelve una lista [b], y g espera como segundo parámetro un Entero 

f even . g 1 2 --> no tipa ya que g devulve un Bool, no una función

f :: (a -> b) -> (c -> (b, c))
g :: a -> (a -> Bool)

f . g 
-}
