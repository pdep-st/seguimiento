% natacion: estilo preferido, metros nadados, medallas
practica(phelps, natacion(crawl, 5000, 35)).
practica(juan, natacion(pecho, 500, 0)).
practica(pedro, natacion(mariposa, 0, 0)).
% fútbol: medallas, goles marcados, veces que fue expulsado
practica(messi, futbol(30, 820, 4)).
practica(cape, futbol(0, 36, 0)).
% rugby: posición que ocupa, medallas
practica(pichot, rugby(mariscal, 1)).
practica(pablito, rugby(wing, 0)).
% billar: no hay medallas
practica(martin, billar).


esBuenNadador(EstiloPreferido, Metros, Medallas):-
    buenaPractica(natacion(EstiloPreferido, Metros, Medallas)).

buenDeportista(Deportista):-
    practica(Deportista, Practica),
    buenaPractica(Practica).

buenaPractica(natacion(_, Metros, _)):-
    Metros > 1000.

buenaPractica(natacion(crawl, _, _)).

% fútbol, si la diferencia de goles menos las expulsiones es 5 o más

buenaPractica(futbol(_, Goles, Expulsiones)):- 
    Diferencia is Goles - Expulsiones,
    Diferencia >= 5.

buenaPractica(rugby(wing,_)).

buenaPractica(rugby(pilar,_)).    

es5(5).

sumar(X, Y, Suma):- Suma is X + Y.

incrementar(X, Incremento):- Incremento is X * 2 + 1.

esIgual(Algo, Algo).

% Agregar un par de jugadores de basket, que se conoce en qué ligas jugó y su edad
% un jugador de basket se considera que es una buena práctica si jugó en al menos dos ligas 
% o si jugó en la nba (y si también es buena si juega en la euroliga?)
% o si tiene más de 40 años
    % Agregar a manu que juega al basket, jugó en argentina, euroliga, nba 
    % la edad actual que tiene (45)
practica(manu, basket([argentina, euroliga, nba], 45)).
    % Agregar a mario que juega al basket, jugo solo en argentina, tiene 33 años
practica(mario, basket([argentina], 33)).


buenaPractica(basket(_, Edad)):- Edad > 40.
buenaPractica(basket(Ligas, _)):- member(nba, Ligas).
buenaPractica(basket(Ligas, _)):-
    length(Ligas, CantidadLigas),
    CantidadLigas >= 2.



% Cuántos nadadores hay?
nadador(Nombre):- practica(Nombre, natacion(_, _, _)).

cuantosNadadores(Cantidad):-
    findall(
        Nadador,
        nadador(Nadador),
        Nadadores
    ),
    length(Nadadores, Cantidad).

% Agregar el sueldo de cada uno de los deportistas
    % de los nadadores es proporcional a la cantidad medallas que tiene, 20k por c/medalla
    % de los futbolistas depende de c/u lo que haya firmado en su contrato y le restan 1k por cada expulsión que tengan
    % a los rugbyers les pagan a todos un monto fijo de 3k
    % los de polo solo practican porque les gusta así que no les pagan.
    % los jugadores de basket es un monto base en el contrato y un bonus de 5k por c/liga en la que haya jugado.

% Saber cuál es el monto que se gasta en deportes

%% Saber si alguien cobra mas de un 1000000



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
ocupados(Jugador, CantidadOcupados):-
    jugador(Jugador),
    findall(
        Pais,
        ocupa(Pais, Jugador, _),
        Paises
    ),
    length(Paises, CantidadOcupados).

% ¿Cuántos países están cargados? Un país está cargado cuando tiene más de 7 fichas.

cargados(CantidadCargados):-
    findall(
        Pais,
        cargado(Pais),
        Paises
    ),
    length(Paises, CantidadCargados).

cargado(Pais):- ocupa(Pais, _, Fichas), Fichas > 7.

% ¿Qué jugadores ocupan países con más de 5 fichas?

jugadorFichero(Jugador):- ocupa(_, Jugador, Fichas), Fichas > 5.

% Cuántas fichas tiene cada jugador?
fichasDe(Jugador, FichasTotales):-
    jugador(Jugador),
    findall(
        FichasPais,
        ocupa(_, Jugador, FichasPais),
        FichasPaises
    ),
    sumlist(FichasPaises, FichasTotales).


% Está armado un jugador cuando tiene dos países o más con al menos 6 fichas

estaArmado(Jugador):-
    jugador(Jugador),
    findall(
        Pais,
        ocupaConMuchasFichas(Pais, Jugador),
        Paises
    ),
    length(Paises, CantidadPaises),
    CantidadPaises >= 2.

estaArmado2(Jugador):-
    ocupaConMuchasFichas(Pais, Jugador),
    ocupaConMuchasFichas(OtroPais, Jugador),
    Pais \= OtroPais.

ocupaConMuchasFichas(Pais, Jugador):-
    ocupa(Pais, Jugador, Fichas),
    Fichas >= 6.


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