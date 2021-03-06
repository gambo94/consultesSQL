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


