import Text.Show.Functions

suma x y = x + y

suma' (x, y) = x + y

--adicionar x y = suma x y 
--adicionar x y = suma' (x, y)
--((a, b) -> c) -> (a -> b -> c)

coordenadas = [(1,2) , (2,3) , (3,5)]

func x y z = x + y * z

func' = (\x -> (\y -> (\z -> x + y * z)))

suma3 (x,y,z) = x + y + z

curry3 funcion = (\x -> (\y -> (\z -> funcion (x, y, z))))
curry3' funcion x y z = funcion (x, y, z)