import Text.Show.Functions()

-- cabeza
cabeza (x:_) = x

-- cola
cola (_:xs) = xs

--otraFuncion (x:[]) = x
otraFuncion [x] = x

-- otroPatron [x:xs] => [(x:xs)] => (x:xs):[]
otroPatron [x:xs] = x

esVacia [] = True
esVacia _ = False

-- longitud
longitud [] = 0 -- caso base
longitud (x : xs) = 1 + longitud xs --caso recursivo

-- mapeate
mapeate f [] = []
mapeate f (x:xs) = f x : mapeate f xs

filtrate f [] = []
filtrate f (x : xs)
  | f x = x : filtrate f xs
  | otherwise = filtrate f xs

-- raices
raices a b c
    | discriminante > 0 = "2 raices"
    | discriminante == 0 = raicesDobles
    | otherwise = "raices no reales"
    where discriminante = b ^ 2 - 4 * a * c
          raicesDobles = "raices dobles"

-- dameN "unaPalabraSuperLarga" [1, 4, 6]
-- ["u", "unaP", "unaPal"]
-- dameN palabra longitudes =
--    map takeAlReves longitudes
--    where takeAlReves n = take n palabra

--dameN palabra longitudes =
--    map (\n -> take n palabra) longitudes

dameN palabra longitudes =
    map (flip take palabra) longitudes

-- sumate / 1 en Haskell sum/1


-- multiplicate / 1 en Haskell product/1