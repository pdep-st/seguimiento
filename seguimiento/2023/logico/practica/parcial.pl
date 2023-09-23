protagonista(amigazo).
protagonista(zulemaLogato).
protagonista(hellMusic).
protagonista(ogiCuenco).
protagonista(elGigolo).

talento(amigazo, hablar(ceceoso)).
talento(amigazo, desmayarse).
talento(zulemaLogato, actuar).
talento(zulemaLogato, cantar(20, [teatro])).
talento(hellMusic, cantar(30, [deathMetal, rock])).
talento(hellMusic, hablar(ingles)).
talento(ogiCuenco, actuar).


% 1)

entrevista(amigazo, jueves, 1500).
entrevista(amigazo, sabado, 14500).
entrevista(hellMusic, lunes, 200).
entrevista(hellMusic, martes, 70000).
entrevista(zulemaLogato, domingo, 100000).

% 2)

talentoOculto(Protagonista):-
    talento(Protagonista, _),
    not(entrevista(Protagonista, _, _)).

% 3)

multifacetico(Protagonista):-
    talento(Protagonista, Talento),
    talento(Protagonista, OtroTalento),
    Talento \= OtroTalento.

% 4)

carisma(Protagonista, Carisma):-
    protagonista(Protagonista),
    findall(
        CarismaTalento,
        carismaPorTalento(Protagonista, CarismaTalento),
        CarismaTalentos
    ),
    sumlist(CarismaTalentos, Carisma).

carismaPorTalento(Protagonista, CarismaTalento):-
    talento(Protagonista, Talento),
    carismaTalento(Talento, CarismaTalento).

carismaTalento(hablar(Habla), CarismaBase):- 
    Habla \= ceceoso,
    carismaBaseParaHablar(CarismaBase).

carismaTalento(hablar(ceceoso), Carisma):- 
    carismaBaseParaHablar(CarismaBase),
    Carisma is 25 + CarismaBase.

carismaBaseParaHablar(40).

% Esta solución tiene el problema de que en el punto 6 si el talento a aprender
% es hablar(ceceoso) va a tener dos resultados posibles (40 y 25)
% carismaTalento(hablar(_), 40).
% carismaTalento(hablar(ceceoso), 25).

carismaTalento(actuar, 35).

% Se define ya que en el punto 6 se usa carismaTalento para determinar quien es el más apto
% y si el talento no tiene carisma, entonces es falso siempre. 
carismaTalento(desmayarse, 0).

carismaTalento(cantar(Nivel, Estilos), Carisma):-
    indicePorEstilos(Estilos, Indice),
    Carisma is Nivel * Indice.

indicePorEstilos(Estilos, 2):-
    length(Estilos, CantidadEstilos),
    CantidadEstilos > 1.

indicePorEstilos([_], 1).

% 5)

fama(Protagonista, Fama):-
    protagonista(Protagonista),
    findall(
        FamaEntrevista,
        famaEntrevista(Protagonista, FamaEntrevista),
        FamaEntrevistas
    ),
    sumlist(FamaEntrevistas, Fama).

famaEntrevista(Protagonista, FamaEntrevista):-
    entrevista(Protagonista, Dia, Viewers),
    coeficientePorDia(Dia, Coeficiente),
    carisma(Protagonista, Carisma),
    FamaEntrevista is Viewers * Carisma * Coeficiente.

coeficientePorDia(Dia, 0.5):-
    finde(Dia).

coeficientePorDia(Dia, 0.1):-
    diaDeSemana(Dia).

finde(sabado).
finde(domingo).
diaDeSemana(Dia):- dia(Dia), not(finde(Dia)).
dia(Dia):- member(Dia, [lunes, martes, miercoles, jueves, viernes, sabado, domingo]).

% 6)

elMasApto(Talento, Protagonista):-
    carismaAprendiendo(Protagonista, Talento, Carisma),
    forall(
        carismaAprendiendo(OtroProtagonista, Talento, OtroCarisma),
        Carisma >= OtroCarisma
    ).

carismaAprendiendo(Protagonista, Talento, Carisma):-
    carisma(Protagonista, Carisma),
    carismaPorAprender(Protagonista, Talento, CarismaExtra),
    Carisma is CarismaProtagonista + CarismaExtra.

carismaPorAprender(Protagonista, Talento, 0):-
    talento(Protagonista, Talento).

carismaPorAprender(Protagonista, Talento, CarismaTalento):-
    not(talento(Protagonista, Talento)),
    carismaTalento(Talento, CarismaTalento).

% 7)

amigo(zulemaLobato, inia).
amigo(hellMusic, martin).
amigo(amigazo, cappe).
amigo(amigazo, edu).
amigo(inia, martin).
amigo(martin, ogiCuenco).

bronca(samid, viale).
bronca(martin, amigazo).
bronca(ogiCuenco, mirtaLagrande).
bronca(inia, martin).

seLaPudre(Pudridor, Pudrido):-
    bronca(Pudridor, Pudrido).

seLaPudre(Pudridor, Pudrido):-
    amigo(Pudridor, Amigo),
    seLaPudre(Amigo, Pudrido).