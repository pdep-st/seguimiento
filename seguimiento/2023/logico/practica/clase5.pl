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

ancestro(Heredero, Ancestro):- progenitorDe(Ancestro, Heredero).
ancestro(Heredero, Ancestro):- progenitorDe(Progenitor, Heredero), ancestro(Progenitor, Ancestro).


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

% distanciaMinima
camino(Origen, Destino, Distancia):- distancia(Origen, Destino, Distancia).
camino(Origen, Destino, Distancia):-
    distancia(Origen, Intermediario, DistanciaIntermedia),
    camino(Intermediario, Destino, DistanciaHastaDestino),
    Distancia is DistanciaIntermedia + DistanciaHastaDestino.

distanciaMinima(Origen, Destino, Distancia):-
    camino(Origen, Destino, Distancia),
    forall(
            camino(Origen, Destino, DistanciaCamino),
            Distancia =< DistanciaCamino
        ).
%%%%%

% isEmpty
isEmpty([]).

% head
head([Head|_], Head).


% tail
tail([_|Cola], Cola).

% longitud
longitud([], 0).
longitud([_|Cola], Longitud):-
    longitud(Cola, LongitudCola),
    Longitud is 1 + LongitudCola.

%%%%%

% caminoPosible(Origen, Destino, Camino)

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


% combinatoria (explosión combinatoria)

% combinatoria(Lista, Combinacion).

combinatoria([], []).

combinatoria([Primero|Resto], [Primero|CombinacionCola]):-
    combinatoria(Resto, CombinacionCola).

combinatoria([_|Resto], CombinacionCola):-
    combinatoria(Resto, CombinacionCola).

/*
Primero1 = 1
Resto1 = [2, 3]
Resultado = [1, 2, 3] <- [1 | Combinacion1]

Primero2 = 2
Resto2 = [3]
Combinacion1 = [2, 3] <- [2 | Combinacion2]

Primero3 = 3
Resto3 = []
Combinacion2 = [3]

Primero3' = 3
Resto3' = []
Combinacion2' = []

Combinacion3 = 
*/

tieneHermano(Persona):-
    progenitorDe(Progenitor, Persona),
    progenitorDe(Progenitor, Hermano),
    Persona \= Hermano.