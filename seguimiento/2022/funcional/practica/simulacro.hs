-- 1
-- 1.a)
-- facha: (60 - edad del candidato)  + carisma del candidato * 3

-- 1.b)
-- liderazgo: edad del candidato * 10

-- 1.c)
-- riqueza: carisma del candidato + edad del candidato / 50

-- 1.d)
-- corrupto: resta 100 (en este caso no ayuda a convencer)

-- 1.e)
-- tiktoker: 100

-- 1.f)
-- flogger: 0 ( ya pasó de moda (?) )

-- 2)
-- 2.a)
-- Cintia, que tiene 40 años, su carisma es de 12 y las capacidades
-- que tiene son liderazgo, riqueza y es tiktoker.

-- 2.b)
-- Marcos, que tiene 45 años, su carisma es de 10 y las capacidades
-- que tiene son facha, liderazgo, corrupto.


-- 3)
-- Se desea saber si una persona tiene capacidades inútiles,
-- se cumple cuando la persona tiene al menos una capacidad
-- con convencimiento menor o igual a 0.

-- 4)
-- Saber los candidatos que entre sus capacidades 
-- no tienen ninguna que reste puntos o que no hagan nada.

-- 5)
-- Se desea poder evaluar las capacidades de un candidato y
-- obtener el valor de la suma de su convencimiento.
-- Se debe devolver un candidato evaluado: (nombre, sumaCapacidades).
-- Si la suma es menor a 0 debe devolver 0.

-- 6)
-- Definir la función “elMejor/3” que dado dos elementos
-- y una operación define cuál es el mejor de los dos.
-- Se considera que un elemento es mejor que otro, si
-- la operación a ese elemento, éste tiene un mayor resultado
-- que el segundo. Se espera como resultado el elemento.
-- En caso de empate devuelve el primero.

-- 7)
-- Definir la función “votacion/2” que dada una cantidad
-- de votantes y una lista de candidatos devuelve una
-- nueva lista con el nombre del candidato y la cantidad
-- de votos que consiguió. La cantidad de votos se define por:
-- cantidadVotantes * convencimientoCandidato / totalConvencimientoDeTodosLosCandidatos.

-- 8)
-- 8.a)
-- “ganador/2”: Dada una cantidad de votantes y una lista
-- de candidatos, nos informa cuál fue el ganador de la elección
-- (sería el que tiene mayor proporción de votos).


-- 8.b)
-- “elMasFachero/1”: Dada una lista de candidatos es el que
-- tiene más facha (no importa que no esté entre las capacidades).

-- 8.c)
-- “elMasMolestoDeNombrar/1”: Es el candidato con
-- más letras en su nombre.