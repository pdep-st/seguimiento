module Library where
import PdePreludat

{-
1:
La de la izquierda es más declarativa ya que oculta el detalle algorítimico
usando delegación en las funciones f (atraccionesCopadas) y g (esCopada).
La de la derecha es más expresiva, ya que los nombres de las variables y funciones
describen la acción que realizan. Además, la función principal está tipada y usa aliases.
-}

-- 2:

sheremy = ("Sheremy", 16, 120) -- Nombre, Edad, Plata

plataGastada productos visitante = comprar (productosQueGustan visitante productos)

productosQueGustan visitante productos = filter (gusta visitante) productos

gusta visitante producto = costo producto < (0.1 * plata visitante)
comprar productos = sum (costoTotal productos)
costoTotal productos = map costo productos

plataGastada' productos visitante = 
    (sum . map costo . filter (\producto -> costo producto < (0.1 * plata visitante))) productos

-- 3:
{-
Tenemos dos parques de diversiones, uno que te hace gastar 10 dólares (el fantasticoFineastico)
y otro que te hace gastar 1000 (disni).
También tenemos un nobleinador, que agrega “Sir” al nombre y
una máquina del tiempo que le agrega 5 años a la persona que la use
(sabemos que hay otras máquinas del tiempo, pero todavía no las confiscamos).
-}
parqueDeDiversiones :: Number -> Persona -> Persona
parqueDeDiversiones costoEntrada persona = gastarPlata costoEntrada persona
nobleinador :: Persona -> Persona
nobleinador persona = agregarAlNombre "Sir " persona
maquinaDeTiempo :: Number -> Persona -> Persona
maquinaDeTiempo años persona = crecer años persona
fantasticoFineastico = parqueDeDiversiones 10
disni = parqueDeDiversiones 1000

inventos :: [Persona -> Persona]
inventos = [maquinaDeTiempo 5, nobleinador, fantasticoFineastico, disni]


{-
4:
Pará, no te apures. Ahora que terminaste de hacer eso, nos piden que registremos un nuevo invento
que acaban de confiscar. Se trata de la FLDSMDFR de Flint Loco (alto crossover).
La máquina te hace ganar 100 dólares si tu nombre es Flint.
Si tu nombre no es Flint 
 - y sos mayor de edad,te agrega “Loco” al nombre,
 - y si sos menor te hace crecer un año.
-}

fldsmdfr :: Persona -> Persona
fldsmdfr persona
    | nombre persona == "Flint" = ganarPlata 100 persona -- Asumo que ganarPlata funciona
    | esMayor persona = agregarAlNombre "Loco" persona
    | otherwise = crecer 1 persona

fldsmdfr' :: Persona -> Persona
fldsmdfr' ("Flint", edad, plata) = ganarPlata 100 ("Flint", edad, plata)
fldsmdfr' persona
    | esMayor persona = agregarAlNombre "Loco" persona
    | otherwise = crecer 1 persona

{-
5:
Nos comentan del servicio secreto que necesitamos poder calcular la efectividad de los agentes.
Nos dicen que este código funciona y es correcto pero algo huele mal…
¿Qué opinás del código? Cambiá lo que consideres necesario.
-}

efectividadCiudad :: [Agente] -> Number
efectividadCiudad agentes = 3 * (sum . map (length . habilidades) agentes)
efectividadSelva agentes = (sum . map ((2+) . length . nombre)) agentes
efectividadInternet agentes = 2 * (sum . map (edad . dueño) agentes)

efectividad :: (Agente -> Number) -> Number -> [Agente] -> Number
efectividad criterio multiplicador agentes = multiplicador * ((sum . map criterio) agentes)

efectividadCiudad' = efectividad (length . habilidades) 3
efectividadSelva' = efectividad ((2+) . length . nombre) 1
efectividadInternet' = efectividad (edad . dueño) 2

{-
6:
El problema es que este código no sirve. Nos interesa saber cómo queda Candase
después de vivir cada aventura secuencialmente.
Arreglar el código para representar ese comportamiento.
-}

type Aventura :: Persona -> Persona
veranear :: [Aventura] -> [Persona]
veranear aventuras = map (\aventura -> aventura candase) aventuras

veranear' :: [Aventura] -> Persona
veranear' aventuras = foldl (\persona aventura -> aventura persona) candase aventuras

veranear'' aventuras = foldl vivirAventura candase aventuras
vivirAventura :: a -> (a -> b) -> b
--($)         :: (a -> b) -> a -> b
--flip ($)    :: a -> (a -> b) -> b
vivirAventura persona aventura = aventura persona

veranear''' aventuras = foldl (flip ($)) candase aventuras

flip' f b a = f a b

{-
7:
El verano vuela… o no tanto, después de 2 millones de episodios las aventuras son casi infinitas.
Nos preguntan, mirando el código original del punto anterior, qué pasaría con estas consultas:

veranoPiola = map aventuraCopada [1..]

> a) veranear veranoPiola -> Bonus: ¿Qué pasa para tu solución?
Diverge (para ambas)
> b) take 10000 (veranear veranoPiola)
Converge, gracias a evaluación diferida sólo se generan 10.000 candase en el map
> c) any esFeliz (veranear veranoPiola)
Converge si y sólo si candase esFeliz después de al menos una aventura, si no, diverge
> d) filter esMayorDeEdad (veranear veranoPiola)
Diverge
-}

{-
8:
Antes de terminar el día, nos piden que evaluemos qué posibles valores podemos ejecutar
en este hermoso y prolijo código. En los casos que no se pueda, indicar qué parámetro
es el que no se admite.
a) f (>3) even [(+5), 1] 30 -> No vale por el x, tiene que ser tupla (y la lista no es válida)
b) f (\v -> foldl max v [1..10]) (/3) ((+2), []) 5 -> Vale
c) f (<1) odd ((*8), [1,2,”hola”]) 15 -> No vale, rompe por tipos la lista
d) f (+5) length ((++ “cool”), 21) “pepita” -> Vale
e) f (*3) (**2) ((+2), “hola”) 21 -> Vale
f) f (*0.2) (+) (id, 1.1) 20 -> No vale por el (+), ya que no retorna un Ord cuando se aplica h1
-}
f :: Ord a => (Number -> a) -> (h1 -> a) -> ((y -> h1), x2) -> y -> Bool
f g h x y = (h . fst x) y > g 100
