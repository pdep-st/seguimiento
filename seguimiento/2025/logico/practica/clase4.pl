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

practica(valentina, billar).

/* 
y si agregamos el polo que solo sabemos el handicap del jugador, 
y es bueno si tiene un handicap mayor a 6
no tiene medallas
*/
practica(cambiasso, polo(10)).

% Medallas obtenidas
medallas(Deportista, Cantidad):-
    practica(Deportista, Deporte),
    medallasDeporte(Deporte, Cantidad).

medallasDeporte(natacion(_, _, Cantidad), Cantidad).
medallasDeporte(futbol(Cantidad, _, _), Cantidad).
medallasDeporte(rugby(_, Cantidad), Cantidad).
medallasDeporte(polo(_), 0).

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
buenDeporte(polo(Handicap)):- Handicap > 6.

% Agregar un par de jugadores de basket, que se conoce en qué ligas jugó y su edad
% un jugador de basket se considera que es una buena práctica si
% jugó en al menos dos ligas 
% o si jugó en la nba (y si también es buena si juega en la euroliga?)
% o si tiene más de 40 años
    % Agregar a manu que juega al basket, jugó en argentina, euroliga, nba
    % la edad actual que tiene (46)
practica(manu, basket([nba, euroliga, argentina], 46)).
    % Agregar a mario que juega al basket, jugo solo en argentina, tiene 33 años
practica(mario, basket([argentina], 33)).

buenDeporte(basket(Ligas, _)):-
    length(Ligas, CantidadLigas),
    CantidadLigas >= 2.
    % jugo(Deportista, Liga),
    % jugo(Deportista, OtraLiga),
    % Liga \= OtraLiga.

buenDeporte(basket(Ligas, _)):-
    member(nba, Ligas).
    % jugo(Deportista, nba).

buenDeporte(basket(_, Edad)):-
    Edad > 40.

/*
jugo(manu, nba).
jugo(manu, euroliga).
jugo(manu, argentina).
jugo(mario, argentina).
*/

% Cuántos nadadores hay?
nadador(Deportista):-practica(Deportista,natacion(_,_,_)).

cuantosNadadores(Cantidad):-
    findall(
        Nadador,
        nadador(Nadador),
        Nadadores),
    length(Nadadores,Cantidad).


%%% Jugando al TEG

ocupa(argentina, magenta, 5).
ocupa(chile, negro, 3).
ocupa(brasil, amarillo, 8).
ocupa(uruguay, magenta, 5).
ocupa(alaska, amarillo, 7).
ocupa(yukon, amarillo, 1).
ocupa(canada, amarillo, 10).
ocupa(oregon, amarillo, 5).
ocupa(kamtchatka, negro, 5).
ocupa(china, amarillo, 2).
ocupa(siberia, amarillo, 5).
ocupa(japon, amarillo, 7).
ocupa(australia, negro, 8).
ocupa(sumatra, negro, 3).
ocupa(java, negro, 4).
ocupa(borneo, negro, 1).

jugador(Jugador):- ocupa(_, Jugador, _).

% ¿Cuántos países ocupa un jugador?

ocupaJugador(Jugador, Cantidad) :-
    jugador(Jugador),
    findall(
        Pais,
        ocupa(Pais, Jugador, _),
        Paises
        ),
    length(Paises, Cantidad).

% ¿Cuántos países están cargados? Un país está cargado cuando tiene más de 7 fichas.

estaCargado(Pais):-
    ocupa(Pais, _, Fichas),
    Fichas>7.

cuantosPaisesCargados(Cantidad):-
    findall(
        Pais,
        estaCargado(Pais),
        Paises
        ),
    length(Paises, Cantidad).

% ¿Qué jugadores ocupan países con más de 5 fichas?

ocupaConMasDe5Fichas(Jugador):- 
    ocupa(_, Jugador, Fichas),
    Fichas > 5.

% Cuántas fichas tiene cada jugador?

cuantasFichas(Jugador, Cantidad):-
    jugador(Jugador),
    findall(
        Fichas,
        ocupa(_, Jugador, Fichas),
        FichasTotales
        ),
    sum_list(FichasTotales, Cantidad).
    

% Está armado un jugador cuando tiene dos países o más con al menos 6 fichas

paisArmado(Pais) :-
    ocupa(Pais, _, Fichas),
    Fichas >= 6.

estaArmado(Jugador):-
    ocupa(Pais, Jugador, _), paisArmado(Pais),
    ocupa(OtroPais, Jugador, _), paisArmado(OtroPais),
    Pais \= OtroPais. 

% Al principio de cada turno se incorporan ejércitos al mapa. Queremos saber cuántos ejércitos 
% puede incorporar un jugador. Es la suma de:
% la mitad de los países que ocupa (se redondea para abajo), ó 3 si no llega a los 6 países 
% lo que corresponda por cada continente ocupado por completo.
% Para cada continente se indica cuántos ejércitos aporta con un predicado ejercitosPorOcupar/2
    % ASIA . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 7 ejércitos 
    % EUROPA . . . . . . .. . . . . . . . . . . . . . . . . . . 5 ejércitos 
    % AMÉRICA DEL NORTE . . . . . . . . . . . . . . 5 ejércitos 
    % AMÉRICA DEL SUR . . . . . . . . . . . . . . . . . 3 ejércitos 
    % ÁFRICA . . . . . . . . . . . . . . . . . . . . . . . . . . 3 ejércitos 
    % OCEANÍA . . . . . . . . . . . . . . . . . . . . . . . . 2 ejércitos
