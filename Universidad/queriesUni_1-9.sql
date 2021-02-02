SELECT apellido1, apellido2, nombre FROM persona WHERE tipo = 'alumno' ORDER BY apellido1, apellido2, nombre; 
SELECT nombre, apellido1, apellido2 FROM persona WHERE tipo = 'alumno' AND telefono IS NULL;
SELECT apellido1, apellido2, nombre FROM persona WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = '1999';
SELECT apellido1, apellido2, nombre, nif FROM persona WHERE tipo = 'profesor' AND telefono IS NULL AND RIGHT(nif, 1) = 'K';
SELECT nombre FROM asignatura WHERE cuatrimestre = 1 AND id_grado = 7 AND curso = 3;
SELECT pe.apellido1, pe.apellido2, pe.nombre, d.nombre AS departamento FROM persona AS pe INNER JOIN profesor AS pr ON pe.id = pr.id_profesor INNER JOIN departamento AS d ON pr.id_departamento = d.id ORDER BY pe.apellido1, pe.apellido2, pe.nombre, d.nombre;
SELECT a.nombre AS asignatura, ce.anyo_inicio AS anyinici, ce.anyo_fin AS anyfin, p.nombre AS alumno FROM asignatura AS a INNER JOIN alumno_se_matricula_asignatura AS asma ON a.id = asma.id_asignatura INNER JOIN curso_escolar AS ce ON asma.id_curso_escolar = ce.id INNER JOIN persona as p ON asma.id_alumno = p.id WHERE p.nif = '26902806M';
SELECT d.nombre AS departamento FROM profesor AS p INNER JOIN departamento AS d ON d.id = p.id_departamento INNER JOIN persona AS pe ON p.id_profesor = pe.id INNER JOIN asignatura AS a ON a.id = p.id_profesor INNER JOIN grado AS g ON g.id = a.id_grado WHERE g.nombre LIKE '%Ingeniería Informática (Plan 2015)';
SELECT pe.id, pe.nombre, pe.apellido1, pe.apellido2 FROM persona AS pe INNER JOIN alumno_se_matricula_asignatura AS asma ON pe.id = asma.id_alumno INNER JOIN asignatura AS a ON asma.id_asignatura = a.id INNER JOIN curso_escolar AS ce ON asma.id_curso_escolar = ce.id WHERE ce.anyo_inicio = 2018 AND ce.anyo_fin = 2019 GROUP BY pe.id, pe.nombre, pe.apellido1, pe.apellido2;

