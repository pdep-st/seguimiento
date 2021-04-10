import Text.Show.Functions()

data Persona = Persona {
  nombre :: String,
  peso :: Float
} deriving Show

type Comida = (String, Float)
hamburguesa :: Comida
hamburguesa = ("hamburguesa", 200)
lechuga :: Comida
lechuga = ("lechuga", 1)
milanga :: Comida
milanga = ("milanesa", 130)

gramos :: Comida -> Float
gramos (_, gr) = gr

comer :: Comida -> Accion
comer comida persona = persona { peso = peso persona + gramos comida }
-- comerMenu :: Persona -> [Comida] -> Persona
comerMenu persona menu = 
  foldl (\persona comida -> comer comida persona) persona menu 

-- foldl (flip comer) persona menu
-- foldr comer persona menu

ejercicio :: Accion
ejercicio persona = persona { peso = peso persona - 100}

type Accion = Persona -> Persona
-- hacerCosas martin [ ejercicio, comer lechuga ]
-- hacerCosas :: Persona -> [Accion] -> Persona
hacerCosas persona acciones = 
  foldl (\persona accion -> accion persona) persona acciones
--foldr (\accion persona -> accion persona) persona acciones
--foldr (\accion persona -> ($) accion persona) persona acciones
--foldr ($) persona acciones
--foldl (flip ($)) persona acciones

-- ($) :: (a -> b) -> a -> b
-- ($) f x = f x 

-- todosLosNombres :: [Persona] -> String
gaston = Persona { nombre = "gaston", peso = 10000}
martin = Persona { nombre = "martin", peso = 9000}

agregarComa "" palabra = palabra
agregarComa concatenado palabra = concatenado  ++ "," ++ palabra

todosLosNombres personas = 
  foldl (\nombresConcatenados persona -> 
     agregarComa nombresConcatenados (nombre persona)) 
  "" personas

