module Library where
import PdePreludat

funcionesCopadas = [even, odd, (>0)]

cualesCumplen:: [(Number -> Bool)] -> Number -> [(Number -> Bool)] 
cualesCumplen funciones valor =
    --filter (\funcion -> funcion valor) funciones
    filter ($ valor) funciones


 -- tipo de la lambda :: (Number -> Bool) -> Bool

aplicar funcion valor = funcion valor
(#) funcion valor = funcion valor

aplicar2 = (#2)

-- cabeza, cola

cabeza (x:_) = x
cola (_:xs) = xs

 -- estaVacia
estaVacia [] = True
estaVacia _ = False

 --tieneExactamenteUnSoloElemento
--tieneExactamenteUnSoloElemento (_:[]) = True
tieneExactamenteUnSoloElemento [_] = True
tieneExactamenteUnSoloElemento _ = False

tieneExactamenteTres [_, _, _] = True
tieneExactamenteTres _ = False

tieneAlMenosDos (_:_:_) = True
tieneAlMenosDos _ = False
 --estaOrdenada


 -- longitud
 -- [] -> 0
 -- [3] -> 1
 -- [3,4] -> 2
longitud :: [a] -> Number
longitud [] = 0
longitud (_:xs) = 1 + longitud xs
 
 -- sumatoria/1
 -- [1,2,3] -> 6
sumatoria :: [Number] -> Number
sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria xs
 

 -- productoria/1
  -- [1,2,3,4] -> 24
productoria :: [Number] -> Number
productoria [] = 1
productoria (x:xs) = x * productoria xs