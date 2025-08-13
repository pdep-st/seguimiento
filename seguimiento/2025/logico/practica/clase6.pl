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

ancestro(Heredero, Ancestro):- progenitorDe(Progenitor, Heredero), ancestro(Progenitor, Ancestro).
ancestro(Heredero, Ancestro):- progenitorDe(Ancestro, Heredero).

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


% Simulacros

%genero(Canción, Género).
genero(el38, rock).
genero(sisters, reggae).
genero(muchoPorHacer, rock).
genero(tusOjos, reggae).
genero(bastara, reggae).

%toca(Tema, Banda).
toca(el38, divididos).
toca(sisters, divididos).
toca(muchoPorHacer, riff).
toca(tusOjos, losCafres).
toca(bastara, losCafres).  

rockera(Banda):-
   findall(Tema, (toca(Tema,Banda),genero(Tema,Genero),Genero\=rock), Temas),
   length(Temas,0).

% 1

% rockera(riff): True
% rockera(divididos): False
% rockera(42): True
% rockera(Banda): False

% 2

% 42 y Banda devuelven resultados erróneos debido a la falta de inversibilidad del predicado

% 3

rockera2(Banda):-
   toca(_, Banda),
   forall(toca(Tema, Banda), genero(Tema, rock)).


% plato(restaurante, plato, precio)
plato(laAngioplastia,mila,180).
plato(laAngioplastia,bife,230).
plato(laAngioplastia,molleja,220).
plato(lasVioletas,bife,450).
plato(elCuartito,muzza,290).
bodegon(Restaurante):-
   tieneMila(Restaurante),
   noTienePlatosMasDe300(Restaurante).

noTienePlatosMasDe300(Restaurante):-
   not((plato(Restaurante,_,Precio),Precio >= 300)).
tieneMila(Restaurante):-
   plato(Restaurante, mila, _).

%esAutorDe(Autor, Obra).
esAutorDe(tolkien, elSeniorDeLosAnillos).
esAutorDe(tolkien, elHobbit).
esAutorDe(rowling, harryPotterYLaCamaraSecreta).
esAutorDe(rowling, unaVacanteImprevista).
esAutorDe(miguelCervantes, donQuijote).
esAutorDe(borges, elAleph).
esAutorDe(tolkien, librazo).
%genero(Obra, Genero).
genero(elSeniorDeLosAnillos, fantasia).
genero(elHobbit, fantasia).
genero(harryPotterYLaCamaraSecreta, fantasia).
genero(unaVacanteImprevista, novela).
genero(donQuijote, novela).
genero(elAleph, cuento).
genero(librazo, cuento).

autorEspecifico2(Autor) :-  % La original
    esAutorDe(Autor, _),  
    forall(genero(Obra, _), esAutorDe(Autor, Obra)).


autorEspecifico(Autor):- % La mejor para Martín
    esAutorDe(Autor, _),
    genero(_, Genero),
    forall(esAutorDe(Autor, Obra), genero(Obra, Genero)).

autorEspecifico3(Autor):- % Es muy procedural!
    esAutorDe(Autor, _),
    findall(
        Genero,
        (esAutorDe(Autor, Obra), genero(Obra, Genero)),
        Generos
    ),
    list_to_set(Generos, GenerosUnicos),
    length(GenerosUnicos, 1).

autorEspecifico4(Autor):- % Esta vale
    esAutorDe(Autor, _),
    not(
        (esAutorDe(Autor, Obra),
        esAutorDe(Autor, OtraObra),
        genero(Obra, Genero),
        genero(OtraObra, OtroGenero),
        Genero \= OtroGenero)
    ).

puedeAnotarseAFinal(Alumno, Materia, Fecha):-
  esFechaFinal(Materia, Fecha),
  aproboCursada(Alumno, Materia, FechaFirma),
  not(aproboFinal(Alumno, Materia, _)),
  puedeRendirFinal(Alumno, Materia, Fecha, FechaFirma).

puedeRendirFinal(_, _, Fecha, FechaFirma):-
    añosLectivosTranscurridos(FechaFirma, Fecha, 0).

puedeRendirFinal(Alumno, Materia, _, _):-
    forall(
        correlativa(Correlativa, Materia),
        aproboFinal(Alumno, Correlativa, _)
    ).
