/*
Conocemos a todos los usuarios de la plataforma, de ellos conocemos su nickname, la cantidad de suscriptores y los contenidos que subió, hay tres tipos de contenido:
Videos, de ellos sabemos el título, la duración (en segundos) y la cantidad de views (en miles) y likes (estos valores se mantienen constantes ya que la base es de consulta).
Shorts, de ellos sabemos la duración (en segundos), la cantidad de likes y qué filtros tiene.
Streams, no hay información relevante de este tipo.

*/

%usuario(Nombre, Suscriptores).

/*
markitocuchillos tiene 45.000 suscriptores y subió:
Video: “Gatito toca el piano” que tiene una duración de 45 segundos, lo vieron 50 mil y tiene 1.000 likes.
Video: “Gatito toca el piano 2” que tiene una duración de 65 segundos, lo vieron 2 mil y tiene 2 likes.
*/

usuario(markitocuchillos, 45000).
usuario(sebaElDolar, 5000).
usuario(tiqtoqera, 40000).
usuario(user0918, 1).

%subio(Usuario, Contenido).

subio(markitocuchillos, video("Gatito toca el piano", 45, 50, 1000)).
subio(markitocuchillos, video("Gatito toca el piano 2", 65, 2, 2)).
subio(sebaElDolar, video("300 ¿es el dólar o Esparta?", 60000, 2000, 1040500)).
subio(sebaElDolar, stream).
subio(tiqtoqera, short(15, 800000, [goldenHauer, cirugiaEstetica])).
subio(tiqtoqera, short(20, 0, [])).
subio(tiqtoqera, stream).

%2

%mytuber(Usuario).

mytuber(Usuario) :- subio(Usuario, _).

% 3

milenial(Usuario):-
    subio(Usuario, Contenido),
    videoMilenial(Contenido).

videoMilenial(video(_,_,1000,_)).
videoMilenial(video(_,_,_,1000)).

% 4

noSubioVideo(Usuario):-
    usuario(Usuario,_),
    not(subio(Usuario, video(_,_,_,_))).

/*
Nos piden poder calcular el nivel de engagement que tiene un mytuber. 
Esto es la sumatoria del engagement del total de sus contenidos:
Videos: es la cantidad de likes que tiene más 1 cada 1.000 views 
        ej: para el primer video de markitocuchillos es 1050 (1000 likes + 50 por views).
Shorts: es la cantidad de likes que tiene.
Streams: se considera siempre 2000.

*/

engagement(Mytuber, Engagement):-
    mytuber(Mytuber),
    findall(
        EngagementContenido,
        (subio(Mytuber, Contenido), engagementContenido(Contenido, EngagementContenido)),
        EngagementContenidos),
    sumlist(EngagementContenidos, Engagement).

engagementContenido(video(_, _, Views, Likes), EngagementContenido):- 
    EngagementContenido is Views + Likes.

engagementContenido(short(_, EngagementContenido, _), EngagementContenido).

engagementContenido(stream, 2000).  

/*

Se acerca diciembre y, como siempre, en MyTube eligen los mytubers mejor puntuados para armar un video conmemorativo, 
pero no es fácil ser objetivos, por lo que desde MyTube definieron un esquema de puntajes que representa la mejor form
de evaluación. Por cada objetivo cumplido se da una cantidad de puntos.
2 puntos por cada short con filtro (¡están de moda!).
1 punto por cada contenido con más de 10.000 puntos de engagement. 
2 puntos por cada video largo, es decir, una duración de más de 6.000 segundos.
1 punto si el Mytuber subió al menos 2 contenidos.
Finalmente, 10 puntos, si el total de engagement del Mytuber es mayor a un millón.
Modelar un predicado que relacione a un mytuber con su puntaje.

*/

puntaje(Mytuber, Total):-
    mytuber(Mytuber),
    findall(
        PuntajePorCriterio,
        puntajeCriterio(Mytuber, PuntajePorCriterio),
        PuntajesPorCriterio
    ),
    sumlist(PuntajesPorCriterio, Total).

puntajeCriterio(Mytuber, Puntaje):-
    subio(Mytuber, Contenido),
    puntajeContenido(Contenido, Puntaje).

puntajeCriterio(Mytuber, 1):-
    findall(
        Contenido,
        subio(Mytuber, Contenido),
        Contenidos),
    length(Contenidos, Longitud),
    Longitud > 1.

puntajeCriterio(Mytuber, 10):-
    engagement(Mytuber, Engagement),
    Engagement > 1000000.

puntajeContenido(short(_, _, Filtros), 2):-
    Filtros \= [].

puntajeContenido(Contenido, 1):-
    engagementContenido(Contenido, EngagementContenido),
    EngagementContenido > 10000.

puntajeContenido(video(_, Duracion, _, _), 2):-
    Duracion > 6000.

% 7

elMejor(MyTuber) :-
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
administra(fernando, inia).

representa(Manager, Mytuber):-
    administra(Manager, Mytuber).

representa(Manager, Mytuber):-
    administra(Manager, Intermediario),
    representa(Intermediario, Mytuber).
