progenitorDe(homero, bart).
progenitorDe(homero, maggie).
progenitorDe(homero, lisa).
progenitorDe(marge, bart).
progenitorDe(marge, maggie).
progenitorDe(marge, lisa).

progenitorDe(abraham, homero).
progenitorDe(abraham, herbert).
progenitorDe(mona, homero).

progenitorDe(clancy, marge).
progenitorDe(clancy, patty).
progenitorDe(clancy, selma).

progenitorDe(jeryl, mona).

progenitorDe(jacqueline, marge).
progenitorDe(jacqueline, patty).
progenitorDe(jacqueline, selma).

progenitorDe(selma, ling).

% ancestro?

ancestroDe(Ancestro, Descendiente):-
    progenitorDe(Ancestro, Descendiente).
ancestroDe(Ancestro, Descendiente):-
    progenitorDe(Ancestro, Progenitor),
    ancestroDe(Progenitor, Descendiente).

% distancia(origen,destino,kilometros).
distancia(buenosAires, puertoMadryn, 1300).
distancia(puertoMadryn, puertoDeseado, 732).
distancia(puertoDeseado, rioGallegos, 736).
distancia(puertoDeseado, calafate, 979).
distancia(rioGallegos, calafate, 304).
distancia(calafate, chalten, 213).
distancia(buenosAires, tigre, 25.9).
distancia(tigre, puertoDeseado, 2040).
distancia(buenosAires, tokio, 9999).

% distanciaMinima(Origen, Destino, Distancia)
distanciaMinima(Origen, Destino, DistanciaMinima):-
    camino(Origen, Destino, DistanciaMinima),
    forall(
        camino(Origen, Destino, OtraDistancia),
        DistanciaMinima =< OtraDistancia
    ).

camino(Origen, Destino, Distancia):-
    distancia(Origen, Destino, Distancia).
camino(Origen, Destino, Distancia):-
    distancia(Origen, PuntoIntermedio, DistanciaIntermedia),
    camino(PuntoIntermedio, Destino, DistanciaADestino),
    Distancia is DistanciaIntermedia + DistanciaADestino.

%%%%%

% isEmpty
isEmpty([]).

% head
head([Cabeza | _], Cabeza).

% tail
tail([_ | Cola], Cola).

% longitud(Lista, Cantidad).
longitud([], 0).
longitud([_ | Xs], Cantidad):-
    longitud(Xs, LongitudCola),
    Cantidad is 1 + LongitudCola.
%%%%%

% I = [1,2,3]
% Xs = [2,3]
% LongitudCola = ? -> longitud([2,3], LongitudCola) -> 2
% Cantidad = 1 + 2

% I = [2,3]
% Xs = [3]
% LongitudCola = ? -> longitud([3], LongitudCola) -> 1
% Cantidad = 1 + 1

% I = [3]
% Xs = []
% LongitudCola = ? -> longitud([], LongitudCola) -> 0
% Cantidad = 1 + 0