% Messi nació el 24/06/1987
jugador(messi).

% nacio(messi, 24, 6, 1987).
nacio(messi, fecha(24, 6, 1987)).
nacio(jesus, fecha(25, 12, 0)).

% Nació messi? nacio(messi, _, _, _). -> nacio(messi, _).
% Cuándo nació una persona? nacio(Persona, Dia, Mes, Anio). -> nacio(Persona, Fecha).


/*
Anto Rocuzzo, cliente número 99102, compró una TV de 80' pagando 200.000
Mateo Messi, cliente número 3, compró heladera con freezer y 2 puertas pagando 300.000
Fideo Di María, cliente 11, compró una TV de 40' a 80.000
*/
% compro(anto, 99102, tv, 80, 200000).
compro(cliente(99102, "Anto Rocuzzo"), tv(80, led), 200000).
% compro(mateo, 3, heladera, true, 2, 300000).
compro(cliente(3, "Mateo Messi"), heladera(true, 2), 300000).
compro(cliente(11, "Fideo Di María"), tv(40, oled), 80000).
compro(cliente(9, "Kun Agüero"), tv(30, led), 80000).
compro(cliente(11, "Fideo Di María"), ventilador, 1000).
% Qué clientes hicieron compras?
% ? - compro(Cliente, _, _).
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

% natacion: estilo preferido, metros nadados por día, medallas
practica(phelps, natacion(pecho, 5000, 30)).
practica(miguel, natacion(crawl, 500, 0)).
% fútbol: medallas, goles marcados, veces que fue expulsado
practica(messi, futbol(1, 700, 4)).
practica(inia, futbol(0, 5, 20)).
% rugby: posición que ocupa, medallas
practica(porta, rugby(wing, 2)).
% billar: no hay medallas
practica(martin, billar).


% Quiénes son nadadores
nadador(Persona):- practica(Persona, natacion(_, _, _)).

% Medallas obtenidas
medallas(Deportista, Medallas):-
    practica(Deportista, Deporte),
    medallasPorDeporte(Deporte, Medallas).

medallasPorDeporte(natacion(_, _, Medallas), Medallas).
medallasPorDeporte(futbol(Medallas, _, _), Medallas).
medallasPorDeporte(rugby(_, Medallas), Medallas).
medallasPorDeporte(billar, 0).

medallasV2(Deportista, Medallas):-
    practica(Deportista, natacion(_,_,Medallas)).

medallasV2(Deportista, Medallas):-
    practica(Deportista, futbol(Medallas, _, _)).

medallasV2(Deportista, Medallas):-
    practica(Deportista, rugby(_, Medallas)).

medallasV2(Deportista, 0):-
    practica(Deportista, billar).

% ¿Quién tiene más medallas que el resto?

elMejor(Deportista):-
    medallas(Deportista, Medallas),
    forall(
        (medallas(OtroDeportista, MedallasDeOtro), OtroDeportista \= Deportista),
        Medallas > MedallasDeOtro
    ).

% ¿Quién no tiene aún medallas?
noTieneMedallas(Deportista):-
    not((medallas(Deportista, Medallas), Medallas > 0)).

/* 
Buen deportista
Quiero saber si alguien es buen deportista
en el caso de la natación, si recorren más de 1.000 metros diarios o su estilo preferido es el crawl
en el caso del fútbol, si la diferencia de goles menos las expulsiones es más de 5
en el caso del rugby, si son wings o pilares
*/

buenDeportista(Deportista):-
    practica(Deportista, Deporte),
    buenoEn(Deporte).

buenoEn(natacion(_, Metros, _)):-
    Metros > 1000.

buenoEn(natacion(crawl, _, _)).

buenoEn(futbol(_, Goles, Expulsiones)):-
    Diferencia is Goles - Expulsiones,
    Diferencia > 5.

buenoEn(rugby(wing,_)).

buenoEn(rugby(pilar,_)).    

/* 
    y si agregamos el polo que solo sabemos el handicap del jugador, 
    y es bueno si tiene un handicap mayor a 6
    no tiene medallas
*/


% suma/3
% incrementar/1 -> XXXXXXX
% incrementar/2 -> dedito arriba

suma(X, Y, Resultado):- Resultado is X + Y.

incrementar(X, Y):- Y is X +1.