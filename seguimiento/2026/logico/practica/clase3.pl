% Messi nació el 24/06/1987
%nacio/2
nacio(messi, fecha(24, 06, 1987)).
% Nació messi?
% Cuándo nació una persona?
/*
Anto Roccuzzo, cliente número 99102, compró una TV de 80' pagando 200.000
Mateo Messi, cliente número 3, compró heladera con freezer y 2 puertas pagando 300.000
Fideo Di María, cliente 11, compró una TV de 40' a 80.000
*/
cliente(antoRocuzzo, 99102).
cliente(mateoMessi, 3).
cliente(fideoDiMaria, 11).
compra(99102, tv(80), 200000).
compra(3, heladera(freezer, 2), 300000).
compra(11, tv(40), 80000).


% Qué clientes hicieron compras?
hizoCompra(Cliente):- cliente(Cliente, Numero), compra(Numero, _, _).
% Qué productos fueron comprados por más de 100.000?
masDeCienmil(Producto):- compra(_, Producto, Precio), Precio>100000.
% Existe alguna tv de 80'?
vendimosTvDe(Pulgadas):-compra(_, tv(Pulgadas), _).
% ? - compra(_, tv(80), _).

/* 
para la natación sabemos el estilo preferido, 
la cantidad de metros diarios que recorre, 
y la cantidad de medallas que consiguió a lo largo
de su carrera deportiva
para el fútbol conocemos las medallas, 
los goles convertidos y las veces que fue expulsado
para el rugby, queremos saber 
la posición que ocupa y luego la cantidad de medallas obtenidas
*/

% natacion: estilo preferido, metros nadados, medallas

% fútbol: medallas, goles marcados, veces que fue expulsado

% rugby: posición que ocupa, medallas



% Quiénes son nadadores


% Medallas obtenidas


% ¿Quién tiene más medallas que el resto?
/*
Para el deportista que estoy mirando, se cumple que
para todos los otros deportistas, tienen menos medallas que éste.
Sólo puede haber un mejor, y si no, no hay
*/


% ¿Quién no tiene aún medallas?


/* 
Buen deportista
Quiero saber si alguien es buen deportista
en el caso de la natación, si recorren más de 1.000 metros diarios o
    su estilo preferido es el crawl
en el caso del fútbol, si la diferencia de goles menos las expulsiones es más de 5
en el caso del rugby, si son wings o pilares
*/



/* 
y si agregamos el polo que solo sabemos el handicap del jugador, 
y es bueno si tiene un handicap mayor a 6
no tiene medallas
*/


% suma/2
% incrementar/1