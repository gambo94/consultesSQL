SELECT nombre AS productos FROM producto;
SELECT nombre, precio FROM producto;
SELECT * FROM producto;
SELECT nombre, CONCAT('€', precio), CONCAT('$', TRUNCATE((precio * 1.2), 2)) FROM producto;
SELECT nombre nom_de_producto, CONCAT('€', precio) euros, CONCAT('$', TRUNCATE((precio * 1.2), 2)) dolares FROM producto;
SELECT UPPER(nombre), precio FROM producto;
SELECT LOWER(nombre), precio FROM producto;
SELECT nombre, UPPER(LEFT(nombre, 2))  FROM fabricante;
SELECT nombre, ROUND(precio) FROM producto;
SELECT nombre, TRUNCATE(precio, 0) FROM producto;
SELECT codigo_fabricante FROM producto;
SELECT codigo_fabricante FROM producto GROUP BY codigo_fabricante;
SELECT nombre FROM fabricante ORDER BY nombre;
SELECT nombre FROM fabricante ORDER BY nombre DESC;
SELECT nombre, precio FROM producto ORDER BY nombre ASC, precio DESC;
SELECT * FROM fabricante LIMIT 5;
SELECT * FROM fabricante LIMIT 3, 2;
SELECT nombre, precio FROM producto ORDER BY precio LIMIT 1;
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;
SELECT nombre, codigo_fabricante FROM producto WHERE codigo_fabricante = 2;
SELECT p.nombre producto, p.precio, f.nombre fabricante FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo;
SELECT p.nombre producto, p.precio, f.nombre fabricante FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo ORDER BY fabricante;
SELECT p.codigo codigo_producto, p.nombre producto, f.codigo codigo_fabricador, f.nombre fabricante FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo;
SELECT p.nombre producto, p.precio, f.nombre fabricante FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo ORDER BY precio LIMIT 1;
SELECT p.nombre producto, p.precio, f.nombre fabricante FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo ORDER BY precio DESC LIMIT 1;
SELECT p.nombre producto FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Lenovo';
SELECT p.nombre producto FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Crucial' AND p.precio > 200;
SELECT p.nombre producto FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Hewlett-Packard' OR f.nombre = 'Asus' OR f.nombre = 'Seagate';
SELECT p.nombre producto, p.precio FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE RIGHT(f.nombre, 1) = 'e';
SELECT p.nombre producto, p.precio, f.nombre FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo_fabricante WHERE f.nombre LIKE '%w%';
SELECT p.nombre, p.precio, f.nombre FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE p.precio > 180 ORDER BY p.precio DESC, p.nombre ASC;
SELECT f.codigo, f.nombre FROM fabricante f INNER JOIN producto p ON f.codigo = p.codigo_fabricante;
SELECT f.codigo, f.nombre, p.nombre FROM fabricante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante;
SELECT f.codigo, f.nombre FROM fabricante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante WHERE p.codigo IS NULL;
SELECT nombre FROM producto WHERE codigo_fabricante = 2;
SELECT * FROM producto WHERE precio = (SELECT MAX(precio) FROM producto WHERE codigo_fabricante = 2);
SELECT nombre FROM producto WHERE precio = (SELECT MAX(precio) FROM producto WHERE codigo_fabricante = 2);
SELECT nombre FROM producto WHERE precio = (SELECT MIN(precio) FROM producto WHERE codigo_fabricante = 3);
SELECT * FROM producto WHERE precio >= (SELECT MAX(precio) FROM producto WHERE codigo_fabricante = 2);
SELECT * FROM producto WHERE codigo_fabricante = 1 AND precio > (SELECT AVG(precio) FROM producto WHERE codigo_fabricante = 1);
SELECT d.nombre, pe.apellido1, pe.apellido2, pe.nombre FROM profesor AS p LEFT JOIN departamento AS d ON p.id_departamento = d.id INNER JOIN persona AS pe ON p.id_profesor = pe.id ORDER BY d.nombre, pe.apellido1, pe.apellido2, pe.nombre;
SELECT pe.apellido1, pe.apellido2, pe.nombre FROM profesor AS p LEFT JOIN departamento AS d ON p.id_departamento = d.id INNER JOIN persona AS pe ON p.id_profesor = pe.id WHERE d.nombre IS NULL;
SELECT d.nombre FROM profesor AS p RIGHT JOIN departamento AS d ON p.id_departamento = d.id WHERE id_profesor IS NULL;
SELECT p.id_profesor, pe.nombre, pe.apellido1, pe.apellido2 FROM profesor AS p LEFT JOIN asignatura AS a ON p.id_profesor = a.id_profesor INNER JOIN persona AS pe ON p.id_profesor = pe.id WHERE a.nombre IS NULL;
SELECT a.nombre FROM profesor AS p RIGHT JOIN asignatura AS a ON a.id_profesor = p.id_profesor WHERE p.id_profesor IS NULL;
SELECT DISTINCT d.nombre FROM departamento AS d LEFT JOIN profesor AS p ON d.id = p.id_departamento LEFT JOIN asignatura AS a ON p.id_profesor = a.id_profesor WHERE a.nombre IS NULL AND a.curso IS NULL;
SELECT apellido1, apellido2, nombre FROM persona WHERE tipo = 'alumno' ORDER BY apellido1, apellido2, nombre; 
SELECT nombre, apellido1, apellido2 FROM persona WHERE tipo = 'alumno' AND telefono IS NULL;
SELECT apellido1, apellido2, nombre FROM persona WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = '1999';
SELECT apellido1, apellido2, nombre, nif FROM persona WHERE tipo = 'profesor' AND telefono IS NULL AND RIGHT(nif, 1) = 'K';
SELECT nombre FROM asignatura WHERE cuatrimestre = 1 AND id_grado = 7 AND curso = 3;
SELECT pe.apellido1, pe.apellido2, pe.nombre, d.nombre AS departamento FROM persona AS pe INNER JOIN profesor AS pr ON pe.id = pr.id_profesor INNER JOIN departamento AS d ON pr.id_departamento = d.id ORDER BY pe.apellido1, pe.apellido2, pe.nombre, d.nombre;
SELECT a.nombre AS asignatura, ce.anyo_inicio AS anyinici, ce.anyo_fin AS anyfin, p.nombre AS alumno FROM asignatura AS a INNER JOIN alumno_se_matricula_asignatura AS asma ON a.id = asma.id_asignatura INNER JOIN curso_escolar AS ce ON asma.id_curso_escolar = ce.id INNER JOIN persona as p ON asma.id_alumno = p.id WHERE p.nif = '26902806M';
SELECT d.nombre AS departamento FROM profesor AS p INNER JOIN departamento AS d ON d.id = p.id_departamento INNER JOIN persona AS pe ON p.id_profesor = pe.id INNER JOIN asignatura AS a ON a.id = p.id_profesor INNER JOIN grado AS g ON g.id = a.id_grado WHERE g.nombre LIKE '%Ingeniería Informática (Plan 2015)';
SELECT pe.id, pe.nombre, pe.apellido1, pe.apellido2 FROM persona AS pe INNER JOIN alumno_se_matricula_asignatura AS asma ON pe.id = asma.id_alumno INNER JOIN asignatura AS a ON asma.id_asignatura = a.id INNER JOIN curso_escolar AS ce ON asma.id_curso_escolar = ce.id WHERE ce.anyo_inicio = 2018 AND ce.anyo_fin = 2019 GROUP BY pe.id, pe.nombre, pe.apellido1, pe.apellido2;
SELECT COUNT(pe.id) AS numero_alumnos FROM persona AS pe WHERE tipo = 'alumno';
SELECT COUNT(id) AS numero_alumnos_1999 FROM persona WHERE YEAR(fecha_nacimiento) = 1999;
SELECT d.nombre, COUNT(*) AS numero_profesores FROM profesor AS p INNER JOIN departamento AS d ON d.id = p.id_departamento GROUP BY d.nombre ORDER BY numero_profesores DESC;
SELECT d.nombre AS departamento, COUNT(p.id_profesor) AS numero_profesores FROM profesor AS p RIGHT JOIN departamento AS d ON d.id = p.id_departamento GROUP BY d.nombre;
SELECT g.nombre, COUNT(a.nombre) AS numero_asignaturas FROM grado AS g LEFT JOIN asignatura AS a ON g.id = a.id_grado GROUP BY g.nombre ORDER BY numero_asignaturas DESC;
SELECT g.nombre, COUNT(a.nombre) AS numero_asignaturas FROM grado AS g LEFT JOIN asignatura AS a ON g.id = a.id_grado GROUP BY g.nombre HAVING numero_asignaturas > 40 ORDER BY numero_asignaturas DESC;
SELECT g.nombre, a.tipo, SUM(a.creditos) AS creditos_totales FROM grado AS g INNER JOIN asignatura AS a ON g.id = a.id_grado GROUP BY g.nombre, a.tipo;


