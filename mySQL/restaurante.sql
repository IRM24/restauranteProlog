CREATE DATABASE restaurante;
USE restaurante;

-- Creacion Tablas ---------------------

CREATE TABLE bebida
 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    carbonatadas VARCHAR(100) NOT NULL,
    naturales VARCHAR(100) NOT NULL,
    temperatura VARCHAR(100) NOT NULL,
    desayuno VARCHAR(100) NOT NULL,
    almuerzo VARCHAR(100) NOT NULL,
    cena VARCHAR(100) NOT NULL,
    calorias INT NOT NULL,
    precio INT NOT NULL
);

CREATE TABLE proteina (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    tipo varchar(50),
    desayuno VARCHAR(100) NOT NULL,
    almuerzo VARCHAR(100) NOT NULL,
    cena VARCHAR(100) NOT NULL,
    calorias INT NOT NULL,
    precio INT NOT NULL
);

CREATE TABLE acompannamiento (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    temperatura VARCHAR(100) NOT NULL,
    carbohidratos VARCHAR(100) NOT NULL,
    vegetales VARCHAR(100) NOT NULL,
    desayuno VARCHAR(100) NOT NULL,
    almuerzo VARCHAR(100) NOT NULL,
    cena VARCHAR(100) NOT NULL,
    calorias INT NOT NULL,
    precio INT NOT NULL
);
CREATE TABLE postre (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    lacteo VARCHAR(100) NOT NULL,
    frutas VARCHAR(100) NOT NULL,
    desayuno VARCHAR(100) NOT NULL,
    almuerzo VARCHAR(100) NOT NULL,
    cena VARCHAR(100) NOT NULL,
    calorias INT NOT NULL,
    precio INT NOT NULL
);

CREATE TABLE plato (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    proteina VARCHAR(100) NOT NULL,
	acompannamiento1 VARCHAR(100),
	acompannamiento2 VARCHAR(100),
	acompannamiento3 VARCHAR(100),
    calorias INT NOT NULL,
    precio INT NOT NULL
);

CREATE TABLE combo (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    proteina VARCHAR(100) NOT NULL,
	acompannamiento1 VARCHAR(100),
	acompannamiento2 VARCHAR(100),
	acompannamiento3 VARCHAR(100),
    bebida VARCHAR(100) NOT NULL,
    postre VARCHAR(100) NOT NULL,
    calorias INT NOT NULL,
    precio INT NOT NULL
);

CREATE TABLE factura (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATE,
    monto_total DOUBLE
);

CREATE TABLE orden (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATE,
    detalle VARCHAR(250)
);
-- Inserts Bebidas -------------------------------------------------------------------------------------
INSERT INTO bebida (nombre, carbonatadas, naturales, temperatura, desayuno, almuerzo, cena, calorias, precio)
VALUES ('Jugo de Naranja', 'No', 'Si', 'Fria', 'Si', 'Si', 'Si', 110, 1800);

INSERT INTO bebida (nombre, carbonatadas, naturales, temperatura, desayuno, almuerzo, cena, calorias, precio)
VALUES ('Café', 'No', 'No', 'Caliente', 'Si', 'No', 'No', 10, 1500);

INSERT INTO bebida (nombre, carbonatadas, naturales, temperatura, desayuno, almuerzo, cena, calorias, precio)
VALUES ('Chocolate', 'No', 'No', 'Caliente', 'Si', 'No', 'No', 180, 1600);

INSERT INTO bebida (nombre, carbonatadas, naturales, temperatura, desayuno, almuerzo, cena, calorias, precio)
VALUES ('Coca-cola', 'Si', 'No', 'Fria', 'No', 'Si', 'Si', 150,180);

INSERT INTO bebida (nombre, carbonatadas, naturales, temperatura, desayuno, almuerzo, cena, calorias, precio)
VALUES ('Sprite', 'Si', 'No', 'Fria', 'No', 'Si', 'Si', 130, 1800);

INSERT INTO bebida (nombre, carbonatadas, naturales, temperatura, desayuno, almuerzo, cena, calorias, precio)
VALUES ('Te Negro', 'No', 'Si', 'Caliente', 'Si', 'Si', 'Si', 8, 1500);

