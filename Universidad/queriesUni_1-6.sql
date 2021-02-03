SELECT d.nombre, pe.apellido1, pe.apellido2, pe.nombre FROM profesor AS p LEFT JOIN departamento AS d ON p.id_departamento = d.id INNER JOIN persona AS pe ON p.id_profesor = pe.id ORDER BY d.nombre, pe.apellido1, pe.apellido2, pe.nombre;
SELECT pe.apellido1, pe.apellido2, pe.nombre FROM profesor AS p LEFT JOIN departamento AS d ON p.id_departamento = d.id INNER JOIN persona AS pe ON p.id_profesor = pe.id WHERE d.nombre IS NULL;
SELECT d.nombre FROM profesor AS p RIGHT JOIN departamento AS d ON p.id_departamento = d.id WHERE id_profesor IS NULL;
SELECT p.id_profesor, pe.nombre, pe.apellido1, pe.apellido2 FROM profesor AS p LEFT JOIN asignatura AS a ON p.id_profesor = a.id_profesor INNER JOIN persona AS pe ON p.id_profesor = pe.id WHERE a.nombre IS NULL;
SELECT a.nombre FROM profesor AS p RIGHT JOIN asignatura AS a ON a.id_profesor = p.id_profesor WHERE p.id_profesor IS NULL;
SELECT DISTINCT d.nombre FROM departamento AS d LEFT JOIN profesor AS p ON d.id = p.id_departamento LEFT JOIN asignatura AS a ON p.id_profesor = a.id_profesor WHERE a.nombre IS NULL AND a.curso IS NULL;

