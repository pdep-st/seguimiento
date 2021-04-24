factorial 0 = 1
factorial 1 = 1
factorial n = n * factorial (n - 1)

mayor a b
    | a > b = a
    | otherwise = b

probabilidadLluvia "Despejado" = 0
probabilidadLluvia "Nublado" = 20
probabilidadLluvia "Relampaguea" =  100
probabilidadLluvia _ = 40

noMeImportaElPrimero:: a -> b -> b
noMeImportaElPrimero _ b = b

-- adulto, alguien es adulto si no es menor de edad
-- alguien es menor de edad, cuando tiene menos de 18 años
edadLimiteParaMenores = 18
menorDeEdad edad = edad < edadLimiteParaMenores
-- condicion 0, ambos parametros son funciones
-- 1ra condición, la de la izq 1 parametro
-- 2da condición, la de la der 1 parametro
-- 3ra condición, la salida de la derecha es entrada de la izq
-- 

adulto = not . menorDeEdad . edad

--
primero (a, _) = a
segundo (_, b) = b

-- persona (nombre, apellido, edad)
gaston = ("gaston", "prieto", 34)

type Persona = (String, String, Integer)

edad :: Persona -> Integer
edad (_, _, edad) = edad

nombre :: Persona -> String
nombre (nombre, _, _) = nombre

apellido :: Persona -> String
apellido (_, apellido, _) = apellido

envejecer:: Persona -> Persona
envejecer (nombre, apellido, edad) = (nombre, apellido, edad + 1)