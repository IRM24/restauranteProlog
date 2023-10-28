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

select * from plato;
select * from combo;


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


call leer_combos();

delete from combo;

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
