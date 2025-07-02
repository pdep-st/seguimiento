% Messi nació el 24/06/1987
nacio(messi, fecha(24, 06, 1987)).
nacio(evilMessi, no).

% Nació messi?
% Cuándo nació una persona?

/*
Anto Roccuzzo, cliente número 99102, compró una TV de 80' pagando 200.000
Mateo Messi, cliente número 3, compró heladera con freezer y 2 puertas pagando 300.000
Fideo Di María, cliente 11, compró una TV de 40' a 80.000
*/
% compro(Persona, Producto, Costo).
compro(anto, tv(80), 200000).
compro(mateo, heladera(conFreezer, 2), 300000).
compro(fideo, tv(40), 80000).

% Qué clientes hicieron compras?
% ? - compro(Quien, _, _).
% Qué productos fueron comprados por más de 100.000?
% ? - compro(_, Producto, Precio), Precio > 100000.
% Existe alguna tv de 80'?
% ? - compro(_, tv(80), _).

/* 
para la natación sabemos el estilo preferido, 
la cantidad de metros diarios que recorre, 
y la cantidad de medallas que consiguió a lo largo
de su carrera deportiva
para el fútbol conocemos las medallas, 
los goles convertidos y las veces que fue expulsado
para el rugby, queremos saber 
la posición que ocupa y luego la cantidad de medallas obtenidas
*/

% natacion: estilo preferido, metros nadados, medallas
practica(phelps, natacion(crawl, 5000, 35)).
practica(juan, natacion(pecho, 500, 0)).
% fútbol: medallas, goles marcados, veces que fue expulsado
practica(messi, futbol(30, 820, 4)).
practica(cape, futbol(0, 36, 0)).
% rugby: posición que ocupa, medallas
practica(pichot, rugby(mariscal, 1)).
practica(pablito, rugby(wing, 0)).
practica(falsoPhelps, rugby(nadador, 34)).


% Quiénes son nadadores
nadador(Deportista):- 
    practica(Deportista, natacion(_, _, _)).

% Medallas obtenidas
medallas(Deportista, Cantidad):-
    practica(Deportista, Deporte),
    medallasDeporte(Deporte, Cantidad).

medallasDeporte(natacion(_, _, Cantidad), Cantidad).
medallasDeporte(futbol(Cantidad, _, _), Cantidad).
medallasDeporte(rugby(_, Cantidad), Cantidad).


% ¿Quién tiene más medallas que el resto?
/*
Para el deportista que estoy mirando, se cumple que
para todos los otros deportistas, tienen menos medallas que éste.
Sólo puede haber un mejor, y si no, no hay
*/
elMejor(Deportista):-
    medallas(Deportista, Medallas),
    forall(
        (medallas(OtroDeportista, OtrasMedallas), OtroDeportista \= Deportista),
        Medallas > OtrasMedallas
    ).

% ¿Quién no tiene aún medallas?


/* 
Buen deportista
Quiero saber si alguien es buen deportista
en el caso de la natación, si recorren más de 1.000 metros diarios o
    su estilo preferido es el crawl
en el caso del fútbol, si la diferencia de goles menos las expulsiones es más de 5
en el caso del rugby, si son wings o pilares
*/

buenDeportista(Deportista):-
    practica(Deportista, Deporte),
    buenDeporte(Deporte).

buenDeporte(natacion(_, Metros, _)):- Metros > 1000.
buenDeporte(natacion(crawl, _, _)).
buenDeporte(futbol(_, Goles, Expulsiones)):-
    Indice is Goles - Expulsiones,
    Indice < 5.
buenDeporte(rugby(wing, _)).
buenDeporte(rugby(pilar, _)).


miPredicadoLoco(Algo, Algo).

/* 
y si agregamos el polo que solo sabemos el handicap del jugador, 
y es bueno si tiene un handicap mayor a 6
no tiene medallas
*/


% suma/2
% incrementar/1