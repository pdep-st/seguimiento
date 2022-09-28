% 1
usuario(markitocuchillos, 45000).
usuario(sebaElDolar, 5000).
usuario(tiqtoqera, 5000).
usuario(user99018, 1).

subio(markitocuchillos, video("Gatito toca el piano", 45, 50, 1000)).
subio(markitocuchillos, video("Gatito toca el piano 2", 65, 2, 2)).
subio(sebaElDolar, video("300 ¿es el dólar o Esparta?", 60000, 2000, 1040500)).
subio(sebaElDolar, stream).
subio(tiqtoqera, short(15, 800000, [goldenHauer, cirugiaEstetica])).
subio(tiqtoqera, short(20, 0, [])).
subio(tiqtoqera, stream).

% 2

myTuber(MyTuber):-
    subio(MyTuber, _).

% 3

milenial(MyTuber):-
    subio(MyTuber, Video),
    videoMilenial(Video).

videoMilenial(video(_, _, 1000, _)).
videoMilenial(video(_, _, _, 1000)).

% 4

noSubioUnVideo(Usuario):-
    usuario(Usuario, _),
    not(subio(Usuario, video(_, _, _, _))).

% 5

nivelDeEngagement(MyTuber, Engagement):-
    myTuber(MyTuber),
    findall(
        EngagementContenido,
        subio(MyTuber, Contenido), engagementContenido(Contenido, EngagementContenido),
        EngagementContenidos
    ),
    sumlist(EngagementContenidos, Engagement).

engagementContenido(video(_, _, Views, Likes), Engagement):-
    Engagement is Likes + Views.

engagementContenido(short(_, Engagement, _), Engagement).

engagementContenido(stream, 2000).

% 6

puntaje(MyTuber, PuntajeTotal):-
    myTuber(MyTuber),
    findall(
        Puntaje,
        puntajePorCategoria(MyTuber, Puntaje),
        PuntajesPorCategoria
    ),
    sumlist(PuntajesPorCategoria, PuntajeTotal).

puntajePorCategoria(MyTuber, 2):-
    subio(MyTuber, short(_, _, Filtros)),
    Filtros \= [].

puntajePorCategoria(MyTuber, 1):-
    subio(MyTuber, Contenido),
    engagementContenido(Contenido, Engagement),
    Engagement > 10000.

puntajePorCategoria(MyTuber, 2):-
    subio(MyTuber, video(_, Duracion, _, _)),
    Duracion > 6000.

puntajePorCategoria(MyTuber, 1):-
    subio(MyTuber, Contenido),
    subio(MyTuber, OtroContenido),
    Contenido \= OtroContenido.

puntajePorCategoria(MyTuber, 10):-
    nivelDeEngagement(MyTuber, Engagement),
    Engagement > 1000000.

% 7

elMejor(MyTuber) :-
    myTuber(MyTuber),
    puntaje(MyTuber, Puntaje),
    forall(
        (puntaje(OtroMyTuber, OtroPuntaje), OtroMyTuber \= MyTuber),
        Puntaje > OtroPuntaje
    ).

% 8

administra(martin, sebaElDolar).
administra(martin, markitocuchillos).
administra(inia, martin).
administra(inia, gaston).
administra(gaston, tiqtoqera).

representa(Manager, MyTuber):-
    administra(Manager, MyTuber).

representa(Manager, MyTuber):-
    administra(Manager, OtroManager),
    representa(OtroManager, MyTuber).