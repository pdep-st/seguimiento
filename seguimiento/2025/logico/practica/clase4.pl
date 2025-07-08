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
% un jugador de basket se considera que es una buena práctica si jugó en al menos dos ligas 
% o si jugó en la nba (y si también es buena si juega en la euroliga?)
% o si tiene más de 40 años
    % Agregar a manu que juega al basket, jugó en argentina, euroliga, nba 
    % la edad actual que tiene (45)
    % Agregar a mario que juega al basket, jugo solo en argentina, tiene 33 años


% Cuántos nadadores hay?


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


% ¿Cuántos países ocupa un jugador?


% ¿Cuántos países están cargados? Un país está cargado cuando tiene más de 7 fichas.


% ¿Qué jugadores ocupan países con más de 5 fichas?


% Cuántas fichas tiene cada jugador?

    

% Está armado un jugador cuando tiene dos países o más con al menos 6 fichas



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