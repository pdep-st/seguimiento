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

ancestroDe(Ancestro, Persona):-
    progenitorDe(Ancestro, Persona).

ancestroDe(Ancestro, Persona):-
    progenitorDe(Progenitor, Persona),
    ancestroDe(Ancestro, Progenitor).


% distancia(origen,destino,kilometros).
distancia(buenosAires, puertoMadryn, 1300).
distancia(puertoMadryn, puertoDeseado, 732).
distancia(puertoDeseado, rioGallegos, 736).
distancia(puertoDeseado, calafate, 979).
distancia(rioGallegos, calafate, 304).
distancia(calafate, chalten, 213).
distancia(buenosAires, tigre, 25.9).
distancia(tigre, puertoDeseado, 2040).

distanciaMinima(Origen, Destino, Distancia):-
    distanciaPorRuta(Origen, Destino, Distancia),
    forall(
        distanciaPorRuta(Origen, Destino, OtraDistancia),
        Distancia =< OtraDistancia
    ).

distanciaPorRuta(Origen, Destino, Distancia):-
    distancia(Origen, Destino, Distancia).

distanciaPorRuta(Origen, Destino, DistanciaFinal):-
    distancia(Origen, PuntoIntermedio, DistanciaPuntoIntermedio),
    distanciaPorRuta(PuntoIntermedio, Destino, DistanciaAlDestino),
    DistanciaFinal is DistanciaPuntoIntermedio + DistanciaAlDestino.

%%%%%

isEmpty([]).

head(X, [X|_]).
tail(Xs, [_|Xs]).

longitud([], 0).
longitud([_ | Xs], Longitud):-
    longitud(Xs, LongitudCola),
    Longitud is 1 + LongitudCola.


caminoPosible(Origen, Destino, [Destino]):-
    distancia(Origen, Destino, _).

caminoPosible(Origen, Destino, [PuntoIntermedio | CaminoIntermedio]):-
    distancia(Origen, PuntoIntermedio, _),
    caminoPosible(PuntoIntermedio, Destino, CaminoIntermedio).

%    distancia(Origen, PuntoIntermedio, DistanciaPuntoIntermedio),
%    distanciaPorRuta(PuntoIntermedio, Destino, DistanciaAlDestino),
%   DistanciaFinal is DistanciaPuntoIntermedio + DistanciaAlDestino.


actividad(cine).
actividad(arjona).
actividad(princesas_on_ice).
actividad(pool).
actividad(bowling).

costo(cine,400).
costo(u2,1750).
costo(princesas_on_ice,2500).
costo(pool,350).
costo(bowling,300).

actividadesPosibles([], _, []).

actividadesPosibles([Actividad | Actividades], Plata, [Actividad | ActividadesPosibles]):-
    costo(Actividad, Costo),
    Plata > Costo,
    PlataRestante is Plata - Costo,
    actividadesPosibles(Actividades, PlataRestante, ActividadesPosibles ).

actividadesPosibles([_ | Actividades], Plata, ActividadesPosibles):-
    actividadesPosibles(Actividades, Plata, ActividadesPosibles).
