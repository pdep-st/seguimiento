/*
 Tenemos los siguientes alumnos nicolas, malena, raul, carlos, santiago.
 - Queremos saber:
    - Si nicolas es alumno: ...
    - Si santiago es alumno: ...
    - Quienes son alumnos: ...
    - Si tenemos algún alumno: ...
*/

alumno(nicolas).
alumno(malena).
alumno(raul).
alumno(carlos).
alumno(santiago).


/*
 Tenemos las materias y sus anios
    - algoritmos, analisis1 (1ro)
    - pdep, sintaxis (2do)
 - Queremos saber
   - Si algoritmos esta en 2do: ...
   - En que año esta algoritmos: ...
   - Cuales son las materias de 2do: ...
   - Materias de toda la carrera: ...
*/

%primerAnio(algoritmos, analisis).
%segundoAnio(pdep, sintaxis).

% materia/2
materia(algoritmos, 1).
materia(analisis1, 1).
materia(pdep, 2).
materia(sintaxis, 2).

% segundo(Materia):- materia(Materia, 2). 



% Queremos saber cuáles son los años (niveles) de la facu
anio(Anio) :- materia(_, Anio).

/*
 Además de cada alumno conocemos la nota promedio de cada materia
    - nicolas pdep 10
    - nicolas proba 7
    - nicolas sintaxis 8
    - malena pdep 6
    - raul pdep 9

 - Queremos saber
- Las notas de nicolas: ....
   - Si rindió algún examen nico, pero en realidad podría ser cualquier alumno
   - Qué materias aprobó malena
    - Queremos poder hacerlo muchas veces esta tarea pero con diferentes alumnos
   - Queremos saber si un alumno esta al principio de la carrera, esto es cuando aún no rindió ningún examen
*/       
 nota(nicolas, pdep, 10).
 nota(nicolas, proba, 7).
 nota(nicolas, sintaxis, 8).
 nota(malena, pdep, 6).
 nota(raul, pdep, 9).

rindio(Alumno):- nota(Alumno,_,_).
aprobo(Alumno, Materia):- nota(Alumno,Materia,Nota), Nota >= 6.

% Inversibilidad
estaAlPrincipio(Alumno) :- 
   alumno(Alumno), % generador
   not(rindio(Alumno)).
   

% existe(_).


/*
   queremos saber si un alumno aprobo un anio
      aprobo todas las materias de un anio
        1. materias de un anio?
        2. aprobo materia?
*/