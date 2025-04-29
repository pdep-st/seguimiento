-- cabeza, cola
 cabeza (cabeza:_) = cabeza

 cola (_:cola) = cola


 -- estaVacia
 estaVacia (_:_) = False
 estaVacia [] = True


 --tieneExactamenteUnSoloElemento
 --tieneUnSoloElemento' (_:[]) = True
 --tieneUnSoloElemento' (_:_) = False
 --tieneUnSoloElemento' [] = False
 
 tieneUnSoloElemento [_] = True
 tieneUnSoloElemento _ = False


 --estaOrdenada


 -- longitud
 -- [] -> 0
 -- [3] -> 1
 -- [3,4] -> 2

 longitud (_:xs) = 1 + longitud xs
 longitud [] = 0

 
 -- sumatoria/1
 -- [1,2,3] -> 6
 sumatoria [x] = x
 sumatoria (x:xs) = x + sumatoria xs
 

 -- productoria/1
  -- [1,2,3,4] -> 24
 productoria [x] = x
 productoria (x:xs) = x * productoria xs 