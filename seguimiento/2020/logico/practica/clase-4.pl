% Longitud de una lista
% length([1,23,5], Longitud).

% Saber quienes son parte de una lista, saber si alguien es elemento de una lista
% Saber la suma de lsos elementos de una lista, o si la suma es de tal valor



%%% Volviendo al TEG

ocupa(argentina, magenta, 5).
ocupa(chile, negro, 3).
ocupa(brasil, amarillo, 8).
ocupa(uruguay, magenta, 5).
ocupa(alaska, amarillo, 7).
ocupa(yukon, amarillo, 1).
ocupa(canada, amarillo, 10).
ocupa(oregon, amarillo, 5).
ocupa(kamtchatka, negro, 6).
ocupa(china, amarillo, 2).
ocupa(siberia, amarillo, 5).
ocupa(japon, amarillo, 7).
ocupa(australia, negro, 8).
ocupa(sumatra, negro, 3).
ocupa(java, negro, 4).
ocupa(borneo, negro, 1).

estaEn(americaDelSur, argentina).
estaEn(americaDelSur, brasil).
estaEn(americaDelSur, chile).
estaEn(americaDelSur, uruguay).
estaEn(americaDelNorte, alaska).
estaEn(americaDelNorte, yukon).
estaEn(americaDelNorte, canada).
estaEn(americaDelNorte, oregon).
estaEn(asia, kamtchatka).
estaEn(asia, china).
estaEn(asia, siberia).
estaEn(asia, japon).
estaEn(oceania,australia).
estaEn(oceania,sumatra).
estaEn(oceania,java).
estaEn(oceania,borneo).

% Al principio de cada turno se incorporan ejércitos al mapa. Queremos saber cuántos ejércitos 
% puede incorporar un jugador. Es la suma de:
% la mitad de los países que ocupa (se redondea para abajo), ó 3 si no llega a los 6 países 
% lo que corresponda por cada continente ocupado por completo. Para cada continente se indica cuántos ejércitos aporta con un predicado ejercitosPorOcupar/2
    % ASIA . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 7 ejércitos 
    % EUROPA . . . . . . .. . . . . . . . . . . . . . . . . . . 5 ejércitos 
    % AMÉRICA DEL NORTE . . . . . . . . . . . . . . 5 ejércitos 
    % AMÉRICA DEL SUR . . . . . . . . . . . . . . . . . 3 ejércitos 
    % ÁFRICA . . . . . . . . . . . . . . . . . . . . . . . . . . 3 ejércitos 
    % OCEANÍA . . . . . . . . . . . . . . . . . . . . . . . . 2 ejércitos

jugador(Jugador):-ocupa(_, Jugador, _).

paisesOcupados(Jugador, TotalPaises):-
    jugador(Jugador),
    findall(
        Pais,
        ocupa(Pais, Jugador, _),
        Paises
        ),
    length(Paises, TotalPaises).


% natacion: estilo preferido, metros nadados, medallas
practica(gaston, natacion(pecho, 10)).
practica(ana, natacion(pecho, 1200, 1)).
practica(luis, natacion(perrito, 200, 0)).
practica(vicky, natacion(crawl, 800, 0)).
% fútbol: medallas, goles marcados, veces que fue expulsado
practica(deby, futbol(2, 15, 5, 100000)).
practica(mati, futbol(1, 11, 7, 980000)).
% rugby: posición que ocupa, medallas
practica(zaffa, rugby(pilar, 0)).
practica(sofi, polo(7)).

nadador(Nadador):-practica(Nadador, natacion(_,_,_)).
nadador(Nadador):-practica(Nadador, natacion(_, _)).

medallas(Deportista, Medallas):-
    practica(Deportista, Caracteristica),
    medallasSegunDeporte(Caracteristica, Medallas).

medallasSegunDeporte(
    natacion(_,_,Medallas),
    Medallas
).

medallasSegunDeporte(
    natacion(_, _),
    0
).

medallasSegunDeporte(
    futbol(Medallas, _, _, _),
    Medallas
).

medallasSegunDeporte(
    rugby(_, Medallas),
    Medallas
).

medallasSegunDeporte(basket(_, _, _), 0).

masMedallas(Deportista):-
    medallas(Deportista, Medallas),
    forall(
        (
            medallas(OtroDeportista, OtrasMedallas),
            OtroDeportista \= Deportista
        ),
        Medallas >= OtrasMedallas    
    ).

sinMedallas(Deportista):-
    not((
        medallas(Deportista, Medallas),
        Medallas > 0
    )).

buenDeportista(Deportista):-
    practica(Deportista, Caracteristica),
    buenaPractica(Caracteristica).

buenaPractica(natacion(_, Metros, _)):- Metros > 1000.
buenaPractica(natacion(_, Metros)):-Metros > 1000.
buenaPractica(futbol(_, Goles, Expulsiones, _)):- 
    Calculo is Goles - Expulsiones,
    Calculo > 5.
buenaPractica(rugby(wing, _)).
buenaPractica(rugby(pilar, _)).

buenaPractica(polo(Handicap)):-Handicap > 6.

% Agregar un par de jugadores de basket, que se conoce en que ligas jugo  y su edad
% un jugador de basket se considera que tiene una buena practica si jugo en al menos dos ligas 
% o si jugo en la nba
    % Agregar a manu que juega al basket, jugo en argentina, euroliga, nba 
    % la edad actual que tiene (42)

    % Agregar a mario que juega al basket, jugo solo en argentina, tiene 33 años

practica(manu, basket(42, [nba, euroliga, argentina], 10000000)).
practica(mario, basket(33, [argentina], 10000)).

buenaPractica(basket(_, Ligas, _)):-
    member(nba, Ligas).

buenaPractica(basket(_, Ligas, _)):-
    length(Ligas, Cantidad),
    Cantidad > 2.

% Cuantos nadadores hay
cuantosNadadoresTengo(Cantidad):-
    findall(
        Alguien
        , nadador(Alguien)
        , Nadadores
    ),
    length(Nadadores, Cantidad).


% Agregar el sueldo de cada uno de los deportistas
    % de los nadadores es proporcional a la cantidad medallas que tiene, 20k por c/medalla
    % de los futbolistas depende de c/u lo que haya firmado en su contrato pero le restan 1k por cada expulsion que tengan
    % a los rugbyers les pagan a todos un monto fijo de 3k
    % los de polo solo practican porque les gusta así que no les pagan.
    % los jugadores de basket es un monto base en el contrato y un bonus de 5k por c/liga en la que haya jugado.

% Saber cual es el monto que se gasta en deportes

gastosDeportivos(MontoTotal):-
    findall(
        Sueldo,
        (practica(_, Practica), sueldo(Practica,Sueldo))
        , Sueldos
    ),
    sum_list(Sueldos, MontoTotal)
    .

sueldo(natacion(_, _, Medallas), Sueldo):-
    Sueldo is Medallas * 20000.
sueldo(futbol(_, _, Expulsiones, Contrato), SueldoReal):-
    Sueldo is Contrato - 1000 * Expulsiones,
    max_member(SueldoReal, [0, Sueldo]).

sueldo(rugby(_, _), 3000).
sueldo(basket(_, Ligas, Contrato), Sueldo):-
    length(Ligas, CantidadLigas),
    Sueldo is Contrato + 5000 * CantidadLigas.

%% Saber si alguien cobra mas de un 1000000
%    practica(_, Practica),
%    sueldo(Practica, Sueldo),
%    Sueldo > 1000000

% un findall de todos los que cobran más de un millon y 
% el length de esa lista > 1 (no hace falta, error!!!)