INSERT INTO bebida (nombre, carbonatadas, naturales, temperatura, desayuno, almuerzo, cena, calorias, precio)
VALUES ('Limonada con Hierbabuena', 'No', 'Si', 'Fria', 'Si', 'Si', 'Si', 115, 2200);

INSERT INTO bebida (nombre, carbonatadas, naturales, temperatura, desayuno, almuerzo, cena, calorias, precio)
VALUES ('Dr.Pepper', 'Si', 'No', 'Fria', 'No', 'Si', 'Si', 170, 1800);

INSERT INTO bebida (nombre, carbonatadas, naturales, temperatura, desayuno, almuerzo, cena, calorias, precio)
VALUES ('Agua', 'No', 'Si', 'Fria', 'Si', 'Si', 'Si', 0, 0);

select  * from bebida;
-- Inserts Proteinas ---------------------------------------------------------------------------------
INSERT INTO proteina (nombre, tipo, desayuno, almuerzo, cena, calorias, precio)
VALUES ('Salchichas', 'Carnes Rojas', 'Si', 'No', 'No', 210, 1750);

INSERT INTO proteina (nombre, tipo, desayuno, almuerzo, cena, calorias, precio)
VALUES ('Tocineta', 'Carnes Rojas', 'Si', 'No', 'No', 180, 2100);

INSERT INTO proteina (nombre, tipo, desayuno, almuerzo, cena, calorias, precio)
VALUES ('Jamon', 'Carnes Rojas', 'Si', 'No', 'No', 165, 1600);

INSERT INTO proteina (nombre, tipo, desayuno, almuerzo, cena, calorias, precio)
VALUES ('Filete de res', 'Carnes Rojas', 'No', 'Si', 'Si', 250, 2800);

INSERT INTO proteina (nombre, tipo, desayuno, almuerzo, cena, calorias, precio)
VALUES ('Camarones', 'Mariscos', 'No', 'Si', 'Si', 150, 3100);

INSERT INTO proteina (nombre, tipo, desayuno, almuerzo, cena, calorias, precio)
VALUES ('Pechuga de Pollo', 'Pollo', 'No', 'Si', 'Si', 180, 2300);

INSERT INTO proteina (nombre, tipo, desayuno, almuerzo, cena, calorias, precio)
VALUES ('Albondigas', 'Carnes Rojas', 'No', 'Si', 'Si', 180, 2300);

INSERT INTO proteina (nombre, tipo, desayuno, almuerzo, cena, calorias, precio)
VALUES ('Costilla de cerdo', 'Carnes Rojas', 'No', 'Si', 'Si', 300, 3000);

INSERT INTO proteina (nombre, tipo, desayuno, almuerzo, cena, calorias, precio)
VALUES ('Salmón Ahumado', 'Mariscos', 'No', 'No', 'Si', 220, 3600);

INSERT INTO proteina (nombre, tipo, desayuno, almuerzo, cena, calorias, precio)
VALUES ('Pollo Frito', 'Pollo', 'No', 'Si', 'Si', 310, 2300);

INSERT INTO proteina (nombre, tipo, desayuno, almuerzo, cena, calorias, precio)
VALUES ('Pierna de Cordero', 'Carnes Rojas', 'No', 'Si', 'Si', 290, 3400);

INSERT INTO proteina (nombre, tipo, desayuno, almuerzo, cena, calorias, precio)
VALUES ('Langosta', 'Mariscos', 'No', 'Si', 'Si', 270, 3500);

INSERT INTO proteina (nombre, tipo, desayuno, almuerzo, cena, calorias, precio)
VALUES ('Chorizo', 'Carnes Rojas', 'Si', 'Si', 'No', 300, 200);

Delete from proteina;
SELECT * FROM proteina;

-- Insert Acompannamientos --------------------------------------------------------

