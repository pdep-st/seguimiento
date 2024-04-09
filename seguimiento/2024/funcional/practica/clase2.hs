import Text.Show.Functions
-- alargarUnPoco/1: Recibe la longitud de un cable 
-- y le agrega 10 metros
alargarUnPoco longitud = longitud + 10

-- sirve/1: Recibe la longitud de un cable y dice 
-- si es mayor al largo maximo
longitudMaxima = 25

sirve longitud = longitud > longitudMaxima


-- sirveAlargandoUnPoco/1

--sirveAlargandoUnPoco longitud = sirve (alargarUnPoco longitud)
sirveAlargandoUnPoco = sirve . alargarUnPoco

-- g o f (x) = g(f(x))

doble unNumero = unNumero * 2

--tresVecesDoble unNumero = doble (doble (doble unNumero))
tresVecesDoble = doble . doble . doble

--esPar = even


-- signo/1


-- esPar/1


-- probabilidadLluvia/1 (clima)
--   "Despejado"      0
--   "Nublado"        50
--   "Relampaguea"    100
--   cualquierOtro    40




-- buenDia/1
-- "Lunes"  False
-- "Martes" 0
-- "Miércoles" "Ahí nomás"
-- "Viernes" 'X'


-- esMayorA10DespuesDeIncrementar/1