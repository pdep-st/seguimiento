ingrediente(cupcake, harina(165, reposteria)).
ingrediente(cupcake, mantequilla(sinSal, 165)).
ingrediente(cupcake, azucar(165)).
ingrediente(cupcake, leche).
ingrediente(cupcake, huevos(3)).

ingrediente(muffin, harina(150,leudante)).
ingrediente(muffin, manteca(sinSal, 160)).
ingrediente(muffin, miel).

ingredienteSimilar(mantequilla, manteca).
ingredienteSimilar(mantequilla, margarina).
ingredienteSimilar(azucar, miel).

participante(juan).
participante(susana).

suministro(juan, harina(200, trigo)).
suministro(juan, mantequilla(conSal, 200)).
suministro(juan, azucar(1000)).
suministro(juan, leche).
suministro(juan, huevos(12)).

suministro(susana, harina(200, reposteria)).
suministro(susana, mantequilla(sinSal, 200)).
suministro(susana, azucar(1000)).
suministro(susana, huevos(12)).

%%%% PTO 1
suministro(Persona, manteca):-participante(Persona).

hizo(juan, cupcake).
hizo(juan, torta).
hizo(susana, muffins).

%%%% PTO 2

tieneSuficiente(Persona, Ingrediente):-
    suministro(Persona, Suministro),
    tengoSuficiente(Suministro, Ingrediente).

tengoSuficiente(harina(Cantidad, _), harina(CantidadNecesaria, _)):-Cantidad >= CantidadNecesaria.
tengoSuficiente(mantequilla(_, Cantidad), mantequilla(_, CantidadNecesaria)):-Cantidad >= CantidadNecesaria.
tengoSuficiente(azucar(Cantidad), azucar(CantidadNecesaria)):-Cantidad >= CantidadNecesaria.
tengoSuficiente(huevos(Cantidad), huevos(CantidadNecesaria)):-Cantidad >= CantidadNecesaria.
tengoSuficiente(leche, leche).

%% PTO 3

receta(Receta):-ingrediente(Receta, _).

puedeHacerReceta(Persona, Receta):-
    receta(Receta),
    suministro(Persona, manteca),
    forall(ingrediente(Receta, Ingrediente), tieneSuficiente(Persona, Ingrediente)).


% PTO 4
esUnDesafio(Persona, Receta):-
    receta(Receta), 
    participante(Persona),
    not(hizoSimilar(Persona, Receta)).

hizoSimilar(Persona, Receta):-
    hizo(Persona, OtraReceta),
    recetaSimilares(OtraReceta, Receta).

recetaSimilares(Receta, OtraReceta):-
    receta(Receta), receta(OtraReceta), Receta \= OtraReceta,
    findall(Ingrediente, (
        ingrediente(Receta, Ingrediente), 
        ingrediente(OtraReceta, OtroIngrediente), 
        similar(Ingrediente, OtroIngrediente) 
    ), Similares),
    length(Similares, Total), Total >= 3.

similar(Ingrediente, OtroIngrediente):-
   nombre(Ingrediente, Nombre), nombre(OtroIngrediente, Nombre).

similar(Ingrediente, OtroIngrediente):-
   nombre(Ingrediente, Nombre), nombre(OtroIngrediente, OtroNombre),
   ingredienteSimilar(Nombre, OtroNombre).

nombre(Ingrediente, Nombre):-functor(Ingrediente, Nombre, _).

%% PTO 6
felicidadDeComer(Participante, Receta, Felicidad):-
    felicidadIngredientes(Receta, FelicidadIngredientes),
    felicidadDePractica(Participante,Receta, FelicidadPorPractica),
    Felicidad is FelicidadIngredientes + FelicidadPorPractica.

felicidadDePractica(Participante, Receta, 0):- not(hizo(Participante, Receta)).
felicidadDePractica(Participante, Receta, 100):- hizo(Participante, Receta).

felicidadIngredientes(Receta, Felicidad):-
    findall(Felicidad, (ingrediente(Receta, Ingrediente), felicidad(Ingrediente, Felicidad)), Felicidades),
    sum_list(Felicidades, Felicidad).

felicidad(Ingrediente, Felicidad):- gramos(Ingrediente, Felicidad).

gramos(harina(Gramos, _), Gramos).
gramos(mantequilla(_, Gramos), Gramos).
gramos(azucar(Gramos), Gramos).

distanciaDeSimilaridad(Receta, OtraReceta, 1):-recetaSimilares(Receta, OtraReceta).
distanciaDeSimilaridad(Receta, OtraReceta, Distancia):-
    recetaSimilares(Receta, RecetaIntermedia),
    distanciaDeSimilaridad(RecetaIntermedia, OtraReceta, DistanciaIntermedia),
    Distancia is 1 + DistanciaIntermedia. 

remotamenteSimilar(Receta, OtraReceta):-
    distanciaDeSimilaridad(Receta, OtraReceta, Distancia),
    Distancia < 7.