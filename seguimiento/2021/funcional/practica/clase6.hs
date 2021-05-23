import Text.Show.Functions()

data Persona = Persona String Int deriving Show

-- discriminante a b c = b ** 2 - 4 * a * c

-- raices a b c
--   | valorDiscriminante > 0 = "2 raices simples" 
--   | valorDiscriminante == 0 = "raiz doble"
--   | valorDiscriminante < 0 = "raices imaginarias"
--     where valorDiscriminante = discriminante a b c

raices a b c
  | valorDiscriminante > 0 = "2 raices simples" 
  | valorDiscriminante == 0 = "raiz doble"
  | valorDiscriminante < 0 = "raices imaginarias"
    where valorDiscriminante = b ** 2 - 4 * a * c

esMultiploDe n m = (n mod m) == 0
esBisiesto anio = esMultiploAnual 400 || centenialDeBisiesto
    where 
        esMultiploAnual n = esMultiploDe anio n
        centenialDeBisiesto = esMultiploAnual 4 
            && not (esMultiploAnual 100)

--dameN "unaPalabraSuperLarga" [1, 4, 6]
-- [take 1 "unaPalabraSuperLarga", take 4 "", take 6 "" ]
-- ["u", "unaP", "unaPal"]
-- dameN unaPalabra longitudes =
--     map takeAlReves longitudes
--      where takeAlReves n = take n unaPalabra
dameN unaPalabra longitudes = 
    map (\ longitud -> take longitud unaPalabra) longitudes

-- (\x -> x + 1)

-- dameN unaPalabra longitudes
--    = map (flip take unaPalabra) longitudes

cabeza ( cabeza : _ ) = cabeza
cola ( _ : cola ) = cola 

esVacia [] = True
esVacia _ = False

estaOrdenado [] = True
-- estaOrdenado (x:[]) = True
estaOrdenado [x] = True
estaOrdenado (primero : (segundo : cola)) = 
    primero <= segundo && estaOrdenado (segundo : cola)

---
longitud [] = 0
longitud (_ :xs) = 1 + longitud xs 

-- sumatoria
sumatoria [] = 0
sumatoria (x : xs) = x + sumatoria xs

-- productoria 

esVocal 'a' = True
esVocal 'e' = True
esVocal 'i' = True
esVocal 'o' = True
esVocal 'u' = True
esVocal _ = False