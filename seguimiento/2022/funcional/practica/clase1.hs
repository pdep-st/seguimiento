nombre = "Iñaki"

par :: Int -> Bool
par = even

incrementarUno :: Int -> Int
incrementarUno x = x + 1

suma x y = x + y

hacerCosas x y z = (x + y) * z


tieneLetrasPar :: String -> Bool
tieneLetrasPar nombre = even (length nombre)

aprobo nota = nota >= 6

aproboCursada :: Int -> Int -> Int -> Bool
aproboCursada nota1 nota2 nota3 = aprobo nota1 && aprobo nota2 && aprobo nota3

doble x = 2 * x
cuadruple x = doble (doble x)