import Text.Show.Functions

sumateTres a b c = a + b + c
--sumateTres a = (\b -> (\c -> a + b + c))

sumateDos (a, b) = a + b

filtradosYMapeados xs = [2 * x | x <- xs, even x, x > 6]


----Se sabe que los bárbaros tienen nombre, fuerza, habilidades y objetos
type Habilidad = String
type Objeto = (Barbaro->Barbaro)

data Barbaro = Barbaro {
    nombre::String,
    fuerza:: Integer,
    habilidades::[Habilidad],
    objetos :: [Objeto]
} deriving  Show

dave = Barbaro { 
   nombre = "Dave", 
   fuerza =  100,
   habilidades = ["tejer","escribirPoesia"], 
   objetos = []
}