INSERT INTO acompannamiento (nombre, temperatura, carbohidratos, vegetales, desayuno, almuerzo, cena, calorias, precio)
VALUES
    ('Pan tostado', 'Caliente', 'Si', 'No', 'Si', 'No', 'No', 85, 750),
    ('Huevos', 'Caliente', 'Si', 'No', 'Si', 'No', 'No', 95, 800),
    ('Waffles', 'Caliente', 'Si', 'No', 'Si', 'No', 'No', 100, 1800),
    ('Avena', 'Frio', 'Si', 'No', 'Si', 'No', 'No', 90, 900),
    ('Frutas Frescas', 'Frio', 'Si', 'No', 'Si', 'No', 'No', 50, 1250),
    ('Queso', 'Frio', 'No', 'No', 'Si', 'No', 'No', 80, 950),
    ('Croissants', 'Caliente', 'Si', 'No', 'Si', 'No', 'No', 180, 1000),
    ('Pancakes', 'Caliente', 'Si', 'No', 'Si', 'No', 'No', 100, 1800);

INSERT INTO acompannamiento (nombre, temperatura, carbohidratos, vegetales, desayuno, almuerzo, cena, calorias, precio)
VALUES
    ('Arroz blanco','Caliente', 'Si', 'No', 'No', 'Si', 'Si', 190, 1200),
    ('Arroz integral','Caliente', 'Si', 'No', 'No', 'Si', 'Si', 160, 1200),
    ('Papas Fritas','Caliente', 'Si', 'Si', 'No', 'Si', 'Si', 230, 1400),
    ('Hongos Salteados','Caliente', 'NO', 'Si', 'No', 'Si', 'Si', 110, 1500),
    ('Pasta Pesto','Caliente', 'Si', 'Si', 'No', 'Si', 'Si', 220, 2000),
    ('Pasta Pomodoro','Caliente', 'Si', 'Si', 'No', 'Si', 'Si', 230, 1800),
	('Pure de papa','Caliente', 'Si', 'Si', 'No', 'Si', 'Si', 160, 1500),
    ('Tofu Salteado','Caliente', 'No', 'No', 'No', 'Si', 'Si', 140, 2500),
    ('Berenjenas a la parrilla','Caliente', 'No', 'Si', 'No', 'Si', 'Si', 130, 1750),
    ('Hummus','Frio', 'Si', 'No', 'No', 'Si', 'Si', 175, 2500),
    ('Ensalada Verde','Frio', 'No', 'Si', 'No', 'Si', 'Si', 80, 2100),
    ('Ensalada de Pasta','Frio', 'Si', 'No', 'No', 'Si', 'Si', 150, 2300),
    ('Ensalada Cesar','Frio', 'No', 'Si', 'No', 'Si', 'Si', 130, 2600),
    ('Ensalada de Garbanzos','Frio', 'Si', 'Si', 'No', 'Si', 'Si', 110, 2500);

-- select * from postre;
-- delete from acompannamiento;
-- Inserts de postres -------------------------------------------------
INSERT INTO postre (nombre, lacteo, frutas, desayuno, almuerzo, cena, calorias, precio)
VALUES
   ('Yogurt con frutas', 'Si', 'Si','Si', 'No', 'No', 150, 1500),
   ('Tostadas Francesas', 'No', 'Si','Si', 'Si', 'No', 190, 2100),
   ('Muffins', 'Si', 'Si','Si', 'Si', 'No', 200, 1500),
   ('Tartaleta de Frambuesa', 'Si', 'Si','Si', 'Si', 'Si', 210, 1700),
   ('Galletas', 'Si', 'No','Si', 'No', 'No', 170, 800),
   ('Crepa con fresas', 'No', 'Si','Si', 'Si', 'Si', 250, 2500);

INSERT INTO postre (nombre, lacteo, frutas, desayuno, almuerzo, cena, calorias, precio)
VALUES
    ('Flan de caramelo', 'Si', 'No', 'No', 'Si', 'Si', 250, 2100),
    ('Tarta de manzana', 'No', 'Si', 'No', 'Si', 'Si', 300, 2500),
    ('Gelatina de frutas', 'No', 'Si', 'Si', 'Si', 'No', 120, 1500);

INSERT INTO postre (nombre, lacteo, frutas, desayuno, almuerzo, cena, calorias, precio)
VALUES
    ('Helado de vainilla', 'Si', 'No', 'No', 'Si', 'Si', 220, 1100),
    ('Pastel de chocolate', 'Si', 'No','No',  'Si', 'Si', 350, 2500),
    ('Pie de Limon', 'Si', 'Si','No',  'Si', 'Si', 270, 2200),
    ('Tiramisú', 'Si', 'No','No',  'Si', 'Si', 250, 2300),
    ('Mousse de chocolate', 'Si', 'No','No',  'Si', 'Si', 320, 2200),
    ('Gelato', 'No', 'No','No',  'Si', 'Si', 110, 2200),
    ('Cheesecake', 'Si', 'No','No', 'Si', 'Si', 310, 2500);
    
