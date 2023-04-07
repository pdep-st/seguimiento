nombre = "Iñaki"
edad = 25

elMaximoEntre4y5 = max 4 5

aprobo nota = nota >= 6

promociona :: Int -> Int -> Int -> Bool
promociona notaFuncional notaLogico notaObjetos =
    notaFuncional >= 8 && notaLogico >= 8 && notaObjetos >= 8

doble numero = numero * 2

cuadruple numero = doble (doble numero)