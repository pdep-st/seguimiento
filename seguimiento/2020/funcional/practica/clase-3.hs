-- tipos even
-- tipos (>0)
--esPositivo n = n > 0
esPositivo = (>0)

-- (==)
-- (== 'p')
empiezaCon:: Char -> (String -> Bool)
empiezaCon letra = (==letra) . head

-- tipos (*)
-- tipos (*2)

-- “El costo de estacionamiento es de 50 pesos la hora, 
-- con un mínimo de 2 horas”, esto significa que
type Horas = Int  
type Costo = Int
costoEstacionamiento :: Horas -> Costo
costoEstacionamiento = (50 *) . (max 2)

-- type String = [Char]

--costoEstacionamiento
--    | horas <= 3 = 150
--    | otherwise = horas * 50

-- aplicar f x 

-- esPositivoLuegoDeUnaCuenta x f = ??

-- (a -> a)
reciboUnaFuncionYLaDevuelvo :: (a -> a) -> Int 
reciboUnaFuncionYLaDevuelvo f = 12


--(.):: (b -> c) -> (a -> b) -> (a -> c) 