-- insert platos ------------
INSERT INTO plato (nombre, proteina, acompannamiento1, acompannamiento2, acompannamiento3, calorias, precio)
VALUES ('Plato Fuerte 1','Salmón Ahumado', 'Ensalada Verde', 'Arroz blanco', 'Pasta Pesto',510, 7500);

INSERT INTO plato (nombre, proteina, acompannamiento1, acompannamiento2, acompannamiento3, calorias, precio)
VALUES ('Plato Fuerte 2','Filete de res', 'Pure de papa', 'Ensalada Cesar','Tofu Salteado',600, 6000);

INSERT INTO plato (nombre, proteina, acompannamiento1, acompannamiento2, acompannamiento3, calorias, precio)
VALUES ('Plato Fuerte 3','Tocineta', 'Pan tostado', 'Frutas Frescas','Pancakes', 480, 4500);

INSERT INTO plato (nombre, proteina, acompannamiento1, acompannamiento2, acompannamiento3, calorias, precio)
VALUES ('Plato Fuerte 4','Pollo Frito', 'Pure de papa', 'Arroz blanco','Ensalada Verde', 620, 5800);

-- insert combos ------------

INSERT INTO combo (nombre, proteina, acompannamiento1, acompannamiento2, acompannamiento3, bebida, postre, calorias, precio)
VALUES ('Combo 1','Costilla de cerdo', 'Ensalada Cesar', 'Hummus', 'Tofu Salteado', 'Coca-cola','Flan de Caramelo', 800, 8500);

INSERT INTO combo (nombre, proteina, acompannamiento1, acompannamiento2, acompannamiento3, bebida, postre, calorias, precio)
VALUES ('Combo 2','Salchichas', 'Pancakes','Frutas Frescas', 'Pan tostado','Jugo de Naranja','Tostadas Francesas', 570, 7500);

INSERT INTO combo (nombre, proteina, acompannamiento1, acompannamiento2, acompannamiento3, bebida, postre, calorias, precio)
VALUES ('Combo 3','Albondigas', 'Pure de papa','Ensalada Verde', 'Arroz blanco','Limonada con Hierbabuena','Cheesecake', 860, 7000);


