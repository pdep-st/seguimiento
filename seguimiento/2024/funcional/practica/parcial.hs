import Text.Show.Functions
import Data.List

-- https://docs.google.com/document/d/1xeGnf0fcNusnc6RQfzmbXrnzo8_dtc2PUDSexym7x-Q/edit?tab=t.0

data Persona = Persona {
    nombre:: String,
    edad:: Float,
    felicidad:: Float,
    estres:: Float,
    guita:: Float,
    habilidades:: [Habilidad]
} deriving Show

-- 1
anabel = Persona {
    nombre = "Anabel",
    edad = 21,
    felicidad = 60,
    estres = 15,
    guita = 19,
    habilidades = [cocinar]
}

bruno = Persona {
    nombre = "Bruno",
    edad = 15,
    felicidad = 90,
    estres = 5,
    guita = 0,
    habilidades = [compartirCasaCon anabel]
}

clara = Persona {
    nombre = "Clara",
    edad = 31,
    felicidad = 10,
    estres = 90,
    guita = 25,
    habilidades = [cocinar, trabajarEn "Docencia", compartirCasaCon bruno, cocinar]
}

personas = [anabel, bruno, clara]

-- 2

jovenesAdultos = filter esJovenAdulto

esJovenAdulto = edadEntre 18 30

edadEntre minimo maximo persona = edad persona >= minimo && edad persona <= maximo

-- 3
type Habilidad = Persona -> Persona

alterarEstado persona cambioFelicidad cambioEstres cambioGuita =
    persona {
        felicidad = felicidad persona + cambioFelicidad,
        estres = estres persona + cambioEstres,
        guita = guita persona + cambioGuita
    }

cocinar:: Habilidad
cocinar persona = alterarEstado persona 5 (-4) 0

tenerMascota:: Habilidad
tenerMascota persona = alterarEstado persona 20 (estresPorTenerMascota persona) (-5)

estresPorTenerMascota persona
    | tieneMuchaGuita persona = -10
    | otherwise = 5

tieneMuchaGuita = (>=60).guita

trabajarEn:: String -> Habilidad
trabajarEn "Software" persona = alterarEstado persona 0 10 20
trabajarEn "Docencia" persona = alterarEstado persona 0 30 0
trabajarEn _ persona = alterarEstado persona 0 5 5

compartirCasaCon:: Persona -> Habilidad
compartirCasaCon cohabitante persona =
    alterarEstado persona 5 (estresPorCompartir cohabitante persona) (guitaPorCompartir cohabitante persona)


estresPorCompartir cohabitante persona = ((/2) . abs) (estres cohabitante - estres persona)
guitaPorCompartir cohabitante persona
    | tieneMas guita cohabitante persona = 10
    | otherwise = 0

-- 4
aprenderHabilidad persona nuevaHabilidad = 
    olvidarHabilidades . (sumarHabilidad nuevaHabilidad) $ persona

sumarHabilidad nuevaHabilidad persona = persona {
    habilidades = (habilidades persona) ++ [nuevaHabilidad]
}

olvidarHabilidades persona = persona {
    habilidades = drop (habilidadesSobreLimite persona) (habilidades persona)
}

habilidadesSobreLimite persona =
    max 0 ((length . habilidades $ persona) - limiteHabilidades persona)

limiteHabilidades persona
    | esNiño persona = 3
    | esJovenAdulto persona = 6
    | otherwise = 4

esNiño = (<18) . edad

-- 5
valeLaPenaAprender habilidad persona =
    aumentaFelicidadOGuita (habilidad persona) persona

aumentaFelicidadOGuita personaDespues personaAntes =
    tieneMas guita personaDespues personaAntes ||
    tieneMas felicidad personaDespues personaAntes

tieneMas estado persona otraPersona =
    estado persona > estado otraPersona

-- 6
cursoIntensivo habilidades persona = foldl aprenderHabilidad persona habilidades

-- 7
felizCumple = olvidarHabilidades . cumplirUnAnio

cumplirUnAnio persona = persona {
    edad = edad persona + 1
}