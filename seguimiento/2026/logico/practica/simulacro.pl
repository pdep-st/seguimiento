/*
Kyle es asalariado, trabaja 6 horas y gana 50
Sherri es asalariada, trabaja 7 horas y gana 60
Gus es asalariado, trabaja 8 horas y gana 60
Ian es jefe, tiene a su cargo a Kyle, Rob y Ginger, y gana 40
Trisha es jefa, tiene a su cargo a Ian y Gus y gana 90
Joshua es independiente, trabaja de arquitecto y gana 55
*/
gana(kyle, 50).
gana(sherri, 60).
gana(gus, 60).
gana(ian, 40).
gana(trisha, 90).
gana(joshua, 55).

trabajaEn(kyle, ventas).
trabajaEn(sherri, logistica).
trabajaEn(gus, ventas).
trabajaEn(ian, logistica).
trabajaEn(trisha, ventas).
trabajaEn(joshua, ventas).

% reorganizar(Presupuesto, Sobrante, NuevaOrganizacion).
% reorganizar(150, Sobrante, NuevaOrganizacion)
% -> NuevaOrganizacion = [kyle, trisha], Sobrante = 10

reorganizar(Presupuesto, Equipo, Sobrante):-
    posibleEquipo(Equipo, SueldoEquipo),
    Presupuesto >= SueldoEquipo,
    Sobrante is Presupuesto - SueldoEquipo.

posibleEquipo(Equipo, SueldoEquipo):-
    empleados(Empleados),
    subconjunto(Empleados, Equipo),
    length(Equipo, Cantidad),
    Cantidad >= 2,
    sueldoEquipo(Equipo, SueldoEquipo).

empleados(Empleados):-
    findall(Empleado, gana(Empleado, _), Empleados).

sueldoEquipo(Equipo, SueldoEquipo):-
    findall(Sueldo, (member(Empleado, Equipo), gana(Empleado, Sueldo)), Sueldos),
    sum_list(Sueldos, SueldoEquipo).

subconjunto([], []).
subconjunto([Empleado|Empleados], [Empleado|Equipo]):-
    subconjunto(Empleados, Equipo).
subconjunto([_|Empleados], Equipo):-
    subconjunto(Empleados, Equipo).