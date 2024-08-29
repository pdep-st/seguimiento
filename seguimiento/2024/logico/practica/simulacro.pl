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


tieneHermano(Persona):-
    progenitorDe(Progenitor, Persona),
    progenitorDe(Progenitor, Otro),
    Persona \= Otro.

susHijos(Progenitor, Hijos):-
    progenitorDe(Progenitor, _),
    findall(
        Hijo,
        progenitorDe(Progenitor, Hijo),
        Hijos
    ).

personaje(Personaje):-
    progenitorDe(Personaje, _).

personaje(Personaje):-
    progenitorDe(_, Personaje).


personajes(Personajes):-
    findall(
        Personaje,
        personaje(Personaje),
        Personajes
    ).

hermanan([Personaje | Personajes], [Personaje | ConHermanos], SinHermanos):-
    tieneHermano(Personaje),
    hermanan(Personajes, ConHermanos, SinHermanos).

hermanan([Personaje | Personajes], ConHermanos, [Personaje | SinHermanos]):-
    personaje(Personaje),
    not(tieneHermano(Personaje)),
    hermanan(Personajes, ConHermanos, SinHermanos).

hermanan([], [], []).


%% Simulacro

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

%% 1

entrevistado(amigazo,jueves,1500).
entrevistado(amigazo,sabado,14500).
entrevistado(hellMusic,martes,200).
entrevistado(hellMusic,lunes,700).
entrevistado(zulemaLogato,domingo,100000).

/*
2.
Saber qué protagonistas son talentos ocultos, esto ocurre cuando tienen algún talento pero nunca fueron entrevistados.
*/

talentoOculto(Protagonista):-
    talento(Protagonista, _),
    not(entrevistado(Protagonista, _, _)).

/*
3.
También queremos saber si algún protagonista es multifacético. Esto pasa cuando tiene dos o más talentos.
*/

multifacetico(Protagonista):-
    talento(Protagonista, Talento),
    talento(Protagonista, OtroTalento),
    Talento \= OtroTalento.

/*
4.
Hablemos de carisma, el carisma es una forma de medir el nivel de talento
de un protagonista, por cada talento se suma carisma,
nos piden calcular el carisma de un protagonista sabiendo que:
Cantar suma el nivel de canto si sabe un solo estilo,
si sabe más de uno, suma el doble.
Actuar suma siempre 35.
Hablar suma 40 para cualquier talento de habla,
y suma 25 extra si es ceceoso (tener en cuenta que el valor base puede cambiar y ceceoso siempre debe sumar 25 más que el base).
Desmayarse no suma nada.
*/

carisma(Protagonista, Carisma):-
    protagonista(Protagonista),
    findall(
        CarismaTalento,
        (talento(Protagonista, Talento), carismaTalento(Talento, CarismaTalento)),
        CarismaTalentos
    ),
    sumlist(CarismaTalentos, Carisma).


carismaTalento(actuar, 35).

carismaTalento(desmayarse, 0).

/*carismaTalento(cantar(NivelCanto, Estilos), Carisma):-
    length(Estilos, Cantidad),
    indiceSegunCantidad(Cantidad, IndiceSegunEstilos),
    Carisma is NivelCanto * IndiceSegunEstilos

indiceSegunCantidad(1, 1).
indiceSegunCantidad(Cantidad, 2):-
    Cantidad > 1.
*/

carismaTalento(cantar(NivelCanto, [_]), NivelCanto).
carismaTalento(cantar(NivelCanto, [_, _ | _]), Carisma):-
    Carisma is NivelCanto * 2.

carismaTalento(hablar(Estilo), 40):-
    Estilo \= ceceoso.
carismaTalento(hablar(ceceoso), Carisma):-
    carismaTalento(hablar(noCeceoso), CarismaBase),
    Carisma is CarismaBase + 25.

/*
5.
El carisma no sirve de nada si no tenés fama, la fama es el valor que se obtiene de ser entrevistado por Anabela.
La fama es la suma de fama que de cada entrevista:
Si fue entrevistado un día de semana la fama es: cantidad de personas que lo vio * 0,1 * carisma del entrevistado.
Si fue entrevistado un día de fin de semana la fama es: cantidad de personas que lo vio * 0,5 * carisma del entrevistado.
*/

fama(Protagonista, Fama):-
    protagonista(Protagonista),
    findall(
        FamaEntrevista,
        famaEntrevista(Protagonista, FamaEntrevista),
        FamaEntrevistas
    ),
    sumlist(FamaEntrevistas, Fama).

famaEntrevista(Protagonista, FamaEntrevista):-
    entrevistado(Protagonista, Dia, GenteQueLoVio),
    indiceFamaSegunDia(Dia, Indice),
    carisma(Protagonista, Carisma),
    FamaEntrevista is GenteQueLoVio * Indice * Carisma.

indiceFamaSegunDia(Dia, 0.5):-
    finDeSemana(Dia).

indiceFamaSegunDia(Dia, 0.1):-
    not(finDeSemana(Dia)).

finDeSemana(sabado).
finDeSemana(domingo).


/*
6.
El canal decidió empezar un programa de talentos donde le enseñan un nuevo talento a un protagonista
y nos piden saber quién es el más apto para aprender un nuevo talento.
Dado un talento nuevo para aprender, queremos saber quién tiene más carisma resultante,
tener en cuenta que si la persona ya sabe ese exacto talento, no suma carisma.
Crear un predicado que nos diga quién es el más apto.
Requiere ser sólo inversible para el protagonista.
*/

masApto(Protagonista, Talento):-
    aprende(Protagonista, Talento, CarismaResultante),
    forall(
        (protagonista(OtroProtagonista), aprende(OtroProtagonista, Talento, OtroCarismaResultante), OtroProtagonista \= Protagonista),
        CarismaResultante > OtroCarismaResultante
    ).

aprende(Protagonista, Talento, CarismaResultante):-
    carisma(Protagonista, CarismaBase),
    carismaExtraSegun(Protagonista, Talento, CarismaExtra),
    CarismaResultante is CarismaBase + CarismaExtra.

carismaExtraSegun(Protagonista, Talento, 0):-
    talento(Protagonista, Talento).

carismaExtraSegun(Protagonista, Talento, CarismaExtra):-
    not(talento(Protagonista, Talento)),
    carismaTalento(Talento, CarismaExtra).


/*
7.
Hay protagonistas que tienen bronca con otro, y hay protagonistas que se perciben amigos de otros. 
Dados dos protagonistas, se pide saber si el primero se la pudre al segundo. Esto se da cuando el primero 
tiene bronca con el segundo, o cuando el primero tiene un amigo que se la pudre al segundo.
*/

amigo(zulemaLogato, inia).
amigo(hellMusic, martin).
amigo(amigazo, cappe).
amigo(amigazo, edu).
amigo(inia, martin).
amigo(martin, ogiCuenco).

bronca(samid, viale).
bronca(martin, amigazo).
bronca(ogiCuenco, mirtaLagrande).

seLaPudre(Agresor, Victima):-
    bronca(Agresor, Victima).

seLaPudre(Agresor, Victima):-
    amigo(Agresor, Amigo),
    seLaPudre(Amigo, Victima).
