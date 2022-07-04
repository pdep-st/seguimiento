profesor(martin).
profesor(inia).

/*
 Tenemos los siguientes alumnos nicolas, malena, raul, carlos, santiago.
 - Queremos saber:
    - Si nicolas es alumno: ?- alumno(nicolas).
    - Si santiago es alumno: ?- alumno(santiago).
    - Quiénes son alumnos: ?- alumno(Alumno).
    - Si tenemos algún alumno: ?- alumno(_).
*/

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
   - Si algoritmos esta en 2do: ?- materia(algoritmos, 2).
   - En qué año está algoritmos: ?- materia(algoritmos, Anio).
   - Cuáles son las materias de 2do: ?- materia(Materia, 2).
   - Materias de toda la carrera: ?- materia(Materia, _).
*/

% materia(Materia, Anio).

materia(algoritmos, 1).
materia(analisis1, 1).
materia(pdep, 2).
materia(sintaxis, 2).
materia(proba, 2).

% Queremos saber cuáles son los años (niveles) de la facu: ?- materia(_, Anio).

anio(Anio):- materia(_, Anio).

/*
 Además de cada alumno conocemos la nota promedio de cada materia
    - nicolas pdep 10
    - nicolas proba 7
    - nicolas sintaxis 8
    - malena pdep 6
    - raul pdep 9
    - raul analisis1 2

- Queremos saber
- Las notas de nicolas: ?- examen(nicolas, _, Nota).
- Si rindió algún examen nico, pero en realidad podría ser cualquier alumno
?- rindio(nicolas).
- Qué materias aprobó malena, pero en realidad podría ser cualquier alumno
?- aprobo(malena, Materia).
- Está al principio de la carrera si aún no rindió ningún examen
?- estaAlPrincipio(Alumno).
- Quién desaprobó algún examen (y sin usar aprobo?)
*/

% examen(Alumno, Materia, Nota).

examen(nicolas, pdep, 10).
examen(nicolas, proba, 7).
examen(nicolas, sintaxis, 8).
examen(malena, pdep, 6).
examen(raul, pdep, 9).
examen(raul, analisis1, 2).
examen(malena, analisis1, 8).
examen(carlos, pdep, 2).
examen(nicolas, algoritmos, 8).
examen(malena, algoritmos, 6).

% rindio(Alumno).
rindio(Alumno):- examen(Alumno, _, _).

% aprobo(Alumno, Materia)
aprobo(Alumno, Materia):- 
   examen(Alumno, Materia, Nota),
   Nota >= 6.

desaprobo(Alumno, Materia):-
   examen(Alumno, Materia, _),
   not(aprobo(Alumno, Materia)).

/*
desaprobo(Alumno, Materia):-
   examen(Alumno, Materia, _),
   not((examen(Alumno, Materia, Nota), Nota >= 6)).

desaprobo(Alumno, Materia):- 
   examen(Alumno, Materia, Nota),
   Nota < 6.
*/

% estaAlPrincipio(Alumno).

estaAlPrincipio(Alumno):- 
   alumno(Alumno),
   noRindio(Alumno).

noRindio(Alumno):- not(rindio(Alumno)).
   

/*
   queremos saber si un alumno aprobó un anio
      aprobó todas las materias de un anio
        1. materias de un anio?
        2. aprobo materia?
*/

% aproboAnio(Alumno, Anio).

aproboAnio(Alumno, Anio):-
   alumno(Alumno),
   anio(Anio),
   forall(
      materia(Materia, Anio),
      aprobo(Alumno, Materia)
   ).
