-- Cómo serán las raíces de mi cuadrática
 -- discriminante -> b²-4ac
 
 -- > 0  : 2 raíces reales
 -- == 0 : raíz doble
 -- < 0  : 2 raíces imaginarias
 
 -- raices 1 2 1 -> "Tiene raíz doble"
 -- raices 1 2 2 -> "Tiene raíces imaginarias"
 
 

 alargarUnPoco longitud = longitud + 10
 longitudMaxima = 25
 sirve longitud = longitud > longitudMaxima
 
 sirveAlargandoUnPoco = sirve . alargarUnPoco
 
 -- esElMismo/2: Se cumple cuando los dos elementos que recibe son iguales
 
 
 -- esDivisiblePorDos
 
 fLoca :: Int -> Int -> Int -> Int
 fLoca x y z = x - y + (z * 2)
 -- aplicar x = 2, y = 1, z = 3
 -- 
 -- aplicar x = 2, y = 1
 -- 
 -- aplicar x = 2
 -- 
 -- no aplicar nada
 -- 
 -- aplicar y = 1, z = 3
 -- 
 
 
 -- flip