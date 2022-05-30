import Text.Show.Functions

-- personas = [Persona ["Nadar", "Respirar"], Persona ["Vivir", "Pagar Impuestos"]]

-- map habilidades personas -> 
--    [["Nadar", "Respirar"], ["Vivir", "Pagar Impuestos"]]

-- foldr (++) [] misHabilidades
-- ["Nadar", "Respirar", "Vivir", "Pagar Impuestos"]


misPares lista = [ x * 4 | x <- lista, even x, x > 18 || x < 5]

misPares' lista = (map (*4) . filter (\x -> even x && x > 18)) lista

-- Evaluación Diferida
-- Evaluación Perezosa
-- Lazy Evaluation

-- muchos/1
muchos n = n : (muchos n)

fLoca = fst (1, muchos 3) -- No se ejecuta el muchos 3

-- tomar/2
tomar 0 _ = []

tomar _ [] = []

tomar n (x:xs) = x : tomar (n-1) xs


-- tomar 2 (muchos 3)

enumerarDesde n = n : enumerarDesde (n + 1)