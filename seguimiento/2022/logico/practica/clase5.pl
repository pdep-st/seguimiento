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

ancestro(Descendiente, Ancestro):-
    progenitorDe(Ancestro, Descendiente).

ancestro(Descendiente, Ancestro):-
    progenitorDe(Intermediario, Descendiente),
    ancestro(Intermediario, Ancestro).


% distancia(origen,destino,kilometros).
distancia(buenosAires, puertoMadryn, 1300).
distancia(puertoMadryn, puertoDeseado, 732).
distancia(puertoDeseado, rioGallegos, 736).
distancia(puertoDeseado, calafate, 979).
distancia(rioGallegos, calafate, 304).
distancia(calafate, chalten, 213).
distancia(buenosAires, tigre, 25.9).
distancia(tigre, puertoDeseado, 2040).
distancia(buenosAires, japon, 9999).

% distanciaMinima

distanciaMinima(Origen, Destino, Distancia):-
    distanciaPorRuta(Origen, Destino, Distancia),
    forall(
        distanciaPorRuta(Origen, Destino, OtraDistancia),
        Distancia =< OtraDistancia
    ).

distanciaPorRuta(Origen, Destino, Distancia):-
    distancia(Origen, Destino, Distancia).

distanciaPorRuta(Origen, Destino, Distancia):-
    distancia(Destino, Origen, Distancia).

distanciaPorRuta(Origen, Destino, Distancia):-
    distancia(Origen, OtroLado, DistanciaIntermedia),
    distanciaPorRuta(OtroLado, Destino, DistanciaHastaDestino),
    Origen \= Destino,
    Distancia is DistanciaIntermedia + DistanciaHastaDestino.

%%%%%

% isEmpty
isEmpty([]).
% head
head([Cabeza | _], Cabeza).
% tail
tail([_ | Cola], Cola).
% longitud
longitud([], 0).
longitud([_ | Tail], Longitud):-
    longitud(Tail, LongitudCola),
    Longitud is 1 + LongitudCola.

%%%%%

% caminoPosible(Origen, Destino, Camino)
caminoPosible(Origen, Destino, [Destino]):-
    distancia(Origen, Destino, _).

caminoPosible(Origen, Destino, [OtroLado | CaminoHastaDestino]):-
    distancia(Origen, OtroLado, _),
    caminoPosible(OtroLado, Destino, CaminoHastaDestino).


joven(persona(_, Edad, _, _)):- edadJoven(Edad).

edadJoven(Edad):- Edad < 18.
edadJoven(Edad):- Edad < 25, Edad > 21.


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

% actividadesPosibles


combinatoria([], []).

combinatoria([Primero | Resto], [Primero | Combinacion]):-
    combinatoria(Resto, Combinacion).

combinatoria([_ | Resto], Combinacion):-
    combinatoria(Resto, Combinacion).

/*
Primero1 = 1
Resto1 = [2, 3]
Resultado = [1 | Combinacion1] -> [1 | [2, 3]] -> [1, 2, 3]

Primero2 = 2
Resto2 = [3]
Combinacion1 = [2 | Combinacion2] -> [2 | [3]] -> [2, 3]

Primero3 = 3
Resto3 = []
Combinacion2 = [3 | Combinacion3] -> [3 | []] -> [3]

Primero3' = 3
Resto3' = []
Combinacion2' = Combinacion3 -> [] -> []

Combinacion3 = [] (entra por la cláusula de arriba)
*/