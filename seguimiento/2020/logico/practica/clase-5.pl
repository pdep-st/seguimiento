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

ancestroDe(Ancestro, Alguien):-
    progenitorDe(Ancestro, Alguien).

ancestroDe(Ancestro, Alguien):-
    progenitorDe(Progenitor, Alguien),
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

distanciaMinima(Lugar, OtroLugar, Km):- 
    distanciaTotal(Lugar, OtroLugar, Km),
    forall(
        distanciaTotal(Lugar, OtroLugar, OtrosKm),
        OtrosKm >= Km 
    ).

distanciaTotal(Lugar, OtroLugar, Km):- 
    distancia(Lugar, OtroLugar, Km).

distanciaTotal(Lugar, DestinoFinal, DistanciaTotal):-
    distancia(Lugar, LugarIntermedio, KmHaciaIntermedio),
    distanciaTotal(LugarIntermedio, DestinoFinal, KmDesdeIntermedio),
    DistanciaTotal is KmHaciaIntermedio + KmDesdeIntermedio.


%%% LISTAS CON PATTERN MATCHING
isEmpty([]).

head(X, [X|_]).
tail(Xs, [_|Xs]).

longitud([], 0).
longitud([X | Xs], Longitud):-
    longitud(Xs, LongitudCola),
    Longitud is 1 + LongitudCola.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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

% actividadesPosibles([cine, u2, pool], 2300, ActividadesPosibles).
% ActividadesPosibles = []
% ActividadesPosibles = [cine, u2]
% ActividadesPosibles = [cine, pool]
% ActividadesPosibles = [u2, pool]

actividadesPosibles([], _, []).

actividadesPosibles(
    [Actividad | Actividades],
    Plata,
    [Actividad | ActividadesPosibles ]
):-
    costo(Actividad, Costo),
    Plata > Costo,
    PlataRestante is Plata - Costo,
    actividadesPosibles(Actividades, PlataRestante, ActividadesPosibles).

actividadesPosibles(
    [_|Actividades],
    Plata,
    ActividadesPosibles
):-
    actividadesPosibles(Actividades, Plata, ActividadesPosibles).