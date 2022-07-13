% Messi nació el 24/06/1987

% Nació messi?
% Cuándo nació una persona?

/*
Anto Rocuzzo, cliente número 99102, compró una TV de 80' pagando 200.000
Mateo Messi, cliente número 3, compró heladera con freezer y 2 puertas pagando 300.000
Fideo Di María, cliente 11, compró una TV de 40' a 80.000
*/

% Qué clientes hicieron compras?
% ? - 
% Qué productos fueron comprados por más de 100.000?
% ? - 
% Existe alguna tv de 80'?
% ? - 

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
masMedallas(Deportista):-
    medallas(Deportista, Medallas),
    forall(
        (
            medallas(OtroDeportista, OtrasMedallas),
            OtroDeportista \= Deportista
        ),
        Medallas >= OtrasMedallas    
    ).

% ¿Quién no tiene aún medallas?


/* 
Buen deportista
Quiero saber si alguien es buen deportista
en el caso de la natación, si recorren más de 1.000 metros diarios o su estilo preferido es el crawl
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