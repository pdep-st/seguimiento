## Pattern Matching Sobre Listas

1. Hacer una función _tomarN :: Integer -> [a] -> [a]_ que dado un natural n y una lista
l, devuelve los primeros n elementos de l. En caso de que l tenga menos de n elementos, la lista
devuelta debe contener todos los elementos de l. (no usar take)

2. Hacer una función _sumaDeListas :: [Integer] -> [Integer] -> [Integer]_ que
dadas dos listas de enteros l1 y l2 devuelve la lista de sus sumas. En caso de que l1 y l2 no tengan la
misma longitud, la lista devuelve debe tener la longitud de la más larga de ambas.

3. Hacer una función _unoMasDosIgualTres :: [Integer] -> Bool_ que dada una lista l
devuelva True si la suma de sus dos primeros elementos es igual al tercer elemento y False en
caso contrario.

4. Hacer una función _listasIguales :: [a] -> [a] -> Bool_ que determine si dos listas
tienen exactamente los mismos elementos en el mismo orden.

5. Hacer una función _cantidadDeApariciones :: a ->[a] ->Integer_ que dado un elemento x y una lista l retorne la cantidad de apariciones de x en l.
