/*
 Tenemos los siguientes alumnos nicolas, malena, raul, carlos, santiago.
 - Queremos saber:
    - Si nicolas es alumno:: ? alumno(nicolas).
    - Si santiago es alumno:: ? alumno(santiago).
    - Quienes son alumnos:: ? alumno(Alumno).
    - Si tenemos algún alumno:: ? alumno(_).
*/
alumno(nicolas).
alumno(malena).
alumno(raul).
alumno(carlos).
alumno(santiago).
alumno(celeste).

/*
 Tenemos las materias y sus anios
    - algoritmos, analisis1 (1ro)
    - pdep, sintaxis (2do)
 - Queremos saber
   - Si algoritmos esta en 2do:: ? materia(algoritmos, 2).
   - En que año esta algoritmos:: ? materia(algoritmos, Anio).
   - Cuales son las materias de 2do:: ? materia(Materia, 2).
   - Materias de toda la carrera:: ? materia(Materia, _).
*/
% materia(nombre, anio).

materia(algoritmos, 1).
materia(analisis1, 1).
materia(pdep, 2).
materia(sintaxis, 2).
materia(proba, 2).

% E materia(_, Anio) => anio(Anio).
anio(Anio) :- materia(_, Anio).

/*
 Además de cada alumno conocemos la nota promedio de cada materia
    - nicolas pdep 10
    - nicolas proba 7
    - nicolas sintaxis 8
    - malena pdep 6
    - raul pdep 9

notas(alumno, nota).


 - Queremos saber
- Las notas de nicolas:: ? nota(nicolas, Nota).
   - Si rindio algún examen nico, pero en realidad podría ser cualquier alumno
   - Que materias aprobo malena
    - Queremos poder hacerlo muchas veces esta tarea pero con diferentes alumnos
   - esta al principio de la carrera si aun no rindio ningún examen
*/

nota(nicolas, 10, pdep).
nota(nicolas, 7, proba).
nota(nicolas, 8, sintaxis).
nota(malena, 6, pdep).
nota(raul, 9, pdep).
nota(santiago, 2, pdep).
nota(celeste, 7, analisis1).
nota(celeste, 10, algoritmos).

rindioExamen(Alumno):- nota(Alumno, _, _).

examenAprobado(Alumno, Materia):- nota(Alumno, Nota, Materia), Nota >= 6.

estaAlPrincipioCarrera(Alumno):-
    alumno(Alumno),
    not(rindioExamen(Alumno)).


/*
   queremos saber si un alumno aprobo un anio
      aprobo todas las materias de un anio
        1. materias de un anio? ? materia(Materia, 2)
        2. aprobo materia ? examenAprobado(malena, Materia)
*/

aproboAnio(Alumno, Anio):-
    alumno(Alumno),
    anio(Anio),
    forall( 
        materia(Materia, Anio), 
        examenAprobado(Alumno, Materia)
    ).