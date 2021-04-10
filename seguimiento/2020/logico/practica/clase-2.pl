/*
 Tenemos los siguientes alumnos nicolas, malena, raul, carlos, santiago.
 - Queremos saber:
    - Si nicolas es alumno
    - Si santiago es alumno
    - Quienes son alumnos
    - Si tenemos algún alumno
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
   - Si algoritmos esta en 2do
   - En que año esta algoritmos
   - Cuales son las materias de 2do
*/
estaEnNivel(algoritmos, 1).
estaEnNivel(analisis1, 1).
estaEnNivel(pdep, 2).
estaEnNivel(sintaxis, 2).
estaEnNivel(proba, 2).

nivel(Nivel):-
   estaEnNivel(_, Nivel).

/*
 Además de cada alumno conocemos la nota promedio de cada materia
    - nicolas pdep 10
    - nicolas proba 7
    - nicolas sintaxis 8
    - malena pdep 6
    - raul pdep 9

 - Queremos saber
   - Las notas de nicolas
   - Si rindio algún examen nico, pero en realidad podría ser cualquier alumno
   - Si aprobo malena algún examen
    - Queremos poder hacerlo muchas veces esta tarea pero con diferentes alumnos
   - esta al principio de la carrera si aun no rindio ningún examen
*/

%% nota/3 relaciona una persona, con una materia, con una nota
nota(nicolas, pdep, 10).
nota(nicolas, proba, 7).
nota(nicolas, sintaxis, 8).
nota(malena, pdep, 6).
nota(raul, pdep, 9).
nota(carlos, analisis1, 8).
nota(carlos, algoritmos).

aprobo(Alumno, Materia) :-
   nota(Alumno, Materia, Nota),
   Nota >= 6.

rindio(Alguien):-nota(Alguien, _, _).

principioDeLaCarrera(Alguien):-
   alumno(Alguien),
   not(rindio(Alguien)).

% not/1 es un predicado de orden superior
% porque recibe una consulta!

/*
   queremos saber si un alumno aprobo un anio
      aprobo todas las materias de un anio
*/

terminoAnio(sofia, Anio):-
   nivel(Anio).

%terminoAnio(sofia, 1).
terminoAnio(Alumno, Anio):-
   nivel(Anio),
   alumno(Alumno),
   forall(
      estaEnNivel(Materia, Anio),
      aprobo(Alumno, Materia)   
   ).