% Relaciona dos ciudad conectadas
conectada(ny, washington).
conectada(boston, ny).
conectada(washington, alaska).
conectada(washington, londres).
conectada(londres, madrid).

% Relaciona una ciudad con la cantidad de infecciones que hay en dicha ciudad
% virus(Infectados, Prevencion) 
% bacteria(Infectados)
% plaga(Nombre, Infectados).
infeccion(ny, virus(1, vacuna(viruela))).
infeccion(ny, bacteria(1)).
infeccion(washington,  virus(2, tratamiento(gripe)) ).
infeccion(londres, bacteria(2)).
infeccion(londres, plaga(pesteNegra, 10)).

% Relaciona un personaje con su rol
personaje(katie, medico).
personaje(mike, investigador).
personaje(john, medico).

% Relaciona un persona con alguna tarjeta que tenga
tarjeta(katie, ciudad(londres)).
tarjeta(mike, vacuna(viruela)).
tarjeta(katie, tratamiento(gripe)).

ciudad(Ciudad):- conectada(Ciudad, _).
ciudad(Ciudad):- conectada(_, Ciudad).

% Relaciona un personaje con su ubicación
ubicacion(katie, ny).
ubicacion(mike, ny).
ubicacion(john, londres).

%%Saber la cantidad de infecciones totales de una ciudad, sin importar su tipo. Por ejemplo en ny hay 2 infecciones y en londres hay 12.
cantidadInfecciones(Ciudad, CantidadInfecciones):-
    ciudad(Ciudad),
    findall(
        InfectadosPorInfeccion, 
        (
            infeccion(Ciudad, Infeccion),
            infectados(Infeccion, InfectadosPorInfeccion)
        ), Infectados
    ),
    sum_list(Infectados, CantidadInfecciones).

infectados(virus(Cantidad, _), Cantidad).
infectados(plaga(_, Cantidad), Cantidad).
infectados(bacteria(Cantidad), Cantidad).

%% Saber si un personaje puede curar la ciudad en la que está, en su turno. 

%%Un personaje debe curar las infecciones de a una acción por vez, por lo tanto la cantidad de infecciones que 
%%hay en esa ciudad no puede superar la cantidad de acciones de su turno. 
%%Ah, pero si sos médico gastas una sola acción para curar todas las infecciones de la ciudad.

%%La cantidad de acciones de un turno depende de en qué nivel lo estemos jugando, a veces son 3, 
%%otras 2, otras 5. Lo importante es que el cambio de la cantidad trate de impactar lo menos posible en la solución.

puedeCurarCiudad(_, Ciudad):-
    ciudad(Ciudad),
    not(infeccion(Ciudad, _)).

puedeCurarCiudad(Personaje, Ciudad):-
    ubicacion(Personaje, Ciudad),
    infeccion(Ciudad, _),
    puedeCurarSegunRol(Personaje, Ciudad).

puedeCurarSegunRol(_, Ciudad):-
    cantidadInfecciones(Ciudad, CantidadInfecciones),
    accionesTurno(AccionesTurno),
    AccionesTurno >= CantidadInfecciones.

puedeCurarSegunRol(Personaje, _):-
    personaje(Personaje, medico).

accionesTurno(4).


%% Saber si un personaje está atrapado, esto se da cuando todas las ciudades adyacentes son incurables. 
%% Es incurable cuando no hay ningún personaje que la pueda curar en un turno.

estaAtrapado(Jugador):-
    ubicacion(Jugador, Ciudad),
    forall(conectada(Ciudad, CiudadAdyacente), incurable(CiudadAdyacente)).

incurable(Ciudad):-
    not(puedeCurarCiudad(_, Ciudad)).


%%
%% Saber si las enfermedades de una ciudad pueden ser erradicadas. 
%$ Esto se da cuando se puede curar la ciudad en un turno y además tenemos todos los requisitos necesarios para prevenir un nuevo brote. 
%%     Las bacterias no necesitan requisitos extras.
%%     Los virus piden tener una tarjeta especial, que puede tener cualquier jugador.
%%     Las plagas, necesitan que no haya otra plaga del mismo nombre en otra ciudad.

erradicarEnfermedades(Ciudad):-
    puedeCurarCiudad(_, Ciudad),
    forall(infeccion(Ciudad, Infeccion), puedeErradicarse(Ciudad, Infeccion)).

puedeErradicarse(_, bacteria(_)).
puedeErradicarse(_, virus(_, Tarjeta)):-tarjeta(_, Tarjeta).
puedeErradicarse(Ciudad, plaga(Nombre, _)):-
    not((
        infeccion(OtraCiudad, plaga(Nombre, _)),
        Ciudad \= OtraCiudad
    )).

%% Cuántas acciones son necesarios para llegar de una ciudad a otra a 
%% través de una conexión (tener en cuenta que se puede pasar por otras ciudades en el medio). 

accionesDeViaje(Ciudad, Ciudad, 0).
accionesDeViaje(Ciudad, OtraCiudad, 1):-conectada(Ciudad, OtraCiudad).
accionesDeViaje(Ciudad, OtraCiudad, N):-
    conectada(Ciudad, CiudadConectada),
    accionesDeViaje(CiudadConectada, OtraCiudad, AccionesDesdeMiConexion),
    N is 1 + AccionesDesdeMiConexion.

%%Cuántas acciones son necesarios para que un personaje pueda ir de una ciudad a otra, puede necesitar N acciones si 
%% voy a través de conexiones, o si el personaje tiene la tarjeta de ciudad puede ir en una única acción

accionesParaViajar(Personaje, Destino, Acciones):-
    ubicacion(Personaje, Origen),
    accionesDeViaje(Origen, Destino, Acciones).

accionesParaViajar(Personaje, Destino, 1):-
    personaje(Personaje, _),
    tarjeta(Personaje, ciudad(Destino)).