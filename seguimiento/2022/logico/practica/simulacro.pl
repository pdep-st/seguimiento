% Duolengua 2021

% 1
/*
Los idiomas gratuitos son: inglés, español, portugués.
Los idiomas premium son: italiano, hebreo, francés, chino.
*/
idioma(ingles, gratuito).
idioma(espanol, gratuito).
idioma(portugues, gratuito).
idioma(italiano, premium).
idioma(hebreo, premium).
idioma(frances, premium).
idioma(chino, premium).

alumno(christian, 22, espanol).
alumno(maria, 34, ingles).
alumno(felipe, 60, italiano).
alumno(juan, 12, espanol).
alumno(martin, 28, espanol).

persona(Persona):- alumno(Persona, _, _).

plan(christian, gratuito).
plan(maria, premium(bronce)).
plan(felipe, premium(oro)).
plan(juan, cuentaGotas(6)).
plan(martin, gratuito).

cursa(christian, ingles, 7).
cursa(christian, portugues, 15).
cursa(maria, hebreo, 1).
cursa(juan, ingles, 20).

cursa(martin, ingles, 18).
cursa(martin, portugues, 15).
cursa(martin, latin, 20).
% 2

estaAvanzado(Persona, Idioma):-
    cursa(Persona, Idioma, Nivel),
    Nivel >= 15.

% 3

tieneCertificado(Persona, Idioma):-
    cursa(Persona, Idioma, 20).

% 4

lenguaCodiciada(IdiomaNativo, IdiomaCodiciado):-
    alumno(_, _, IdiomaNativo),
    idioma(IdiomaCodiciado, _),
    forall(
        alumno(Alumno, _, IdiomaNativo),
        cursa(Alumno, IdiomaCodiciado, _)
        ).

% 5

leFaltaAprender(Persona, Idioma):-
    idioma(Idioma, _),
    persona(Persona),
    not(habla(Persona, Idioma)).

habla(Persona, Idioma):-
    alumno(Persona, _, Idioma).

habla(Persona, Idioma):-
    estaAvanzado(Persona, Idioma).

% 6

poliglota(Persona):-
    cantidadHablados(Persona, Cantidad),
    Cantidad >= 3.

poliglota2(Persona):-
    hablaAlMenos(Persona, 3).

cantidadHablados(Persona, Cantidad):-
    persona(Persona),
    findall(
        Idioma,
        habla(Persona, Idioma),
        Idiomas
    ),
    length(Idiomas, Cantidad).

hablaAlMenos(Persona, Cantidad):-
    persona(Persona),
    findall(
        Idioma,
        habla(Persona, Idioma),
        Idiomas
    ),
    length(Idiomas, CantidadHablados),
    CantidadHablados >= Cantidad.
    
% 7
% puedeCursar(Persona, Idioma)

puedeCursar(Persona, Idioma):-
    plan(Persona, Plan),
    puedeCursarSegunPlan(Persona, Plan, Idioma).

cantidadCursosPremium(Persona, Cantidad):-
    findall(
        Idioma,
        (cursa(Persona, Idioma, _), idioma(Idioma, premium)),
        Idiomas
    ),
    length(Idiomas, Cantidad).

puedeCursarSegunPlan(_, _, Idioma):-
    idioma(Idioma, gratuito).

puedeCursarSegunPlan(_, premium(oro), _).

puedeCursarSegunPlan(Persona, premium(bronce), Idioma):-
    noExcedeLimiteDeCursos(Persona, Idioma, 3).

puedeCursarSegunPlan(Persona, premium(plata), Idioma):-
    noExcedeLimiteDeCursos(Persona, Idioma, 7).

puedeCursarSegunPlan(Persona, cuentaGotas(CursosDisponibles), Idioma):-
    noExcedeLimiteDeCursos(Persona, Idioma, CursosDisponibles).

noExcedeLimiteDeCursos(Persona, Idioma, CantidadLimite):-
    idioma(Idioma, premium),
    cantidadCursosPremium(Persona, Cantidad),
    Cantidad < CantidadLimite.

% 8

% sigue(Seguidor, Seguido)
sigue(christian, juan).
sigue(juan, martin).
sigue(martin, maria).

tieneExcentricismo(Persona):-
    persona(Persona),
    forall(
        sigue(Seguidor, Persona),
        excentrico(Seguidor)
    ).

idiomaExcentrico(klingon).
idiomaExcentrico(esperanto).
idiomaExcentrico(latin).

excentrico(Persona):-
    habla(Persona, Idioma),
    idiomaExcentrico(Idioma).

excentrico(Persona):-
    not(habla(Persona, ingles)),
    hablaAlMenos(Persona, 5).

excentrico2(Persona):-
    habla(Persona, klingon).

excentrico2(Persona):-
    habla(Persona, esperanto).

excentrico2(Persona):-
    habla(Persona, latin).

excentrico3(Persona):-
    findall(
        Idioma,
        habla(Persona, Idioma),
        IdiomasHablados
    ),
    member(klingon, IdiomasHablados).

% 9

conoce(Persona, Conocido):-
    sigue(Persona, Conocido).

conoce(Persona, Conocido):-
    sigue(Persona, Intermediario),
    conoce(Intermediario, Conocido).

puedeTraducir(Persona, Idioma):-
    habla(Persona, Idioma).

puedeTraducir(Persona, Idioma):-
    conoce(Persona, Alguien),
    habla(Alguien, Idioma).