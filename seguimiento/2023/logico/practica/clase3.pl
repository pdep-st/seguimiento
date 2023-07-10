% Messi nació el 24/06/1987

nacio(messi, fecha(1987, 06, 24)).
nacio(cape, fecha(2002, 05, 28)).

% Nació messi? ? - nacio(messi, _, _, _). ? - nacio(messi, _).
% Cuándo nació una persona? ? - nacio(Persona, Anio, Mes, Dia). ? - nacio(Persona, Fecha).
% Qué año nació messi? ? - nacio(messi, Anio, _, _). ? - nacio(messi, fecha(Anio, _, _)).

/*
Anto Roccuzzo, cliente número 99102, compró una TV de 80' pagando 200.000
Mateo Messi, cliente número 3, compró heladera con freezer y 2 puertas pagando 300.000
Fideo Di María, cliente 11, compró una TV de 40' a 80.000
*/
cliente(99102, "Anto Roccuzzo").
cliente(3, "Mateo Messi").
cliente(11, "Fideo Di María").
cliente(9, "Kun Agüero").

compro(99102, tv(80), 200000).
compro(3, heladera(freezer, 2), 300000).
compro(11, tv(40), 80000).

compro(11, ventilador, 50000).

% Qué clientes hicieron compras?
% ? - compro(Cliente, _, _, _).
% Qué productos fueron comprados por más de 100.000?
% ? - compro(_, Producto, Precio), Precio > 100000.
% Existe alguna tv de 80'?
% ? - compro(_, tv(80), _).

% Y si el Kun Agüero cliente 9 compra una tv de 90' 4K a 1.000.000?
compro(9, tv4k(90), 1000000).

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
nadador(Nombre):- practica(Nombre, natacion(_, _, _)).

% Medallas obtenidas
medallas(Persona, Medallas):-
    practica(Persona, Deporte),
    medallasPorDeporte(Deporte, Medallas).

medallasPorDeporte(natacion(_, _, Medallas), Medallas).
medallasPorDeporte(futbol(Medallas, _, _), Medallas).
medallasPorDeporte(rugby(_, Medallas), Medallas).

% ¿Quién tiene más medallas que el resto?
elMasGanador(Ganador):-
    medallas(Ganador, MedallasGanador),
    forall(
        (
            medallas(Persona, MedallasPersona),
            Persona \= Ganador
        ),
        MedallasGanador > MedallasPersona
    ).

elOLosMasGanadores(Ganador):-
    medallas(Ganador, MedallasGanador),
    forall(
        medallas(_, MedallasPersona),
        MedallasGanador >= MedallasPersona
    ).

% ¿Quién no tiene aún medallas?


/* 
Buen deportista
Quiero saber si alguien es buen deportista
en el caso de la natación, si recorren más de 1.000 metros diarios o su estilo preferido es el crawl
en el caso del fútbol, si la diferencia de goles menos las expulsiones es más de 5
en el caso del rugby, si son wings o pilares
*/

buenDeportista(Deportista):-
    practica(Deportista, Deporte),
    buenDeporte(Deporte).

buenDeporte(natacion(_, Metros, _)):-
    Metros > 1000.

buenDeporte(natacion(crawl, _, _)).

buenDeporte(futbol(_, Goles, Expulsiones)):- 
    Diferencia is Goles - Expulsiones,
    Diferencia > 5.

buenDeporte(rugby(wing, _)).
buenDeporte(rugby(pilar, _)).

/* 
    y si agregamos el polo que solo sabemos el handicap del jugador, 
    y es bueno si tiene un handicap mayor a 6
    no tiene medallas
*/
practica(julieta, polo(8)).

buenDeporte(polo(Handicap)):- Handicap > 6.

% suma/2
% incrementar/1
siguiente(N, N+1).