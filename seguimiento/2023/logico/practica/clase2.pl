profesor(martin).

/*
 Tenemos los siguientes alumnos nicolas, malena, raul, carlos, santiago.
 - Queremos saber:
    - Si nicolas es alumno: ?- alumno(nicolas).
    - Si santiago es alumno: ?- alumno(santiago).
    - Quiénes son alumnos: ?- alumno(Alumno).
    - Si tenemos algún alumno: ?- alumno(_).
*/
% alumno/1
alumno(nicolas).
alumno(malena).
alumno(raul).
alumno(carlos).
alumno(santiago).
alumno(messi).

/*
 Tenemos las materias y sus anios
    - algoritmos, analisis1 (1ro)
    - pdep, sintaxis (2do)
 - Queremos saber
   - Si algoritmos está en 2do: ?- materia(algoritmos, 2).
   - En qué año está algoritmos: ?- materia(algoritmos, Año).
   - Cuáles son las materias de 2do: ?- materia(Materia, 2).
   - Materias de toda la carrera: ?- materia(Materia, Año).
*/

% materia(Nombre, Anio)
materia(algoritmos, 1).
materia(analisis1, 1).
materia(pdep, 2).
materia(sintaxis, 2).

/*
primero(algoritmos).
primero(analisis1).
segundo(pdep).
segundo(sintaxis).

anio(Materia, 1):- primero(Materia).
anio(Materia, 2):- segundo(Materia).
*/

% Queremos saber cuáles son los años (niveles) de la facu: ?- materia(_, Año).

/*
 Además de cada alumno conocemos la nota promedio de cada materia
    - nicolas pdep 10
    - nicolas proba 7
    - nicolas sintaxis 8
    - malena pdep 6
    - raul pdep 9

 - Queremos saber
   - Las notas de nicolas: ?- nota(nicolas, Materia, Nota).
   - Si rindió algún examen nico, pero en realidad podría ser cualquier alumno: ?- rindio(nicolas).
   - Qué materias aprobó malena: ?- aprobo(malena, Materia).
    - Queremos poder hacerlo muchas veces esta tarea pero con diferentes alumnos
   - Está al principio de la carrera si aún no rindió ningún examen
*/
% nota(Alumno, Materia, Nota).
nota(nicolas, pdep, 10).
nota(nicolas, proba, 7).
nota(nicolas, sintaxis, 8).
nota(malena, pdep, 6).
nota(raul, pdep, 9).
nota(messi, fulbo, 10).

rindio(Alumno):- nota(Alumno, _, _).

aprobo(Alumno, Materia):-
   nota(Alumno, Materia, Nota),
   Nota >= 6.

estaAlPrincipio(Alumno):-
   alumno(Alumno),
   not(rindio(Alumno)).

/*
   queremos saber si un alumno aprobo un anio
      aprobo todas las materias de un anio
        1. materias de un anio?
        2. aprobo materia?
*/