% Longitud de una lista

% Saber quienes son parte de una lista, saber si alguien es elemento de una lista
% Saber la suma de los elementos de una lista, o si la suma es de tal valor


%%% Jugando al TEG

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



% Cuantos nadadores hay


% Agregar el sueldo de cada uno de los deportistas
    % de los nadadores es proporcional a la cantidad medallas que tiene, 20k por c/medalla
    % de los futbolistas depende de c/u lo que haya firmado en su contrato pero le restan 1k por cada expulsion que tengan
    % a los rugbyers les pagan a todos un monto fijo de 3k
    % los de polo solo practican porque les gusta así que no les pagan.
    % los jugadores de basket es un monto base en el contrato y un bonus de 5k por c/liga en la que haya jugado.

% Saber cual es el monto que se gasta en deportes

%% Saber si alguien cobra mas de un 1000000








% un findall de todos los que cobran más de un millon y 
% el length de esa lista > 1 (no hace falta, error!!!)
