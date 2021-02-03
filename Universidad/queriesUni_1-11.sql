SELECT COUNT(pe.id) AS numero_alumnos FROM persona AS pe WHERE tipo = 'alumno';
SELECT COUNT(id) AS numero_alumnos_1999 FROM persona WHERE YEAR(fecha_nacimiento) = 1999;
SELECT d.nombre, COUNT(*) AS numero_profesores FROM profesor AS p INNER JOIN departamento AS d ON d.id = p.id_departamento GROUP BY d.nombre ORDER BY numero_profesores DESC;
SELECT d.nombre AS departamento, COUNT(p.id_profesor) AS numero_profesores FROM profesor AS p RIGHT JOIN departamento AS d ON d.id = p.id_departamento GROUP BY d.nombre;
SELECT g.nombre, COUNT(a.nombre) AS numero_asignaturas FROM grado AS g LEFT JOIN asignatura AS a ON g.id = a.id_grado GROUP BY g.nombre ORDER BY numero_asignaturas DESC;
SELECT g.nombre, COUNT(a.nombre) AS numero_asignaturas FROM grado AS g LEFT JOIN asignatura AS a ON g.id = a.id_grado GROUP BY g.nombre HAVING numero_asignaturas > 40 ORDER BY numero_asignaturas DESC;
SELECT g.nombre, a.tipo, SUM(a.creditos) AS creditos_totales FROM grado AS g INNER JOIN asignatura AS a ON g.id = a.id_grado GROUP BY g.nombre, a.tipo;