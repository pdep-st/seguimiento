nacio(karla, fecha(22, 08, 1979)).

%nacio(karla, 22, 08, 1979).

anioDeNacimiento(Persona,Anio):- 
    nacio(Persona, fecha(_,_,Anio)).

compro(
    cliente(231024, "Nelson Pedernera"),
    producto(pirufio, 239, 1)
).



/* 
para la natación sabemos el estilo preferido, 
    la cantidad de metros diarios que recorre, 
    y la cantidad de medallas que consiguió a lo largo
        de su carrera deportiva
para el fútbol primero conocemos las medallas, 
    luego los goles convertidos y por último las veces que fue expulsado
para el rugby, queremos saber 
    la posición que ocupa y luego la cantidad de medallas obtenidas
*/

% natacion: estilo preferido, metros nadados, medallas
practica(gaston, natacion(pecho, 10)).
practica(ana, natacion(pecho, 1200, 1)).
practica(luis, natacion(perrito, 200, 0)).
practica(vicky, natacion(crawl, 800, 0)).
% fútbol: medallas, goles marcados, veces que fue expulsado
practica(deby, futbol(2, 15, 5)).
practica(mati, futbol(1, 11, 7)).
% rugby: posición que ocupa, medallas
practica(zaffa, rugby(pilar, 0)).
practica(sofi, polo(7)).



/* 
Quiénes son nadadores
*/
nadador(Nadador):-
    practica(Nadador, natacion(_,_,_)).
nadador(Nadador):- 
    practica(Nadador, natacion(_, _)).

/* 
Medallas obtenidas
*/

medallas(Deportista, Medallas):-
    practica(Deportista, Caracteristica),
    medallasSegunDeporte(Caracteristica, Medallas).

medallasSegunDeporte(
    natacion(_,_,Medallas),
    Medallas
).

medallasSegunDeporte(
    natacion(_, _),
    0
).

medallasSegunDeporte(
    futbol(Medallas, _, _),
    Medallas
).

medallasSegunDeporte(
    rugby(_, Medallas),
    Medallas
).

/* 
    ¿Quien tiene mas medallas que el resto?
*/
masMedallas(Deportista):-
    medallas(Deportista, Medallas),
    forall(
        (
            medallas(OtroDeportista, OtrasMedallas),
            OtroDeportista \= Deportista
        ),
        Medallas >= OtrasMedallas    
    ).

/* 
    ¿Quien no tiene aun medallas?
*/
%sinMedallas(Deportista):-
%    medallas(Deportista, 0).

sinMedallas(Deportista):-
    not((
        medallas(Deportista, Medallas),
        Medallas > 0
    )).

/* 

5.3 Buen deportista
Quiero saber si alguien es buen deportista
en el caso de la natación, si recorren más de 1.000 metros diarios o su estilo preferido es el crol
en el caso del fútbol, si la diferencia de goles menos las expulsiones suman más de 5
en el caso del rugby, si son wings o pilares

*/
buenDeportista(Deportista):-
    practica(Deportista, Caracteristica),
    buenaPractica(Caracteristica).

buenaPractica(natacion(_, Metros, _)):- Metros > 1000.
buenaPractica(natacion(_, Metros)):-Metros > 1000.
buenaPractica(futbol(_, Goles, Expulsiones)):- 
    Calculo is Goles - Expulsiones,
    Calculo > 5.
buenaPractica(rugby(wing, _)).
buenaPractica(rugby(pilar, _)).

/* 
    y si agregamos el polo que solo sabemos el handicap del jugador, 
    y es bueno si tiene un handicap mayor a 6
    no tiene medallas
*/
buenaPractica(polo(Handicap)):-Handicap > 6.

incrementar(X, Y, D, Z):- Aux is X + 1, Z is Aux * Y + D.