-- insert Factura --------
INSERT INTO factura (fecha, monto_total) VALUES ('2022-1-9', 25000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2022-1-15', 35000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2022-1-15', 9000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2022-1-29', 8000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2022-2-1', 15000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2022-2-17', 16500.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2022-2-28', 30000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2022-3-2', 3500.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2022-3-8', 12000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2022-3-20', 7000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2022-3-29', 25000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2022-4-2', 20000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2022-4-17', 9000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2022-5-7', 5500.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2022-5-16', 18000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2022-5-22', 40000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2022-5-28', 10000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2022-5-28', 7000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2022-6-1', 6000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2022-6-20', 18000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2022-7-2', 12000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2022-7-14', 15000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2022-7-17', 23000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2022-7-29', 34000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2022-8-5', 9000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2022-8-14', 10000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2022-8-23', 25000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2022-9-1', 7500.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2022-9-10', 9000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2022-9-18', 35000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2022-9-28', 18000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2022-10-1', 11000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2022-10-1', 7000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2022-10-21', 6000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2022-11-3', 29000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2022-11-15', 15000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2022-11-28', 19000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2022-12-1', 20000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2022-12-7', 7000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2022-12-25', 6000.0);

INSERT INTO factura (fecha, monto_total) VALUES ('2023-1-1', 12000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2023-1-15', 35000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2023-1-15', 7500.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2023-1-28', 8000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2023-2-9', 15000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2023-2-12', 16500.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2023-2-28', 30000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2023-3-2', 9500.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2023-3-9', 10000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2023-3-20', 7000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2023-3-29', 25000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2023-4-2', 20000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2023-4-15', 8000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2023-5-7', 5500.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2023-5-13', 12000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2023-5-21', 30000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2023-5-21', 10000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2023-5-28', 9000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2023-6-2', 6000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2023-6-17', 7000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2023-7-1', 12000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2023-7-14', 15000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2023-7-17', 23000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2023-7-28', 34000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2023-8-5', 8000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2023-8-14', 10000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2023-8-23', 25000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2023-9-4', 7500.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2023-9-10', 9000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2023-9-18', 15000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2023-9-28', 18000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2023-10-1', 20000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2023-10-7', 7000.0);
INSERT INTO factura (fecha, monto_total) VALUES ('2023-10-21', 6000.0);

-- Insert orden ----------------------
INSERT INTO orden (fecha, detalle) VALUES ('2022-1-1', "Nombre:'Plato Fuerte 1', Salmón Ahumado', Ensalada Verde', Arroz blanco', Pasta Pesto' Calorias:, 510 Precio:, 7500");
INSERT INTO orden (fecha, detalle) VALUES ('2022-2-21', "Nombre:'Nombre:'Combo 2', Salchichas', Pancakes', Frutas Frescas', Pan tostado', Jugo de Naranja', Tostadas Francesas', Calorias:570, Precio:7500");
INSERT INTO orden (fecha, detalle) VALUES ('2022-3-2', "Nombre:'Plato Fuerte 3', Tocineta', Pan tostado', Frutas Frescas', Pancakes' Calorias:, 480 Precio:, 4500");
INSERT INTO orden (fecha, detalle) VALUES ('2022-9-10', "Nombre:'Plato Fuerte 3', Tocineta', Pan tostado', Frutas Frescas', Pancakes' Calorias:, 480 Precio:, 4500");
INSERT INTO orden (fecha, detalle) VALUES ('2022-7-15', "Nombre:'Nombre:'Combo 2', Salchichas', Pancakes', Frutas Frescas', Pan tostado', Jugo de Naranja', Tostadas Francesas', Calorias:570, Precio:7500");
INSERT INTO orden (fecha, detalle) VALUES ('2022-8-6', "Nombre:'Nombre:'Combo 2', Salchichas', Pancakes', Frutas Frescas', Pan tostado', Jugo de Naranja', Tostadas Francesas', Calorias:570, Precio:7500");


INSERT INTO orden (fecha, detalle) VALUES ('2023-1-1', "Nombre:'Plato Fuerte 3', Tocineta', Pan tostado', Frutas Frescas', Pancakes' Calorias:, 480 Precio:, 4500");
INSERT INTO orden (fecha, detalle) VALUES ('2023-2-21', "Nombre:'Plato Fuerte 3', Tocineta', Pan tostado', Frutas Frescas', Pancakes' Calorias:, 480 Precio:, 4500");
INSERT INTO orden (fecha, detalle) VALUES ('2023-3-5', "Nombre:'Combo 3', Albondigas', Pure de papa', Ensalada Verde', Arroz blanco', Limonada con Hierbabuena', Cheesecake', Calorias:860, Precio:7000");
INSERT INTO orden (fecha, detalle) VALUES ('2023-5-8', "Nombre:'Nombre:'Combo 3', Albondigas', Pure de papa', Ensalada Verde', Arroz blanco', Limonada con Hierbabuena', Cheesecake', Calorias:860, Precio:7000");
INSERT INTO orden (fecha, detalle) VALUES ('2023-6-22', "Nombre:'Plato Fuerte 3', Tocineta', Pan tostado', Frutas Frescas', Pancakes' Calorias:, 480 Precio:, 4500");
INSERT INTO orden (fecha, detalle) VALUES ('2023-8-3', "Nombre:'Plato Fuerte 3', Tocineta', Pan tostado', Frutas Frescas', Pancakes' Calorias:, 480 Precio:, 4500");
INSERT INTO orden (fecha, detalle) VALUES ('2023-9-30', "Nombre:'Combo 3', Albondigas', Pure de papa', Ensalada Verde', Arroz blanco', Limonada con Hierbabuena', Cheesecake', Calorias:860, Precio:7000");
INSERT INTO orden (fecha, detalle) VALUES ('2022-10-1', "Nombre:'Nombre:'Combo 2', Salchichas', Pancakes', Frutas Frescas', Pan tostado', Jugo de Naranja', Tostadas Francesas', Calorias:570, Precio:7500");


delete  from orden;
select * from orden;


DELIMITER //

CREATE PROCEDURE BuscarProductoPorNombre(IN nombreProducto VARCHAR(100))
BEGIN
    SELECT nombre, calorias
    FROM bebida
    WHERE nombre = nombreProducto
    UNION ALL
    SELECT nombre, calorias
    FROM proteina
    WHERE nombre = nombreProducto
    UNION ALL
    SELECT nombre, calorias
    FROM acompannamiento
    WHERE nombre = nombreProducto
    UNION ALL
    SELECT nombre, calorias
    FROM postre
    WHERE nombre = nombreProducto;
END //

DELIMITER ;

-- CRUD BEBIDAS --------------
-- CREATE
DELIMITER //
CREATE PROCEDURE crear_bebida(
    IN nombre VARCHAR(100),
    IN carbonatadas VARCHAR(100),
    IN naturales VARCHAR(100),
    IN temperatura VARCHAR(100),
    IN desayuno VARCHAR(100),
    IN almuerzo VARCHAR(100),
    IN cena VARCHAR(100),
    IN calorias INT,
    IN precio INT
)
BEGIN
    INSERT INTO bebida (nombre, carbonatadas, naturales, temperatura, desayuno, almuerzo, cena, calorias, precio)
    VALUES (nombre, carbonatadas, naturales, temperatura, desayuno, almuerzo, cena, calorias, precio);
END //
DELIMITER ;

-- READ
DELIMITER //
CREATE PROCEDURE leer_bebida()
BEGIN
    SELECT * FROM bebida;
END //
DELIMITER ;

-- UPDATE
DELIMITER //
CREATE PROCEDURE actualizar_precio_bebida_nombre(
    IN bebida_nombre VARCHAR(50),
    IN nuevo_precio INT
)
BEGIN
    UPDATE bebida SET precio = nuevo_precio WHERE nombre = bebida_nombre;
END //
DELIMITER ;

-- DELETE
DELIMITER //
CREATE PROCEDURE eliminar_bebida_nombre(
    IN bebida_nombre VARCHAR(50)
)
BEGIN
    DELETE FROM bebida WHERE nombre = bebida_nombre;
END //
DELIMITER ;
select * from bebida;
-- CRUD Proteinas -------
-- CREATE
DELIMITER //
CREATE PROCEDURE crear_proteina(
    IN p_nombre VARCHAR(100),
    IN p_tipo VARCHAR(50),
    IN p_desayuno VARCHAR(100),
    IN p_almuerzo VARCHAR(100),
    IN p_cena VARCHAR(100),
    IN p_calorias INT,
    IN p_precio INT
)
BEGIN
    INSERT INTO proteina (nombre, tipo, desayuno, almuerzo, cena, calorias, precio)
    VALUES (p_nombre, p_tipo, p_desayuno, p_almuerzo, p_cena, p_calorias, p_precio);
END//

DELIMITER ;
-- READ

DELIMITER //

CREATE PROCEDURE leer_proteina()
BEGIN
    SELECT * FROM proteina;
END//

DELIMITER ;

-- UPDATE

DELIMITER //

CREATE PROCEDURE actualizar_proteina_nombre(
    IN p_nombre VARCHAR(50),
    IN p_precio INT
)
BEGIN
    UPDATE proteina
    SET precio = p_precio
    WHERE nombre = p_nombre;
END//

DELIMITER ;

-- DELETE

DELIMITER //

CREATE PROCEDURE eliminar_proteina_nombre(
    IN p_nombre VARCHAR(50)
)
BEGIN
    DELETE FROM proteina
    WHERE nombre = p_nombre;
END//

DELIMITER ;

-- CRUD acompannamientos ----------------

-- CREATE
DELIMITER //

CREATE PROCEDURE crear_acompannamiento(
    IN p_nombre VARCHAR(100),
    IN p_temperatura VARCHAR(100),
    IN p_carbohidratos VARCHAR(100),
    IN p_vegetales VARCHAR(100),
    IN p_desayuno VARCHAR(100),
    IN p_almuerzo VARCHAR(100),
    IN p_cena VARCHAR(100),
    IN p_calorias INT,
    IN p_precio INT
)
BEGIN
    INSERT INTO acompannamiento (nombre, temperatura, carbohidratos, vegetales, desayuno, almuerzo, cena, calorias, precio)
    VALUES (p_nombre, p_temperatura, p_carbohidratos, p_vegetales, p_desayuno, p_almuerzo, p_cena, p_calorias, p_precio);
END//

DELIMITER ;

-- READ
DELIMITER //

CREATE PROCEDURE leer_acompannamiento()
BEGIN
    SELECT * FROM acompannamiento;
END//

DELIMITER ;

-- UPDATE 
DELIMITER //

CREATE PROCEDURE actualizar_acompannamiento_nombree(
    IN p_nombre VARCHAR(50),
    IN p_precio INT
)
BEGIN
    UPDATE acompannamiento
    SET precio = p_precio
    WHERE nombre = p_nombre;
END//

DELIMITER ;

-- DELETE

DELIMITER //

CREATE PROCEDURE eliminar_acompannamiento_nombree(
    IN p_nombre VARCHAR(50)
)
BEGIN
    DELETE FROM acompannamiento
    WHERE nombre = p_nombre;
END//

DELIMITER ;

select * from acompannamiento;

-- CRUD postre ------------

-- CREATE
DELIMITER //

CREATE PROCEDURE crear_postre(
    IN p_nombre VARCHAR(100),
    IN p_lacteo VARCHAR(100),
    IN p_frutas VARCHAR(100),
    IN p_desayuno VARCHAR(100),
    IN p_almuerzo VARCHAR(100),
    IN p_cena VARCHAR(100),
    IN p_calorias INT,
    IN p_precio INT
)
BEGIN
    INSERT INTO postre (nombre, lacteo, frutas, desayuno, almuerzo, cena, calorias, precio)
    VALUES (p_nombre, p_lacteo, p_frutas, p_desayuno, p_almuerzo, p_cena, p_calorias, p_precio);
END//

DELIMITER ;

-- READ
DELIMITER //

CREATE PROCEDURE leer_postre()
BEGIN
    SELECT * FROM postre;
END//

DELIMITER ;

-- UPDATE 
DELIMITER //

CREATE PROCEDURE actualizar_postre_nombre(
    IN p_nombre VARCHAR(50),
    IN p_precio INT
)
BEGIN
    UPDATE postre
    SET precio = p_precio
    WHERE nombre = p_nombre;
END//

DELIMITER ;

-- DELETE

DELIMITER //

CREATE PROCEDURE eliminar_postre_nombre(
    IN p_nombre VARCHAR(50)
)
BEGIN
    DELETE FROM postre
    WHERE nombre = p_nombre;
END//

DELIMITER ;

SELECT * FROM postre;
-- Funciones Combo -----------------

DELIMITER //

CREATE PROCEDURE leer_combos()
BEGIN
    SELECT * FROM combo;
END;

//
DELIMITER ;

-- Funciones Plato ----------------------

DELIMITER //

CREATE PROCEDURE leer_platos()
BEGIN
    SELECT * FROM plato;
END;

//
DELIMITER ;

-- FACTURA ----------------------
DELIMITER //
CREATE PROCEDURE crear_factura(
    in p_fecha DATE,
    in p_monto_total DOUBLE
)
BEGIN
    INSERT INTO factura (fecha, monto_total) VALUES (p_fecha, p_monto_total);
END //
DELIMITER ;

DELIMITER //

CREATE PROCEDURE leer_facturas()
BEGIN
    SELECT * FROM factura;
END;

//
DELIMITER ;
select * from factura;

-- Orden --------------
DELIMITER //

CREATE PROCEDURE leer_ordenes()
BEGIN
    SELECT * FROM orden;
END;

//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE crear_orden(
    in p_fecha DATE,
    in p_detalle VARCHAR(250)
)
BEGIN
    INSERT INTO orden (fecha, detalle) VALUES (p_fecha, p_detalle);
END //
DELIMITER ;



select * from factura;
select * from orden;
select * from postre;
select * from proteina;
select * from acompannamiento;
select * from bebida;
select * from combo;

-- drop procedure leer_combos;
-- drop table acompannamiento;
-- drop table bebida;
-- drop table postre;
-- drop table proteina;
