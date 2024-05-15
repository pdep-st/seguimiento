-- cabeza, cola
cabeza (cabeza:_) = cabeza 

cola (_:xs) = xs


-- estaVacia
estaVacia [] = True
estaVacia (_:_) = False


--tieneUnSoloElemento
--tieneUnSoloElemento (_:[]) = True

tieneUnSoloElemento [_] = True

tieneUnSoloElemento _ = False

--estaOrdenada

-- longitud
longitud [] = 0
longitud (_:xs) = 1 + longitud xs

-- sumatoria/1
sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria xs

-- productoria/1
productoria [] = 1
productoria (x:xs) = x * productoria xs
