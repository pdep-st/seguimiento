% Messi nació el 24/06/1987

% nacio(Persona, Fecha)
% Functores
nacio(messi, fecha(24, 06, 1987)).
nacio(bauti, fecha(11, 09, 2003)).
nacio(inia, fecha(24, 06, 1997)).

elMasGrande(messi).
% Nació messi? ? - nacio(messi, _).
% Cuándo nació una persona? ? - nacio(messi, Fecha). (ó nacio(messi, fecha(Dia, Mes, Anio)).)
% Qué año nació messi? ? - nacio(messi, fecha(_, _, Anio)).

/*
Anto Roccuzzo, cliente número 99102, compró una TV de 80' pagando 200.000
Mateo Messi, cliente número 3, compró heladera con freezer y 2 puertas pagando 300.000
Fideo Di María, cliente 11, compró una TV de 40' a 80.000
*/

/* Tiene aridad distinta
compro(anto, 99102, tv, 80, 200000).
compro(mateo, 3, heladera, tieneFreezer, 2, 300000).
compro(fideo, 11, tv, 40, 80000).
*/

% compro(Cliente, Producto, Monto).
compro(cliente(anto, 99102), tv(80, led), 200000).
compro(cliente(mateo, 3), heladera(tieneFreezer, 2), 300000).
compro(cliente(fideo, 11), tv(40, oled), 80000).
compro(cliente(garnacho, 7), sillon(3), 50000).

% Qué clientes hicieron compras?
% ? - compro(Cliente, _, _).
% Qué productos fueron comprados por más de 100.000?
% ? - compro(_, Producto, Monto), Monto > 100000.
% Existe alguna tv de 80'?
% ? - compro(_, tv(80), _).

% Y si el Kun Agüero cliente 9 compra una tv de 90' 4K a 1.000.000?

compro(cliente(kun, 9), tv(90, cuatroK), 1000000).

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

% polo: handicap
practica(cambiasso, polo(10)).


% Quiénes son nadadores
nadador(Deportista) :- practica(Deportista, natacion(_,_,_)).

% Medallas obtenidas
medallasObtenidas(Deportista, Medallas) :- 
    practica(Deportista, Deporte),
    medallasDeporte(Deporte, Medallas).

medallasDeporte(natacion(_, _, Medallas), Medallas).
medallasDeporte(futbol(Medallas, _, _), Medallas).
medallasDeporte(rugby(_, Medallas), Medallas).



% ¿Quién tiene más medallas que el resto?
masMedallas(Deportista) :- 
    medallasObtenidas(Deportista, Medallas),
    forall(
        medallasObtenidas(_, OtrasMedallas),
        Medallas >= OtrasMedallas
    ).


% ¿Quién no tiene aún medallas?
noTieneMedallas(Deportista) :- medallasObtenidas(Deportista, 0).
noTieneMedallas(Deportista) :- 
    practica(Deportista,_),
    not(medallasObtenidas(Deportista, _)).

/* 
Buen deportista
Quiero saber si alguien es buen deportista
en el caso de la natación, si recorren más de 1.000 metros diarios o su estilo preferido es el crawl
en el caso del fútbol, si la diferencia de goles menos las expulsiones es más de 5
en el caso del rugby, si son wings o pilares
*/

/* 
    y si agregamos el polo que solo sabemos el handicap del jugador, 
    y es bueno si tiene un handicap mayor a 6
    no tiene medallas
*/

buenDeportista(Deportista) :-
    practica(Deportista, Deporte),
    buenDeporte(Deporte).

buenDeporte(natacion(_, Metros, _)) :-
    Metros > 1000.

buenDeporte(natacion(crawl, _, _)).

buenDeporte(futbol(_, Goles, Expulsiones)) :-
    Diferencia is Goles - Expulsiones,
    Diferencia > 5.


buenDeporte(rugby(wing,_)).
buenDeporte(rugby(pilar,_)).